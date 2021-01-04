import os
import networkx as nx
import pickle
import random
import matplotlib.pyplot as plt
import numpy as np

"""
Always use self for the first argument to instance methods.
--> Instance method are methods which require an object of its class to be created before it can be called.
--> Static methods, much like class methods, are methods that are bound to a class rather than its object. They do not require a class instance creation. So, they are not dependent on the state of the object.

Always use cls for the first argument to class methods.

"""
SEED = 0
np.random.seed(SEED)
random.seed(SEED)

save_pic_dir = 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Plots/'


class Micromodel:

    def __init__(self, number_of_nodes, average_degree,
                 activation_probability, inactivation_probability, activation_threshold, inactivation_threshold,
                 timesteps, inactivity_time,
                 potentially_active=None):  # hier definiere ich die Paramter bzw. die Eigenschaften die mein Objekt haben soll

        p = average_degree / (number_of_nodes - 1)  # das ist der Verbindungsgrad
        if not potentially_active:  # will execute if potentially_active is any kind of zero,empty container oe false(None bedeutet no value, an empty list is zero values), wenn es also nicht gegeben ist, dann ist es eben  die number of nodes
            potentially_active = number_of_nodes  # oder auch gesagt "if bar is not None"

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

        self._results = {"number_of_nodes": number_of_nodes,
                         "average_degree": average_degree,
                         "potentially_active": potentially_active,
                         "data": {}}

    @classmethod
    def load(cls,
             input_file):  # cls weil es and die Klasse richtet .self richtet sich an das objekt, ohne vorne was dran sind statische Methoden

        data = pickle.load(open(input_file,
                                "rb"))  # .load  Deserializes from an open-like object.-> ist Teil des API's weil es eben den Datanaustausch ermöglicht-> ist halt die Schnittstelle/der Kellner
        number_of_nodes = data["number_of_nodes"]  # 'rb' steht für Read mode und Binary mode; umgekehrt 'wb' für Writing Mode und Binary Mode
        average_degree = data["average_degree"]
        potentially_active = data["potentially_active"]
        activation_probability = data["activation_probability "]
        inactivation_probability = data["inactivation_probability"]
        activation_threshold = data["activation_threshold"]
        inactivation_threshold = data["inactivation_threshold"]
        timesteps = data["timesteps "]
        inactivity_time = data["inactivity_time"]

        model = Micromodel(number_of_nodes=number_of_nodes,
                           average_degree=average_degree,
                           potentially_active=potentially_active,
                           activation_probability=activation_probability,
                           inactivation_probability=inactivation_probability,
                           activation_threshold=activation_threshold,
                           inactivation_threshold=inactivation_threshold,
                           timesteps=timesteps,
                           inactivity_time=inactivity_time)
        model._results = data

        return model

    # hier werden im Grunde Daten geladen, in einem "model" sortiert und zurückgegeben
    """
    Pickling is the process whereby a Python object hierarchy is converted into a byte stream (usually not human readable) to be written to a file, this is also known as Serialization.
    Unpickling/deserialisation is the reverse operation, whereby a byte stream is converted back into a working Python object hierarchy.
    Pickle is operationally simplest way to store the object. The Python Pickle module is an object-oriented way to store objects directly in a special storage format.
    #pickle ist ein serializer oder deserializer,In serialization, an object is transformed into a format that can be stored, so as to be able to deserialize it later and recreate the original object from the serialized format.
    JSON ist ein ähnliches data-interchange format(we store and exchange data)-> convert Python dictionary to JSON and write it to a text file.
    JSON is a text serialization format; pickle is a binary serialization format;--> https://docs.python.org/3/library/pickle.html
    """

    def _one_run(self, certainly_active):  # mit der Methode mache ich alles mit initially actives, potentially actives und newly actives

        if certainly_active not in self._results["data"].keys():
            self._results["data"][certainly_active] = []
            # wenn certainly active nicht in den daten enthalten sind, füge ich diese Spalte in die Daten mit ein

        if not certainly_active:  # wenn certainly acitve not None, dann wird mit dem ersten wert ([0]) gefüllt. liegt daran, weil die liste auch nur 1 lang ist
            self._results["data"][certainly_active].append([0])
            return

            # Use fast_gnp_random_graph since it performs better than
        # erdos_renyi_graph
        network = nx.fast_gnp_random_graph(n=self._N,
                                           p=self._p)  # gibt einen Erdős-Rényi graph or a binomial graph zurück, n = number of nodes, p = probability for edge creation, seed (int, optional) – Seed for random number generator (default=None).
        degree = network.degree()  # Return the degree of a node or nodes.The node degree is the number of edges adjacent to that node.

        potentially_active_nodes = np.random.choice(self._N,
                                                    # Generates a random sample from a given 1-D array-> macht zufälligen 1D array von potentially active nodes aus N nodes insgesamt,
                                                    self._potentially_active,
                                                    replace=False)

        initially_active_nodes = np.random.choice(potentially_active_nodes,
                                                  # aus den potentially active nodes werden zufällig viele eben als initially active ausgewählt
                                                  certainly_active,
                                                  replace=False)

        active_nodes = set()  # set () returns;a set constructed from the given iterable parameter or an ampty set if no parameters are passed
        inactive_nodes = set(set(potentially_active_nodes).difference(set(initially_active_nodes)))
        certainly_active_nodes = set(initially_active_nodes)

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

            newly_active_nodes = set()
            newly_inactive_nodes = set()

            for node in inactive_nodes:
                nbs = network.neighbors(node)
                active_neighbors = active_nodes.intersection(
                    nbs)  # gibt mir alle Nachbarn eines nicht aktiven nodes aus
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
                    currently_active[-self._inactivity_time:]):
                break

        self._results["data"][certainly_active].append(currently_active)

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
                self._one_run(
                    _c)  # hier geht er dann die gesamte obere Methode durch, für jeden Wert von ceratainly active führe ich das durch-> heißt one run, weil ich es einmal mache
                #  print(current_run) -> gibt 50 weil ich 10 Werte für ceratinly actives habe und 5 runs
                current_run += 1

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
        # fig.tight_layout()
        file_dir = save_pic_dir + '{0}certainly_active_plots'.format(certainly_active)
        fig.savefig(file_dir)
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
    m = Micromodel(number_of_nodes=1000, average_degree=20,
                   activation_probability=0.1, inactivation_probability=0.1,
                   activation_threshold=0.25, inactivation_threshold=0.1,
                   timesteps=100, inactivity_time=100,
                   potentially_active=700)  # das ist jetzt mein Objekt auf das die Attribute und Methoden wirken können
    m.run(np.arange(100, 160, 10), 5)  # Return evenly spaced values within a given interval., 5 runs
    print('Results')
    m.print_results(110)
    print('Aggregate')
    print(m.aggregate())
    m.plot_results(100)
    m.plot_results(110)
    m.plot_results(120)
    m.plot_results(130)
    m.plot_results(140)

