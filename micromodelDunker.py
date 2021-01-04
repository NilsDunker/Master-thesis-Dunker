import os
import networkx as nx
import pickle
import random
import matplotlib.pyplot as plt
import numpy as np
import PIL


SEED = 0
np.random.seed(SEED)
random.seed(SEED)

file_path = os.path.dirname(os.path.abspath(__file__))
project_path = os.path.abspath(os.path.join(file_path, os.path.pardir))
data_path = os.path.join(project_path, 'Data/data.txt')

save_pic_dir = file_path + '/Plots/'


class Micromodel:

    def __init__(self, number_of_nodes, average_degree,
                 activation_probability, inactivation_probability, activation_threshold, inactivation_threshold,
                 timesteps, inactivity_time, gif_duration, waxman_alpha, waxman_beta, waxman_L,
                 potentially_active=None):  # hier definiere ich die Paramter bzw. die Eigenschaften die mein Objekt haben soll

        p = average_degree / (number_of_nodes - 1)  # das ist der Verbindungsgrad
        if not potentially_active:  # will execute if potentially_active is any kind of zero,empty container oe false(None bedeutet no value, an empty list is zero values), wenn es also nicht gegeben ist, dann ist es eben  die number of nodes
            potentially_active = number_of_nodes  # oder auch gesagt "if bar is not None"

        self.timestep_counter = 0
        self._N = number_of_nodes
        self._average_degree = average_degree
        self._p = p  # Das ist die Wahrscheinlichkeit für eine edge creation
        self._potentially_active = potentially_active
        self._activation_probability = activation_probability
        self._inactivation_probability = inactivation_probability
        self._activation_threshold = activation_threshold
        self._inactivation_threshold = inactivation_threshold
        self._timesteps = timesteps
        self._inactivity_time = inactivity_time
        self._gif_duration = gif_duration
        self._waxman_alpha = waxman_alpha
        self._waxman_beta = waxman_beta
        self._waxman_L = waxman_L

        self._results = {"number_of_nodes": number_of_nodes,
                         "average_degree": average_degree,
                         "potentially_active": potentially_active,
                         "data": {}}

    @classmethod
    def load(cls,
             input_file):  # cls weil es and die Klasse richtet .self richtet sich an das objekt, ohne vorne was dran sind statische Methoden

        data = pickle.load(open(input_file,
                                "rb"))  # .load  Deserializes from an open-like object.-> ist Teil des API's weil es eben den Datanaustausch ermöglicht-> ist halt die Schnittstelle/der Kellner
        number_of_nodes = data[
            "number_of_nodes"]  # 'rb' steht für Read mode und Binary mode; umgekehrt 'wb' für Writing Mode und Binary Mode
        average_degree = data["average_degree"]
        potentially_active = data["potentially_active"]
        activation_probability = data["activation_probability "]
        inactivation_probability = data["inactivation_probability"]
        activation_threshold = data["activation_threshold"]
        inactivation_threshold = data["inactivation_threshold"]
        timesteps = data["timesteps "]
        inactivity_time = data["inactivity_time"]
        gif_duration = data['gif_duration']

        model = Micromodel(number_of_nodes=number_of_nodes,
                           average_degree=average_degree,
                           potentially_active=potentially_active,
                           activation_probability=activation_probability,
                           inactivation_probability=inactivation_probability,
                           activation_threshold=activation_threshold,
                           inactivation_threshold=inactivation_threshold,
                           timesteps=timesteps,
                           inactivity_time=inactivity_time,
                           gif_duration=gif_duration)
        model._results = data

        return model

    def _one_run(self,
                 certainly_active):  # mit der Methode mache ich alles mit initially actives, potentially actives und newly actives

        if certainly_active not in self._results["data"].keys():
            self._results["data"][certainly_active] = []

        if not certainly_active:
            self._results["data"][certainly_active].append([0])
            return

        network = nx.waxman_graph(self._N, self._Waxman_beta, self._Waxman_alpha, self._Waxman_L)
        pos = nx.get_node_attributes(network, "pos")
        pos_sorted = {k: v for k, v in sorted(pos.items(), key=lambda item: item[
            1])}  # In dem Schritt werden die Positionen sortiert um anschließend auf die kleinsten x Werte zugreifen zu können. So erzeuge ich eine "Küste" mit certainly active nodes
        pos_sorted_keys = list(pos_sorted.keys())
        initially_active_nodes = []  # Die initially active nodes sollen sich alle an einem linken Rand befinden
        for i in range(0, certainly_active):
            initially_active_nodes.append(pos_sorted_keys[i])

        degree = network.degree()

        potentially_active_nodes = np.random.choice(self._N,
                                                    self._potentially_active,
                                                    replace=False)

        # initially_active_nodes = np.random.choice(potentially_active_nodes,
        #                                          certainly_active,
        #                                          replace=False)

        all_nodes = np.random.choice(self._N, self._N, replace=False)

        all_nodes_set = set(all_nodes)
        certainly_inactive_nodes = all_nodes_set.difference(set(potentially_active_nodes))
        certainly_active_nodes = set(initially_active_nodes)

        active_nodes = set()
        inactive_nodes = set(set(potentially_active_nodes).difference(set(initially_active_nodes)))

        newly_active_nodes = set(initially_active_nodes)
        newly_inactive_nodes = inactive_nodes.difference(initially_active_nodes)

        currently_active = []
        currently_inactive = []

        for timesteps in range(0, self._timesteps):

            active_nodes.update(newly_active_nodes)
            inactive_nodes.update(newly_inactive_nodes)

            active_nodes.difference_update(newly_inactive_nodes)
            inactive_nodes.difference_update(newly_active_nodes)

            inactivatable_nodes = active_nodes.difference(certainly_active_nodes)

            currently_active.append(len(active_nodes))
            currently_inactive.append(len(inactive_nodes.difference(active_nodes)))

            newly_active_nodes = set()  # nach jedem step wird newly active wieder auf 0 gesetzt um nur die neu hinzugefügten zu adden
            newly_inactive_nodes = set()

            for node in inactive_nodes:
                nbs = network.neighbors(node)
                active_neighbors = active_nodes.intersection(nbs)
                if len(active_neighbors) > (self._activation_threshold * degree[node]) \
                        and np.random.rand() < self._activation_probability:
                    newly_active_nodes.add(node)

            for node in inactivatable_nodes:
                nbs = network.neighbors(node)
                active_neighbors = active_nodes.intersection(nbs)
                if len(active_neighbors) <= (self._inactivation_threshold * degree[node]) \
                        and np.random.rand() < self._inactivation_probability:
                    newly_inactive_nodes.add(node)

            if len(currently_active) > 15 and set(currently_active[-1:]) == set(
                    # for schleife wird abgebrochen wenn zu lange nichts passiert
                    currently_active[-self._inactivity_time:]):
                break

            self.timestep_counter = self.timestep_counter + 1  # der ist dafür da um anderen Methoden auch zu sagen wann sie aufhören sollen

            self.create_frame(certainly_active_nodes, certainly_inactive_nodes, network, pos, inactive_nodes,
                              active_nodes, timesteps, certainly_active)

        self._results["data"][certainly_active].append(currently_active)

    def create_frame(self, certainly_active_nodes, certainly_inactive_nodes, network, pos, inactive_nodes, active_nodes,
                     timesteps, certainly_active):

        nx.draw_networkx_nodes(network, pos, nodelist=list(certainly_active_nodes), node_color='blue',
                               node_size=20)
        nx.draw_networkx_nodes(network, pos, nodelist=list(certainly_inactive_nodes), node_color='black',
                               node_size=20)
        nx.draw_networkx_nodes(network, pos, nodelist=list(inactive_nodes), node_color='magenta', node_size=20)
        nx.draw_networkx_nodes(network, pos, nodelist=list(active_nodes.difference(certainly_active_nodes)),
                               node_color='cyan', node_size=20)

        nx.draw_networkx_edges(network, pos, width=0.7, alpha=0.8)

        plt.xlim(-0.05, 1.05)
        plt.ylim(-0.05, 1.05)
        plt.axis("off")
        plt.suptitle('Network as Random Geometric Graph')
        plt.title('Timestep {0}'.format(timesteps + 1))

        # fig = plt.figure(figsize=(8, 8))
        # ax = fig.add_subplot(111)
        # ax.text(0.1, 0.9, '{0} total nodes'.format(self._N), fontsize=10)
        # ax.text(0.1, 0.85, '{0} certainly active nodes'.format(certainly_active), fontsize=10)
        # ax.text(0.1, 0.8, '{0} certainly inactive nodes'.format(len(certainly_inactive_nodes)), fontsize=10)

        plt.tight_layout()
        plt.savefig(save_pic_dir + 'RGG_GIF/jpgs/timestep{0}_{1}.jpg'.format(timesteps, certainly_active))
        plt.clf()
        plt.show()

    def create_gif(self, c):  # komprimiert die Frames zu einem GIF

        assert type(c) is not float

        image_frames = []
        time_steps = np.arange(0, self.timestep_counter)
        save_dir = save_pic_dir + 'RGG_GIF/'

        for t in time_steps:
            new_frame = PIL.Image.open(save_dir + 'jpgs/timestep' + str(t) + '_' + str(c) + '.jpg')
            image_frames.append(new_frame)

        image_frames[0].save(save_dir + 'Waxman_Graph{0}_Activ-Tresh{1}.gif'.format(c, self._activation_threshold),
                             format='GIF',
                             append_images=image_frames[1:],
                             save_all=True, duration=self._gif_duration,
                             loop=0)

    def run(self, certainly_active, n_runs=1):

        assert type(certainly_active) is not float  # assert überprüft ob eine bestimmte Bedingung wirklich erfüllt ist

        if type(certainly_active) is int:
            certainly_active = [certainly_active]

        total_runs = len(certainly_active) * n_runs
        current_run = 1

        for _c in certainly_active:  # also mit dem Intervall, für die Werte 100, 200, 300, ...900
            for _ in range(n_runs):  # für jeden wert von certainly active dann 5 mal das hier
                progress = current_run / total_runs * 100  # zeigt mir den Progress in % an
                print("Running: {:5.2f} % done".format(progress), end="\r")
                self._one_run(_c)
                current_run += 1
            self.create_gif(_c)
            self.timestep_counter = 0

    def print_results(self, certainly_active):

        for result in self._results["data"][certainly_active]:
            print(result)

    def plot_results(self, certainly_active):

        fig, ax = plt.subplots()
        for result in self._results["data"][certainly_active]:
            x = []
            y = []
            for i in range(0, len(
                    result)):  # result ist im Endeffekt die ganze Reihe der cerainly actives-> also darf die for schleife nur bis dahin gehen
                x += [i]  # gibt mir den Index des Wertes
                y += [result[i]]  # gibt den Wert zum zugehörigen Index

            ax.plot(x, y)

        ax.grid()
        ax.set(xlabel='Discrete Timesteps', ylabel='Active Nodes',
               title='Time development of {0} initial certainly active nodes.\n'
                     ' {1} total ,{2} potentially active nodes'.format(
                   certainly_active, self._N, self._potentially_active))
        fig.tight_layout()
        file_dir = save_pic_dir + '{0}certainly_active_plots'.format(certainly_active)
        fig.savefig(file_dir)
        print('>>> Picture write to' + file_dir)
        plt.show()

    def aggregate(self):  # Gesamtheit/Summe-> alles in einem array darstellen

        data = self._results["data"]
        certainly_active = list(data.keys())
        certainly_active.sort()  # sortiert die certainly actives einfach der reihe nach,alphabetisch oder individuell
        mean = [np.mean([d[-1] for d in data[c]]) for c in certainly_active]  # takes the mean along a axis
        std = [np.std([d[-1] for d in data[c]]) for c in certainly_active]

        return np.stack((certainly_active, mean, std),
                        axis=1)  # function is used to join a sequence of same dimension arrays along a new axis.The axis parameter specifies the index of the new axis in the dimensions of the result. For example, if axis=0 it will be the first dimension and if axis=-1 it will be the last dimension.

    def emergent_threshold_distribution(self, which="equilibrium",
                                        max_len=None):  # das ist der gesamte share einer Population, Die Methode verstehe ich noch nicht so ganz

        data = self._results["data"]
        pot = self._potentially_active

        all_x = []
        all_y = []

        if which == "equilibrium":
            for cert, entries in data.items():
                for entry in entries:
                    if len(entry) > 1:
                        all_x.append(entry[0])
                        all_y.append((entry[1] - cert) / (pot - cert))
                    if len(entry) > 2:
                        all_x.append(entry[-2])
                        all_y.append((entry[-1] - cert) / (pot - cert))

            all_x = np.array(all_x) / self._N
            all_y = np.array(all_y)

        if which == "off_equilibrium":
            for cert, entries in data.items():
                for entry in entries:
                    if len(entry) > 3:
                        entry = np.array(entry)
                        all_x.append(entry[1:-2])
                        all_y.append((entry[2:-1] - cert) / (pot - cert))

            if len(all_x):
                all_x = np.concatenate(all_x) / self._N  # Join a sequence of arrays along an existing axis.
                all_y = np.concatenate(all_y)

        if max_len and len(all_x):
            choice = np.random.choice(len(all_x), min(max_len, len(all_x)), replace=False)
            all_x = all_x[choice]
            all_y = all_y[choice]

        return all_x, all_y

    def save(self, output_folder="./", output_file=None):

        if "/" in output_file:
            output_folder, output_file = output_file.rsplit("/", 1)

        if output_folder[-1] != "/":
            output_folder += "/"

        if not os.path.exists(output_folder):
            os.makedirs(output_folder)

        if output_file is None:
            output_file = "granovetter_micro_N{0}_K{1}_P{2}.p".format(
                self._N, self._average_degree, self._potentially_active)

        pickle.dump(self._results, open(output_folder + output_file, "wb"))


if __name__ == "__main__":  # Python files can act as either reusable modules, or as standalone programs-> ich könnte also "micromodel" als Modul importieren um von ihm gebracuh zu machen-->http://effbot.org/pyfaq/tutor-what-is-if-name-main-for.htm
    print("Potentially active<N")
    m = Micromodel(number_of_nodes=2000, average_degree=5,
                   activation_probability=0.1, inactivation_probability=0.1,
                   activation_threshold=0.1, inactivation_threshold=0.1,
                   timesteps=250, inactivity_time=100, gif_duration=50,
                   waxman_beta=0.45, waxman_alpha=0.001, waxman_L=0.01,
                   potentially_active=1400)

    m.run(50, 1)

    # m.print_results(4)
    # print(m.aggregate())
    # m.plot_results(100)

# todo: Ist der average Degree überhaupt richtig eingebaut?
# todo: es scheint eher umgekehrt zu sein. Je weiter weg, desto wahrscheinlicher die connection
