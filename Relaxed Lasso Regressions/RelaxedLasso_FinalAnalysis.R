# read and load data
library(glmnet)
csv_global_all <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/Global_all_Datframe_100000Simulations.csv'
csv_global_only_tipped <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/Global_Only_tipped_Datframe_53178Simulations.csv'
data_global_all <- read.csv(file = csv_global_all)
data_global_only_tipped <- read.csv(file = csv_global_only_tipped) 
data_global_all[data_global_all==-2] <- Inf

csv_USA_all <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/USA_all_Datframe_100000Simulations.csv'
csv_USA_only_tipped <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/USA_Only_tipped_Datframe_31093Simulations.csv'
data_USA_all <- read.csv(file = csv_USA_all)
data_USA_only_tipped <- read.csv(file = csv_USA_only_tipped) 
data_USA_all[data_USA_all==-2] <- Inf

csv_RUS_all <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/RUS_all_Datframe_100000Simulations.csv'
csv_RUS_only_tipped <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/RUS_Only_tipped_Datframe_23138Simulations.csv'
data_RUS_all <- read.csv(file = csv_RUS_all)
data_RUS_only_tipped <- read.csv(file = csv_RUS_only_tipped) 
data_RUS_all[data_RUS_all==-2] <- Inf

csv_CHN_all <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/CHN_all_Datframe_100000Simulations.csv'
csv_CHN_only_tipped <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/CHN_Only_tipped_Datframe_46411Simulations.csv'
data_CHN_all <- read.csv(file = csv_CHN_all)
data_CHN_only_tipped <- read.csv(file = csv_CHN_only_tipped) 
data_CHN_all[data_CHN_all==-2] <- Inf

csv_IND_all <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/IND_all_Datframe_100000Simulations.csv'
csv_IND_only_tipped <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/IND_Only_tipped_Datframe_61349Simulations.csv'
data_IND_all <- read.csv(file = csv_IND_all)
data_IND_only_tipped <- read.csv(file = csv_IND_only_tipped) 
data_IND_all[data_IND_all==-2] <- Inf

csv_BRA_all <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/BRA_all_Datframe_100000Simulations.csv'
csv_BRA_only_tipped <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/BRA_Only_tipped_Datframe_60532Simulations.csv'
data_BRA_all <- read.csv(file = csv_BRA_all)
data_BRA_only_tipped <- read.csv(file = csv_BRA_only_tipped) 
data_BRA_all[data_BRA_all==-2] <- Inf

csv_EU_all <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/EU_all_Datframe_100000Simulations.csv'
csv_EU_only_tipped <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/EU_Only_tipped_Datframe_39849Simulations.csv'
data_EU_all <- read.csv(file = csv_EU_all)
data_EU_only_tipped <- read.csv(file = csv_EU_only_tipped) 
data_EU_all[data_EU_all==-2] <- Inf

csv_JPN_all <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/JPN_all_Datframe_100000Simulations.csv'
csv_JPN_only_tipped <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/JPN_Only_tipped_Datframe_56740Simulations.csv'
data_JPN_all <- read.csv(file = csv_JPN_all)
data_JPN_only_tipped <- read.csv(file = csv_JPN_only_tipped) 
data_JPN_all[data_JPN_all==-2] <- Inf


# define all possible variables
# Start with the variables that are the same for all Simulations

# global variables for all simulations and the only tipped ones
global_tipped_or_not <- data_global_all$is_tipped
data_global_all[2]<- NULL
global_t_tip_all <- data_global_all$t_tip
global_tipping_transformed_all <- 1/data_global_all$t_tip
data_global_all[2]<- NULL

data_global_all$global_theta_a_all <- data_global_all$Theta_a
data_global_all$global_theta_a_all_log <- log(data_global_all$Theta_a)
data_global_all$global_theta_a_all_log_minus_1 <- log(1 - data_global_all$Theta_a)
data_global_all$global_1_durch_theta_a_all <- 1/(data_global_all$Theta_a)
data_global_all[2]<- NULL

data_global_all$global_theta_d_all <- data_global_all$Theta_d
data_global_all$global_theta_d_all_log <- log(data_global_all$Theta_d)
data_global_all$global_theta_d_all_log_minus_1 <- log(1 - data_global_all$Theta_d)
data_global_all[3]<- NULL

data_global_all$global_p_a_all <- data_global_all$p_a
data_global_all$global_p_a_all_log <- log(data_global_all$p_a)
data_global_all$global_p_a_all_log_minus_1 <- log(1 - data_global_all$p_a)
data_global_all[2]<- NULL

data_global_all$global_p_d_all <- data_global_all$p_d
data_global_all$global_p_d_all_log <- log(data_global_all$p_d)
data_global_all$global_p_d_all_log_minus_1 <- log(1 - data_global_all$p_d)
data_global_all[2]<- NULL

data_global_all$global_p_e_all <- data_global_all$p_e
data_global_all$global_p_e_all_log <- log(data_global_all$p_e)
data_global_all$global_p_e_all_log_minus_1 <- log(1 - data_global_all$p_e)
data_global_all[2]<- NULL

data_global_all$global_p_en_all <- data_global_all$p_en
data_global_all$global_p_en_all_log <- log(data_global_all$p_en)
data_global_all$global_p_en_all_log_minus_1 <- log(1 - data_global_all$p_en)
data_global_all[2]<- NULL

data_global_all$global_p_ra_all <- data_global_all$p_ra
data_global_all$global_p_ra_all_log <- log(data_global_all$p_ra)
data_global_all$global_p_ra_all_log_minus_1 <- log(1 - data_global_all$p_ra)
data_global_all[2]<- NULL

data_global_all$global_p_rd_all <- data_global_all$p_rd
data_global_all$global_p_rd_all_log <- log(data_global_all$p_rd)
data_global_all$global_p_rd_all_log_minus_1 <- log(1 - data_global_all$p_rd)
data_global_all[2]<- NULL

data_global_all$global_n_c_all <- data_global_all$n_c
data_global_all[2]<- NULL
data_global_all$global_n_p_all <- data_global_all$n_p
data_global_all[2]<- NULL
data_global_all$global_n_e_all <- data_global_all$n_e
data_global_all[2]<- NULL
data_global_all$global_N_all <- data_global_all$N
data_global_all[2]<- NULL
data_global_all$global_APL_all <- data_global_all$APL
data_global_all[2]<- NULL

data_global_all$global_all_extra_1 <- data_global_all$global_p_a_all * data_global_all$global_n_p_all
data_global_all$global_all_extra_2 <- data_global_all$global_p_e_all * data_global_all$global_n_e_all
data_global_all$global_all_extra_3 <- data_global_all$global_p_e_all * data_global_all$global_n_e_all * data_global_all$global_n_p_all
data_global_all$global_all_extra_4 <- data_global_all$global_p_d_all * data_global_all$global_n_c_all

data_global_all$global_all_certainly_1 <- log((data_global_all$global_N_all/2) - data_global_all$global_n_c_all)
data_global_all$global_all_certainly_2 <- log(data_global_all$global_n_c_all + ((data_global_all$global_n_p_all - data_global_all$global_n_c_all)/2))
data_global_all[1]<- NULL

# Global Only Tipped
global_t_tip_only_tipped <- data_global_only_tipped$t_tip
data_global_only_tipped[2]<- NULL

data_global_only_tipped$global_theta_a_only_tipped <- data_global_only_tipped$Theta_a
data_global_only_tipped$global_theta_a_only_tipped_log <- log(data_global_only_tipped$Theta_a)
data_global_only_tipped$global_theta_a_only_tipped_log_minus_1 <- log(1 - data_global_only_tipped$Theta_a)
data_global_only_tipped[2]<- NULL

data_global_only_tipped$global_theta_d_only_tipped <- data_global_only_tipped$Theta_d
data_global_only_tipped$global_theta_d_only_tipped_log <- log(data_global_only_tipped$Theta_d)
data_global_only_tipped$global_theta_d_only_tipped_log_minus_1 <- log(1 - data_global_only_tipped$Theta_d)
data_global_only_tipped[3]<- NULL

data_global_only_tipped$global_p_a_only_tipped <- data_global_only_tipped$p_a
data_global_only_tipped$global_p_a_only_tipped_log <- log(data_global_only_tipped$p_a)
data_global_only_tipped$global_p_a_only_tipped_log_minus_1 <- log(1 - data_global_only_tipped$p_a)
data_global_only_tipped[2]<- NULL

data_global_only_tipped$global_p_d_only_tipped <- data_global_only_tipped$p_d
data_global_only_tipped$global_p_d_only_tipped_log <- log(data_global_only_tipped$p_d)
data_global_only_tipped$global_p_d_only_tipped_log_minus_1 <- log(1 - data_global_only_tipped$p_d)
data_global_only_tipped[2]<- NULL

data_global_only_tipped$global_p_e_only_tipped <- data_global_only_tipped$p_e
data_global_only_tipped$global_p_e_only_tipped_log <- log(data_global_only_tipped$p_e)
data_global_only_tipped$global_p_e_only_tipped_log_minus_1 <- log(1 - data_global_only_tipped$p_e)
data_global_only_tipped[2]<- NULL

data_global_only_tipped$global_p_en_only_tipped <- data_global_only_tipped$p_en
data_global_only_tipped$global_p_en_only_tipped_log <- log(data_global_only_tipped$p_en)
data_global_only_tipped$global_p_en_only_tipped_log_minus_1 <- log(1 - data_global_only_tipped$p_en)
data_global_only_tipped[2]<- NULL

data_global_only_tipped$global_p_ra_only_tipped <- data_global_only_tipped$p_ra
data_global_only_tipped$global_p_ra_only_tipped_log <- log(data_global_only_tipped$p_ra)
data_global_only_tipped$global_p_ra_only_tipped_log_minus_1 <- log(1 - data_global_only_tipped$p_ra)
data_global_only_tipped[2]<- NULL

data_global_only_tipped$global_p_rd_only_tipped <- data_global_only_tipped$p_rd
data_global_only_tipped$global_p_rd_only_tipped_log <- log(data_global_only_tipped$p_rd)
data_global_only_tipped$global_p_rd_only_tipped_log_minus_1 <- log(1 - data_global_only_tipped$p_rd)
data_global_only_tipped[2]<- NULL

data_global_only_tipped$global_n_c_only_tipped <- data_global_only_tipped$n_c
data_global_only_tipped[2]<- NULL
data_global_only_tipped$global_n_p_only_tipped <- data_global_only_tipped$n_p
data_global_only_tipped[2]<- NULL
data_global_only_tipped$global_n_e_only_tipped <- data_global_only_tipped$n_e
data_global_only_tipped[2]<- NULL
data_global_only_tipped$global_N_only_tipped <- data_global_only_tipped$N
data_global_only_tipped[2]<- NULL

data_global_only_tipped$global_APL_only_tipped <- data_global_only_tipped$APL
data_global_only_tipped[2]<- NULL

data_global_only_tipped$global_only_tipped_extra_1 <- data_global_only_tipped$global_p_a_only_tipped * data_global_only_tipped$global_n_p_only_tipped
data_global_only_tipped$global_only_tipped_extra_2 <- data_global_only_tipped$global_p_e_only_tipped * data_global_only_tipped$global_n_e_only_tipped
data_global_only_tipped$global_only_tipped_extra_3 <- data_global_only_tipped$global_p_e_only_tipped * data_global_only_tipped$global_n_e_only_tipped * data_global_only_tipped$global_n_p_only_tipped
data_global_only_tipped$global_only_tipped_extra_4 <- data_global_only_tipped$global_p_d_only_tipped * data_global_only_tipped$global_n_c_only_tipped

data_global_only_tipped$global_only_tipped_certainly_1 <- log((data_global_only_tipped$global_N_only_tipped/2) - data_global_only_tipped$global_n_c_only_tipped)
data_global_only_tipped$global_only_tipped_certainly_2 <- log(data_global_only_tipped$global_n_c_only_tipped + ((data_global_only_tipped$global_n_p_only_tipped - data_global_only_tipped$global_n_c_only_tipped)/2))
data_global_only_tipped[1]<- NULL

# ---USA---
USA_tipped_or_not <- data_USA_all$is_tipped
data_USA_all[2]<- NULL
USA_t_tip_all <- data_USA_all$t_tip
USA_tipping_transformed_all <- 1/data_USA_all$t_tip
data_USA_all[2]<- NULL

data_USA_all$USA_theta_a_all <- data_USA_all$Theta_a
data_USA_all$USA_theta_a_all_log <- log(data_USA_all$Theta_a)
data_USA_all$USA_theta_a_all_log_minus_1 <- log(1 - data_USA_all$Theta_a)
data_USA_all[2]<- NULL

data_USA_all$USA_theta_d_all <- data_USA_all$Theta_d
data_USA_all$USA_theta_d_all_log <- log(data_USA_all$Theta_d)
data_USA_all$USA_theta_d_all_log_minus_1 <- log(1 - data_USA_all$Theta_d)
data_USA_all[3]<- NULL

data_USA_all$USA_p_a_all <- data_USA_all$p_a
data_USA_all$USA_p_a_all_log <- log(data_USA_all$p_a)
data_USA_all$USA_p_a_all_log_minus_1 <- log(1 - data_USA_all$p_a)
data_USA_all[2]<- NULL

data_USA_all$USA_p_d_all <- data_USA_all$p_d
data_USA_all$USA_p_d_all_log <- log(data_USA_all$p_d)
data_USA_all$USA_p_d_all_log_minus_1 <- log(1 - data_USA_all$p_d)
data_USA_all[2]<- NULL

data_USA_all$USA_p_e_all <- data_USA_all$p_e
data_USA_all$USA_p_e_all_log <- log(data_USA_all$p_e)
data_USA_all$USA_p_e_all_log_minus_1 <- log(1 - data_USA_all$p_e)
data_USA_all[2]<- NULL

data_USA_all$USA_p_en_all <- data_USA_all$p_en
data_USA_all$USA_p_en_all_log <- log(data_USA_all$p_en)
data_USA_all$USA_p_en_all_log_minus_1 <- log(1 - data_USA_all$p_en)
data_USA_all[2]<- NULL

data_USA_all$USA_p_ra_all <- data_USA_all$p_ra
data_USA_all$USA_p_ra_all_log <- log(data_USA_all$p_ra)
data_USA_all$USA_p_ra_all_log_minus_1 <- log(1 - data_USA_all$p_ra)
data_USA_all[2]<- NULL

data_USA_all$USA_p_rd_all <- data_USA_all$p_rd
data_USA_all$USA_p_rd_all_log <- log(data_USA_all$p_rd)
data_USA_all$USA_p_rd_all_log_minus_1 <- log(1 - data_USA_all$p_rd)
data_USA_all[2]<- NULL

data_USA_all$USA_n_c_all <- data_USA_all$n_c
data_USA_all[2]<- NULL
data_USA_all$USA_n_p_all <- data_USA_all$n_p
data_USA_all[2]<- NULL
data_USA_all$USA_n_e_all <- data_USA_all$n_e
data_USA_all[2]<- NULL
data_USA_all$USA_N_all <- data_USA_all$N
data_USA_all[2]<- NULL
data_USA_all$USA_APL_all <- data_USA_all$APL
data_USA_all[2]<- NULL

data_USA_all$USA_all_extra_1 <- data_USA_all$USA_p_a_all * data_USA_all$USA_n_p_all
data_USA_all$USA_all_extra_2 <- data_USA_all$USA_p_e_all * data_USA_all$USA_n_e_all
data_USA_all$USA_all_extra_3 <- data_USA_all$USA_p_e_all * data_USA_all$USA_n_e_all * data_USA_all$USA_n_p_all
data_USA_all$USA_all_extra_4 <- data_USA_all$USA_p_d_all * data_USA_all$USA_n_c_all

data_USA_all$USA_all_certainly_1 <- log((data_USA_all$USA_N_all/2) - data_USA_all$USA_n_c_all)
data_USA_all$USA_all_certainly_2 <- log(data_USA_all$USA_n_c_all + ((data_USA_all$USA_n_p_all - data_USA_all$USA_n_c_all)/2))
data_USA_all[1]<- NULL

# USA Only Tipped
USA_t_tip_only_tipped <- data_USA_only_tipped$t_tip
data_USA_only_tipped[2]<- NULL

data_USA_only_tipped$USA_theta_a_only_tipped <- data_USA_only_tipped$Theta_a
data_USA_only_tipped$USA_theta_a_only_tipped_log <- log(data_USA_only_tipped$Theta_a)
data_USA_only_tipped$USA_theta_a_only_tipped_log_minus_1 <- log(1 - data_USA_only_tipped$Theta_a)
data_USA_only_tipped[2]<- NULL

data_USA_only_tipped$USA_theta_d_only_tipped <- data_USA_only_tipped$Theta_d
data_USA_only_tipped$USA_theta_d_only_tipped_log <- log(data_USA_only_tipped$Theta_d)
data_USA_only_tipped$USA_theta_d_only_tipped_log_minus_1 <- log(1 - data_USA_only_tipped$Theta_d)
data_USA_only_tipped[3]<- NULL

data_USA_only_tipped$USA_p_a_only_tipped <- data_USA_only_tipped$p_a
data_USA_only_tipped$USA_p_a_only_tipped_log <- log(data_USA_only_tipped$p_a)
data_USA_only_tipped$USA_p_a_only_tipped_log_minus_1 <- log(1 - data_USA_only_tipped$p_a)
data_USA_only_tipped[2]<- NULL

data_USA_only_tipped$USA_p_d_only_tipped <- data_USA_only_tipped$p_d
data_USA_only_tipped$USA_p_d_only_tipped_log <- log(data_USA_only_tipped$p_d)
data_USA_only_tipped$USA_p_d_only_tipped_log_minus_1 <- log(1 - data_USA_only_tipped$p_d)
data_USA_only_tipped[2]<- NULL

data_USA_only_tipped$USA_p_e_only_tipped <- data_USA_only_tipped$p_e
data_USA_only_tipped$USA_p_e_only_tipped_log <- log(data_USA_only_tipped$p_e)
data_USA_only_tipped$USA_p_e_only_tipped_log_minus_1 <- log(1 - data_USA_only_tipped$p_e)
data_USA_only_tipped[2]<- NULL

data_USA_only_tipped$USA_p_en_only_tipped <- data_USA_only_tipped$p_en
data_USA_only_tipped$USA_p_en_only_tipped_log <- log(data_USA_only_tipped$p_en)
data_USA_only_tipped$USA_p_en_only_tipped_log_minus_1 <- log(1 - data_USA_only_tipped$p_en)
data_USA_only_tipped[2]<- NULL

data_USA_only_tipped$USA_p_ra_only_tipped <- data_USA_only_tipped$p_ra
data_USA_only_tipped$USA_p_ra_only_tipped_log <- log(data_USA_only_tipped$p_ra)
data_USA_only_tipped$USA_p_ra_only_tipped_log_minus_1 <- log(1 - data_USA_only_tipped$p_ra)
data_USA_only_tipped[2]<- NULL

data_USA_only_tipped$USA_p_rd_only_tipped <- data_USA_only_tipped$p_rd
data_USA_only_tipped$USA_p_rd_only_tipped_log <- log(data_USA_only_tipped$p_rd)
data_USA_only_tipped$USA_p_rd_only_tipped_log_minus_1 <- log(1 - data_USA_only_tipped$p_rd)
data_USA_only_tipped[2]<- NULL

data_USA_only_tipped$USA_n_c_only_tipped <- data_USA_only_tipped$n_c
data_USA_only_tipped[2]<- NULL
data_USA_only_tipped$USA_n_p_only_tipped <- data_USA_only_tipped$n_p
data_USA_only_tipped[2]<- NULL
data_USA_only_tipped$USA_n_e_only_tipped <- data_USA_only_tipped$n_e
data_USA_only_tipped[2]<- NULL
data_USA_only_tipped$USA_N_only_tipped <- data_USA_only_tipped$N
data_USA_only_tipped[2]<- NULL

data_USA_only_tipped$USA_APL_only_tipped <- data_USA_only_tipped$APL
data_USA_only_tipped[2]<- NULL

data_USA_only_tipped$USA_only_tipped_extra_1 <- data_USA_only_tipped$USA_p_a_only_tipped * data_USA_only_tipped$USA_n_p_only_tipped
data_USA_only_tipped$USA_only_tipped_extra_2 <- data_USA_only_tipped$USA_p_e_only_tipped * data_USA_only_tipped$USA_n_e_only_tipped
data_USA_only_tipped$USA_only_tipped_extra_3 <- data_USA_only_tipped$USA_p_e_only_tipped * data_USA_only_tipped$USA_n_e_only_tipped * data_USA_only_tipped$USA_n_p_only_tipped
data_USA_only_tipped$USA_only_tipped_extra_4 <- data_USA_only_tipped$USA_p_d_only_tipped * data_USA_only_tipped$USA_n_c_only_tipped

data_USA_only_tipped$USA_only_tipped_certainly_1 <- log((data_USA_only_tipped$USA_N_only_tipped/2) - data_USA_only_tipped$USA_n_c_only_tipped)
data_USA_only_tipped$USA_only_tipped_certainly_2 <- log(data_USA_only_tipped$USA_n_c_only_tipped + ((data_USA_only_tipped$USA_n_p_only_tipped - data_USA_only_tipped$USA_n_c_only_tipped)/2))
data_USA_only_tipped[1]<- NULL


# ---RUS---
RUS_tipped_or_not <- data_RUS_all$is_tipped
data_RUS_all[2]<- NULL
RUS_t_tip_all <- data_RUS_all$t_tip
RUS_tipping_transformed_all <- 1/data_RUS_all$t_tip
data_RUS_all[2]<- NULL

data_RUS_all$RUS_theta_a_all <- data_RUS_all$Theta_a
data_RUS_all$RUS_theta_a_all_log <- log(data_RUS_all$Theta_a)
data_RUS_all$RUS_theta_a_all_log_minus_1 <- log(1 - data_RUS_all$Theta_a)
data_RUS_all[2]<- NULL

data_RUS_all$RUS_theta_d_all <- data_RUS_all$Theta_d
data_RUS_all$RUS_theta_d_all_log <- log(data_RUS_all$Theta_d)
data_RUS_all$RUS_theta_d_all_log_minus_1 <- log(1 - data_RUS_all$Theta_d)
data_RUS_all[3]<- NULL

data_RUS_all$RUS_p_a_all <- data_RUS_all$p_a
data_RUS_all$RUS_p_a_all_log <- log(data_RUS_all$p_a)
data_RUS_all$RUS_p_a_all_log_minus_1 <- log(1 - data_RUS_all$p_a)
data_RUS_all[2]<- NULL

data_RUS_all$RUS_p_d_all <- data_RUS_all$p_d
data_RUS_all$RUS_p_d_all_log <- log(data_RUS_all$p_d)
data_RUS_all$RUS_p_d_all_log_minus_1 <- log(1 - data_RUS_all$p_d)
data_RUS_all[2]<- NULL

data_RUS_all$RUS_p_e_all <- data_RUS_all$p_e
data_RUS_all$RUS_p_e_all_log <- log(data_RUS_all$p_e)
data_RUS_all$RUS_p_e_all_log_minus_1 <- log(1 - data_RUS_all$p_e)
data_RUS_all[2]<- NULL

data_RUS_all$RUS_p_en_all <- data_RUS_all$p_en
data_RUS_all$RUS_p_en_all_log <- log(data_RUS_all$p_en)
data_RUS_all$RUS_p_en_all_log_minus_1 <- log(1 - data_RUS_all$p_en)
data_RUS_all[2]<- NULL

data_RUS_all$RUS_p_ra_all <- data_RUS_all$p_ra
data_RUS_all$RUS_p_ra_all_log <- log(data_RUS_all$p_ra)
data_RUS_all$RUS_p_ra_all_log_minus_1 <- log(1 - data_RUS_all$p_ra)
data_RUS_all[2]<- NULL

data_RUS_all$RUS_p_rd_all <- data_RUS_all$p_rd
data_RUS_all$RUS_p_rd_all_log <- log(data_RUS_all$p_rd)
data_RUS_all$RUS_p_rd_all_log_minus_1 <- log(1 - data_RUS_all$p_rd)
data_RUS_all[2]<- NULL

data_RUS_all$RUS_n_c_all <- data_RUS_all$n_c
data_RUS_all[2]<- NULL
data_RUS_all$RUS_n_p_all <- data_RUS_all$n_p
data_RUS_all[2]<- NULL
data_RUS_all$RUS_n_e_all <- data_RUS_all$n_e
data_RUS_all[2]<- NULL
data_RUS_all$RUS_N_all <- data_RUS_all$N
data_RUS_all[2]<- NULL
data_RUS_all$RUS_APL_all <- data_RUS_all$APL
data_RUS_all[2]<- NULL

data_RUS_all$RUS_all_extra_1 <- data_RUS_all$RUS_p_a_all * data_RUS_all$RUS_n_p_all
data_RUS_all$RUS_all_extra_2 <- data_RUS_all$RUS_p_e_all * data_RUS_all$RUS_n_e_all
data_RUS_all$RUS_all_extra_3 <- data_RUS_all$RUS_p_e_all * data_RUS_all$RUS_n_e_all * data_RUS_all$RUS_n_p_all
data_RUS_all$RUS_all_extra_4 <- data_RUS_all$RUS_p_d_all * data_RUS_all$RUS_n_c_all

data_RUS_all$RUS_all_certainly_1 <- log((data_RUS_all$RUS_N_all/2) - data_RUS_all$RUS_n_c_all)
data_RUS_all$RUS_all_certainly_2 <- log(data_RUS_all$RUS_n_c_all + ((data_RUS_all$RUS_n_p_all - data_RUS_all$RUS_n_c_all)/2))
data_RUS_all[1]<- NULL

# RUS Only Tipped
RUS_t_tip_only_tipped <- data_RUS_only_tipped$t_tip
data_RUS_only_tipped[2]<- NULL

data_RUS_only_tipped$RUS_theta_a_only_tipped <- data_RUS_only_tipped$Theta_a
data_RUS_only_tipped$RUS_theta_a_only_tipped_log <- log(data_RUS_only_tipped$Theta_a)
data_RUS_only_tipped$RUS_theta_a_only_tipped_log_minus_1 <- log(1 - data_RUS_only_tipped$Theta_a)
data_RUS_only_tipped[2]<- NULL

data_RUS_only_tipped$RUS_theta_d_only_tipped <- data_RUS_only_tipped$Theta_d
data_RUS_only_tipped$RUS_theta_d_only_tipped_log <- log(data_RUS_only_tipped$Theta_d)
data_RUS_only_tipped$RUS_theta_d_only_tipped_log_minus_1 <- log(1 - data_RUS_only_tipped$Theta_d)
data_RUS_only_tipped[3]<- NULL

data_RUS_only_tipped$RUS_p_a_only_tipped <- data_RUS_only_tipped$p_a
data_RUS_only_tipped$RUS_p_a_only_tipped_log <- log(data_RUS_only_tipped$p_a)
data_RUS_only_tipped$RUS_p_a_only_tipped_log_minus_1 <- log(1 - data_RUS_only_tipped$p_a)
data_RUS_only_tipped[2]<- NULL

data_RUS_only_tipped$RUS_p_d_only_tipped <- data_RUS_only_tipped$p_d
data_RUS_only_tipped$RUS_p_d_only_tipped_log <- log(data_RUS_only_tipped$p_d)
data_RUS_only_tipped$RUS_p_d_only_tipped_log_minus_1 <- log(1 - data_RUS_only_tipped$p_d)
data_RUS_only_tipped[2]<- NULL

data_RUS_only_tipped$RUS_p_e_only_tipped <- data_RUS_only_tipped$p_e
data_RUS_only_tipped$RUS_p_e_only_tipped_log <- log(data_RUS_only_tipped$p_e)
data_RUS_only_tipped$RUS_p_e_only_tipped_log_minus_1 <- log(1 - data_RUS_only_tipped$p_e)
data_RUS_only_tipped[2]<- NULL

data_RUS_only_tipped$RUS_p_en_only_tipped <- data_RUS_only_tipped$p_en
data_RUS_only_tipped$RUS_p_en_only_tipped_log <- log(data_RUS_only_tipped$p_en)
data_RUS_only_tipped$RUS_p_en_only_tipped_log_minus_1 <- log(1 - data_RUS_only_tipped$p_en)
data_RUS_only_tipped[2]<- NULL

data_RUS_only_tipped$RUS_p_ra_only_tipped <- data_RUS_only_tipped$p_ra
data_RUS_only_tipped$RUS_p_ra_only_tipped_log <- log(data_RUS_only_tipped$p_ra)
data_RUS_only_tipped$RUS_p_ra_only_tipped_log_minus_1 <- log(1 - data_RUS_only_tipped$p_ra)
data_RUS_only_tipped[2]<- NULL

data_RUS_only_tipped$RUS_p_rd_only_tipped <- data_RUS_only_tipped$p_rd
data_RUS_only_tipped$RUS_p_rd_only_tipped_log <- log(data_RUS_only_tipped$p_rd)
data_RUS_only_tipped$RUS_p_rd_only_tipped_log_minus_1 <- log(1 - data_RUS_only_tipped$p_rd)
data_RUS_only_tipped[2]<- NULL

data_RUS_only_tipped$RUS_n_c_only_tipped <- data_RUS_only_tipped$n_c
data_RUS_only_tipped[2]<- NULL
data_RUS_only_tipped$RUS_n_p_only_tipped <- data_RUS_only_tipped$n_p
data_RUS_only_tipped[2]<- NULL
data_RUS_only_tipped$RUS_n_e_only_tipped <- data_RUS_only_tipped$n_e
data_RUS_only_tipped[2]<- NULL
data_RUS_only_tipped$RUS_N_only_tipped <- data_RUS_only_tipped$N
data_RUS_only_tipped[2]<- NULL

data_RUS_only_tipped$RUS_APL_only_tipped <- data_RUS_only_tipped$APL
data_RUS_only_tipped[2]<- NULL

data_RUS_only_tipped$RUS_only_tipped_extra_1 <- data_RUS_only_tipped$RUS_p_a_only_tipped * data_RUS_only_tipped$RUS_n_p_only_tipped
data_RUS_only_tipped$RUS_only_tipped_extra_2 <- data_RUS_only_tipped$RUS_p_e_only_tipped * data_RUS_only_tipped$RUS_n_e_only_tipped
data_RUS_only_tipped$RUS_only_tipped_extra_3 <- data_RUS_only_tipped$RUS_p_e_only_tipped * data_RUS_only_tipped$RUS_n_e_only_tipped * data_RUS_only_tipped$RUS_n_p_only_tipped
data_RUS_only_tipped$RUS_only_tipped_extra_4 <- data_RUS_only_tipped$RUS_p_d_only_tipped * data_RUS_only_tipped$RUS_n_c_only_tipped

data_RUS_only_tipped$RUS_only_tipped_certainly_1 <- log((data_RUS_only_tipped$RUS_N_only_tipped/2) - data_RUS_only_tipped$RUS_n_c_only_tipped)
data_RUS_only_tipped$RUS_only_tipped_certainly_2 <- log(data_RUS_only_tipped$RUS_n_c_only_tipped + ((data_RUS_only_tipped$RUS_n_p_only_tipped - data_RUS_only_tipped$RUS_n_c_only_tipped)/2))
data_RUS_only_tipped[1]<- NULL


# ---CHN---
CHN_tipped_or_not <- data_CHN_all$is_tipped
data_CHN_all[2]<- NULL
CHN_t_tip_all <- data_CHN_all$t_tip
CHN_tipping_transformed_all <- 1/data_CHN_all$t_tip
data_CHN_all[2]<- NULL

data_CHN_all$CHN_theta_a_all <- data_CHN_all$Theta_a
data_CHN_all$CHN_theta_a_all_log <- log(data_CHN_all$Theta_a)
data_CHN_all$CHN_theta_a_all_log_minus_1 <- log(1 - data_CHN_all$Theta_a)
data_CHN_all[2]<- NULL

data_CHN_all$CHN_theta_d_all <- data_CHN_all$Theta_d
data_CHN_all$CHN_theta_d_all_log <- log(data_CHN_all$Theta_d)
data_CHN_all$CHN_theta_d_all_log_minus_1 <- log(1 - data_CHN_all$Theta_d)
data_CHN_all[3]<- NULL

data_CHN_all$CHN_p_a_all <- data_CHN_all$p_a
data_CHN_all$CHN_p_a_all_log <- log(data_CHN_all$p_a)
data_CHN_all$CHN_p_a_all_log_minus_1 <- log(1 - data_CHN_all$p_a)
data_CHN_all[2]<- NULL

data_CHN_all$CHN_p_d_all <- data_CHN_all$p_d
data_CHN_all$CHN_p_d_all_log <- log(data_CHN_all$p_d)
data_CHN_all$CHN_p_d_all_log_minus_1 <- log(1 - data_CHN_all$p_d)
data_CHN_all[2]<- NULL

data_CHN_all$CHN_p_e_all <- data_CHN_all$p_e
data_CHN_all$CHN_p_e_all_log <- log(data_CHN_all$p_e)
data_CHN_all$CHN_p_e_all_log_minus_1 <- log(1 - data_CHN_all$p_e)
data_CHN_all[2]<- NULL

data_CHN_all$CHN_p_en_all <- data_CHN_all$p_en
data_CHN_all$CHN_p_en_all_log <- log(data_CHN_all$p_en)
data_CHN_all$CHN_p_en_all_log_minus_1 <- log(1 - data_CHN_all$p_en)
data_CHN_all[2]<- NULL

data_CHN_all$CHN_p_ra_all <- data_CHN_all$p_ra
data_CHN_all$CHN_p_ra_all_log <- log(data_CHN_all$p_ra)
data_CHN_all$CHN_p_ra_all_log_minus_1 <- log(1 - data_CHN_all$p_ra)
data_CHN_all[2]<- NULL

data_CHN_all$CHN_p_rd_all <- data_CHN_all$p_rd
data_CHN_all$CHN_p_rd_all_log <- log(data_CHN_all$p_rd)
data_CHN_all$CHN_p_rd_all_log_minus_1 <- log(1 - data_CHN_all$p_rd)
data_CHN_all[2]<- NULL

data_CHN_all$CHN_n_c_all <- data_CHN_all$n_c
data_CHN_all[2]<- NULL
data_CHN_all$CHN_n_p_all <- data_CHN_all$n_p
data_CHN_all[2]<- NULL
data_CHN_all$CHN_n_e_all <- data_CHN_all$n_e
data_CHN_all[2]<- NULL
data_CHN_all$CHN_N_all <- data_CHN_all$N
data_CHN_all[2]<- NULL
data_CHN_all$CHN_APL_all <- data_CHN_all$APL
data_CHN_all[2]<- NULL

data_CHN_all$CHN_all_extra_1 <- data_CHN_all$CHN_p_a_all * data_CHN_all$CHN_n_p_all
data_CHN_all$CHN_all_extra_2 <- data_CHN_all$CHN_p_e_all * data_CHN_all$CHN_n_e_all
data_CHN_all$CHN_all_extra_3 <- data_CHN_all$CHN_p_e_all * data_CHN_all$CHN_n_e_all * data_CHN_all$CHN_n_p_all
data_CHN_all$CHN_all_extra_4 <- data_CHN_all$CHN_p_d_all * data_CHN_all$CHN_n_c_all

data_CHN_all$CHN_all_certainly_1 <- log((data_CHN_all$CHN_N_all/2) - data_CHN_all$CHN_n_c_all)
data_CHN_all$CHN_all_certainly_2 <- log(data_CHN_all$CHN_n_c_all + ((data_CHN_all$CHN_n_p_all - data_CHN_all$CHN_n_c_all)/2))
data_CHN_all[1]<- NULL

# CHN Only Tipped
CHN_t_tip_only_tipped <- data_CHN_only_tipped$t_tip
data_CHN_only_tipped[2]<- NULL

data_CHN_only_tipped$CHN_theta_a_only_tipped <- data_CHN_only_tipped$Theta_a
data_CHN_only_tipped$CHN_theta_a_only_tipped_log <- log(data_CHN_only_tipped$Theta_a)
data_CHN_only_tipped$CHN_theta_a_only_tipped_log_minus_1 <- log(1 - data_CHN_only_tipped$Theta_a)
data_CHN_only_tipped[2]<- NULL

data_CHN_only_tipped$CHN_theta_d_only_tipped <- data_CHN_only_tipped$Theta_d
data_CHN_only_tipped$CHN_theta_d_only_tipped_log <- log(data_CHN_only_tipped$Theta_d)
data_CHN_only_tipped$CHN_theta_d_only_tipped_log_minus_1 <- log(1 - data_CHN_only_tipped$Theta_d)
data_CHN_only_tipped[3]<- NULL

data_CHN_only_tipped$CHN_p_a_only_tipped <- data_CHN_only_tipped$p_a
data_CHN_only_tipped$CHN_p_a_only_tipped_log <- log(data_CHN_only_tipped$p_a)
data_CHN_only_tipped$CHN_p_a_only_tipped_log_minus_1 <- log(1 - data_CHN_only_tipped$p_a)
data_CHN_only_tipped[2]<- NULL

data_CHN_only_tipped$CHN_p_d_only_tipped <- data_CHN_only_tipped$p_d
data_CHN_only_tipped$CHN_p_d_only_tipped_log <- log(data_CHN_only_tipped$p_d)
data_CHN_only_tipped$CHN_p_d_only_tipped_log_minus_1 <- log(1 - data_CHN_only_tipped$p_d)
data_CHN_only_tipped[2]<- NULL

data_CHN_only_tipped$CHN_p_e_only_tipped <- data_CHN_only_tipped$p_e
data_CHN_only_tipped$CHN_p_e_only_tipped_log <- log(data_CHN_only_tipped$p_e)
data_CHN_only_tipped$CHN_p_e_only_tipped_log_minus_1 <- log(1 - data_CHN_only_tipped$p_e)
data_CHN_only_tipped[2]<- NULL

data_CHN_only_tipped$CHN_p_en_only_tipped <- data_CHN_only_tipped$p_en
data_CHN_only_tipped$CHN_p_en_only_tipped_log <- log(data_CHN_only_tipped$p_en)
data_CHN_only_tipped$CHN_p_en_only_tipped_log_minus_1 <- log(1 - data_CHN_only_tipped$p_en)
data_CHN_only_tipped[2]<- NULL

data_CHN_only_tipped$CHN_p_ra_only_tipped <- data_CHN_only_tipped$p_ra
data_CHN_only_tipped$CHN_p_ra_only_tipped_log <- log(data_CHN_only_tipped$p_ra)
data_CHN_only_tipped$CHN_p_ra_only_tipped_log_minus_1 <- log(1 - data_CHN_only_tipped$p_ra)
data_CHN_only_tipped[2]<- NULL

data_CHN_only_tipped$CHN_p_rd_only_tipped <- data_CHN_only_tipped$p_rd
data_CHN_only_tipped$CHN_p_rd_only_tipped_log <- log(data_CHN_only_tipped$p_rd)
data_CHN_only_tipped$CHN_p_rd_only_tipped_log_minus_1 <- log(1 - data_CHN_only_tipped$p_rd)
data_CHN_only_tipped[2]<- NULL

data_CHN_only_tipped$CHN_n_c_only_tipped <- data_CHN_only_tipped$n_c
data_CHN_only_tipped[2]<- NULL
data_CHN_only_tipped$CHN_n_p_only_tipped <- data_CHN_only_tipped$n_p
data_CHN_only_tipped[2]<- NULL
data_CHN_only_tipped$CHN_n_e_only_tipped <- data_CHN_only_tipped$n_e
data_CHN_only_tipped[2]<- NULL
data_CHN_only_tipped$CHN_N_only_tipped <- data_CHN_only_tipped$N
data_CHN_only_tipped[2]<- NULL

data_CHN_only_tipped$CHN_APL_only_tipped <- data_CHN_only_tipped$APL
data_CHN_only_tipped[2]<- NULL

data_CHN_only_tipped$CHN_only_tipped_extra_1 <- data_CHN_only_tipped$CHN_p_a_only_tipped * data_CHN_only_tipped$CHN_n_p_only_tipped
data_CHN_only_tipped$CHN_only_tipped_extra_2 <- data_CHN_only_tipped$CHN_p_e_only_tipped * data_CHN_only_tipped$CHN_n_e_only_tipped
data_CHN_only_tipped$CHN_only_tipped_extra_3 <- data_CHN_only_tipped$CHN_p_e_only_tipped * data_CHN_only_tipped$CHN_n_e_only_tipped * data_CHN_only_tipped$CHN_n_p_only_tipped
data_CHN_only_tipped$CHN_only_tipped_extra_4 <- data_CHN_only_tipped$CHN_p_d_only_tipped * data_CHN_only_tipped$CHN_n_c_only_tipped

data_CHN_only_tipped$CHN_only_tipped_certainly_1 <- log((data_CHN_only_tipped$CHN_N_only_tipped/2) - data_CHN_only_tipped$CHN_n_c_only_tipped)
data_CHN_only_tipped$CHN_only_tipped_certainly_2 <- log(data_CHN_only_tipped$CHN_n_c_only_tipped + ((data_CHN_only_tipped$CHN_n_p_only_tipped - data_CHN_only_tipped$CHN_n_c_only_tipped)/2))
data_CHN_only_tipped[1]<- NULL


# ---IND---
IND_tipped_or_not <- data_IND_all$is_tipped
data_IND_all[2]<- NULL
IND_t_tip_all <- data_IND_all$t_tip
IND_tipping_transformed_all <- 1/data_IND_all$t_tip
data_IND_all[2]<- NULL

data_IND_all$IND_theta_a_all <- data_IND_all$Theta_a
data_IND_all$IND_theta_a_all_log <- log(data_IND_all$Theta_a)
data_IND_all$IND_theta_a_all_log_minus_1 <- log(1 - data_IND_all$Theta_a)
data_IND_all[2]<- NULL

data_IND_all$IND_theta_d_all <- data_IND_all$Theta_d
data_IND_all$IND_theta_d_all_log <- log(data_IND_all$Theta_d)
data_IND_all$IND_theta_d_all_log_minus_1 <- log(1 - data_IND_all$Theta_d)
data_IND_all[3]<- NULL

data_IND_all$IND_p_a_all <- data_IND_all$p_a
data_IND_all$IND_p_a_all_log <- log(data_IND_all$p_a)
data_IND_all$IND_p_a_all_log_minus_1 <- log(1 - data_IND_all$p_a)
data_IND_all[2]<- NULL

data_IND_all$IND_p_d_all <- data_IND_all$p_d
data_IND_all$IND_p_d_all_log <- log(data_IND_all$p_d)
data_IND_all$IND_p_d_all_log_minus_1 <- log(1 - data_IND_all$p_d)
data_IND_all[2]<- NULL

data_IND_all$IND_p_e_all <- data_IND_all$p_e
data_IND_all$IND_p_e_all_log <- log(data_IND_all$p_e)
data_IND_all$IND_p_e_all_log_minus_1 <- log(1 - data_IND_all$p_e)
data_IND_all[2]<- NULL

data_IND_all$IND_p_en_all <- data_IND_all$p_en
data_IND_all$IND_p_en_all_log <- log(data_IND_all$p_en)
data_IND_all$IND_p_en_all_log_minus_1 <- log(1 - data_IND_all$p_en)
data_IND_all[2]<- NULL

data_IND_all$IND_p_ra_all <- data_IND_all$p_ra
data_IND_all$IND_p_ra_all_log <- log(data_IND_all$p_ra)
data_IND_all$IND_p_ra_all_log_minus_1 <- log(1 - data_IND_all$p_ra)
data_IND_all[2]<- NULL

data_IND_all$IND_p_rd_all <- data_IND_all$p_rd
data_IND_all$IND_p_rd_all_log <- log(data_IND_all$p_rd)
data_IND_all$IND_p_rd_all_log_minus_1 <- log(1 - data_IND_all$p_rd)
data_IND_all[2]<- NULL

data_IND_all$IND_n_c_all <- data_IND_all$n_c
data_IND_all[2]<- NULL
data_IND_all$IND_n_p_all <- data_IND_all$n_p
data_IND_all[2]<- NULL
data_IND_all$IND_n_e_all <- data_IND_all$n_e
data_IND_all[2]<- NULL
data_IND_all$IND_N_all <- data_IND_all$N
data_IND_all[2]<- NULL
data_IND_all$IND_APL_all <- data_IND_all$APL
data_IND_all[2]<- NULL

data_IND_all$IND_all_extra_1 <- data_IND_all$IND_p_a_all * data_IND_all$IND_n_p_all
data_IND_all$IND_all_extra_2 <- data_IND_all$IND_p_e_all * data_IND_all$IND_n_e_all
data_IND_all$IND_all_extra_3 <- data_IND_all$IND_p_e_all * data_IND_all$IND_n_e_all * data_IND_all$IND_n_p_all
data_IND_all$IND_all_extra_4 <- data_IND_all$IND_p_d_all * data_IND_all$IND_n_c_all

data_IND_all$IND_all_certainly_1 <- log((data_IND_all$IND_N_all/2) - data_IND_all$IND_n_c_all)
data_IND_all$IND_all_certainly_2 <- log(data_IND_all$IND_n_c_all + ((data_IND_all$IND_n_p_all - data_IND_all$IND_n_c_all)/2))
data_IND_all[1]<- NULL

# IND Only Tipped
IND_t_tip_only_tipped <- data_IND_only_tipped$t_tip
data_IND_only_tipped[2]<- NULL

data_IND_only_tipped$IND_theta_a_only_tipped <- data_IND_only_tipped$Theta_a
data_IND_only_tipped$IND_theta_a_only_tipped_log <- log(data_IND_only_tipped$Theta_a)
data_IND_only_tipped$IND_theta_a_only_tipped_log_minus_1 <- log(1 - data_IND_only_tipped$Theta_a)
data_IND_only_tipped[2]<- NULL

data_IND_only_tipped$IND_theta_d_only_tipped <- data_IND_only_tipped$Theta_d
data_IND_only_tipped$IND_theta_d_only_tipped_log <- log(data_IND_only_tipped$Theta_d)
data_IND_only_tipped$IND_theta_d_only_tipped_log_minus_1 <- log(1 - data_IND_only_tipped$Theta_d)
data_IND_only_tipped[3]<- NULL

data_IND_only_tipped$IND_p_a_only_tipped <- data_IND_only_tipped$p_a
data_IND_only_tipped$IND_p_a_only_tipped_log <- log(data_IND_only_tipped$p_a)
data_IND_only_tipped$IND_p_a_only_tipped_log_minus_1 <- log(1 - data_IND_only_tipped$p_a)
data_IND_only_tipped[2]<- NULL

data_IND_only_tipped$IND_p_d_only_tipped <- data_IND_only_tipped$p_d
data_IND_only_tipped$IND_p_d_only_tipped_log <- log(data_IND_only_tipped$p_d)
data_IND_only_tipped$IND_p_d_only_tipped_log_minus_1 <- log(1 - data_IND_only_tipped$p_d)
data_IND_only_tipped[2]<- NULL

data_IND_only_tipped$IND_p_e_only_tipped <- data_IND_only_tipped$p_e
data_IND_only_tipped$IND_p_e_only_tipped_log <- log(data_IND_only_tipped$p_e)
data_IND_only_tipped$IND_p_e_only_tipped_log_minus_1 <- log(1 - data_IND_only_tipped$p_e)
data_IND_only_tipped[2]<- NULL

data_IND_only_tipped$IND_p_en_only_tipped <- data_IND_only_tipped$p_en
data_IND_only_tipped$IND_p_en_only_tipped_log <- log(data_IND_only_tipped$p_en)
data_IND_only_tipped$IND_p_en_only_tipped_log_minus_1 <- log(1 - data_IND_only_tipped$p_en)
data_IND_only_tipped[2]<- NULL

data_IND_only_tipped$IND_p_ra_only_tipped <- data_IND_only_tipped$p_ra
data_IND_only_tipped$IND_p_ra_only_tipped_log <- log(data_IND_only_tipped$p_ra)
data_IND_only_tipped$IND_p_ra_only_tipped_log_minus_1 <- log(1 - data_IND_only_tipped$p_ra)
data_IND_only_tipped[2]<- NULL

data_IND_only_tipped$IND_p_rd_only_tipped <- data_IND_only_tipped$p_rd
data_IND_only_tipped$IND_p_rd_only_tipped_log <- log(data_IND_only_tipped$p_rd)
data_IND_only_tipped$IND_p_rd_only_tipped_log_minus_1 <- log(1 - data_IND_only_tipped$p_rd)
data_IND_only_tipped[2]<- NULL

data_IND_only_tipped$IND_n_c_only_tipped <- data_IND_only_tipped$n_c
data_IND_only_tipped[2]<- NULL
data_IND_only_tipped$IND_n_p_only_tipped <- data_IND_only_tipped$n_p
data_IND_only_tipped[2]<- NULL
data_IND_only_tipped$IND_n_e_only_tipped <- data_IND_only_tipped$n_e
data_IND_only_tipped[2]<- NULL
data_IND_only_tipped$IND_N_only_tipped <- data_IND_only_tipped$N
data_IND_only_tipped[2]<- NULL

data_IND_only_tipped$IND_APL_only_tipped <- data_IND_only_tipped$APL
data_IND_only_tipped[2]<- NULL

data_IND_only_tipped$IND_only_tipped_extra_1 <- data_IND_only_tipped$IND_p_a_only_tipped * data_IND_only_tipped$IND_n_p_only_tipped
data_IND_only_tipped$IND_only_tipped_extra_2 <- data_IND_only_tipped$IND_p_e_only_tipped * data_IND_only_tipped$IND_n_e_only_tipped
data_IND_only_tipped$IND_only_tipped_extra_3 <- data_IND_only_tipped$IND_p_e_only_tipped * data_IND_only_tipped$IND_n_e_only_tipped * data_IND_only_tipped$IND_n_p_only_tipped
data_IND_only_tipped$IND_only_tipped_extra_4 <- data_IND_only_tipped$IND_p_d_only_tipped * data_IND_only_tipped$IND_n_c_only_tipped

data_IND_only_tipped$IND_only_tipped_certainly_1 <- log((data_IND_only_tipped$IND_N_only_tipped/2) - data_IND_only_tipped$IND_n_c_only_tipped)
data_IND_only_tipped$IND_only_tipped_certainly_2 <- log(data_IND_only_tipped$IND_n_c_only_tipped + ((data_IND_only_tipped$IND_n_p_only_tipped - data_IND_only_tipped$IND_n_c_only_tipped)/2))
data_IND_only_tipped[1]<- NULL


# ---BRA---
BRA_tipped_or_not <- data_BRA_all$is_tipped
data_BRA_all[2]<- NULL
BRA_t_tip_all <- data_BRA_all$t_tip
BRA_tipping_transformed_all <- 1/data_BRA_all$t_tip
data_BRA_all[2]<- NULL

data_BRA_all$BRA_theta_a_all <- data_BRA_all$Theta_a
data_BRA_all$BRA_theta_a_all_log <- log(data_BRA_all$Theta_a)
data_BRA_all$BRA_theta_a_all_log_minus_1 <- log(1 - data_BRA_all$Theta_a)
data_BRA_all[2]<- NULL

data_BRA_all$BRA_theta_d_all <- data_BRA_all$Theta_d
data_BRA_all$BRA_theta_d_all_log <- log(data_BRA_all$Theta_d)
data_BRA_all$BRA_theta_d_all_log_minus_1 <- log(1 - data_BRA_all$Theta_d)
data_BRA_all[3]<- NULL

data_BRA_all$BRA_p_a_all <- data_BRA_all$p_a
data_BRA_all$BRA_p_a_all_log <- log(data_BRA_all$p_a)
data_BRA_all$BRA_p_a_all_log_minus_1 <- log(1 - data_BRA_all$p_a)
data_BRA_all[2]<- NULL

data_BRA_all$BRA_p_d_all <- data_BRA_all$p_d
data_BRA_all$BRA_p_d_all_log <- log(data_BRA_all$p_d)
data_BRA_all$BRA_p_d_all_log_minus_1 <- log(1 - data_BRA_all$p_d)
data_BRA_all[2]<- NULL

data_BRA_all$BRA_p_e_all <- data_BRA_all$p_e
data_BRA_all$BRA_p_e_all_log <- log(data_BRA_all$p_e)
data_BRA_all$BRA_p_e_all_log_minus_1 <- log(1 - data_BRA_all$p_e)
data_BRA_all[2]<- NULL

data_BRA_all$BRA_p_en_all <- data_BRA_all$p_en
data_BRA_all$BRA_p_en_all_log <- log(data_BRA_all$p_en)
data_BRA_all$BRA_p_en_all_log_minus_1 <- log(1 - data_BRA_all$p_en)
data_BRA_all[2]<- NULL

data_BRA_all$BRA_p_ra_all <- data_BRA_all$p_ra
data_BRA_all$BRA_p_ra_all_log <- log(data_BRA_all$p_ra)
data_BRA_all$BRA_p_ra_all_log_minus_1 <- log(1 - data_BRA_all$p_ra)
data_BRA_all[2]<- NULL

data_BRA_all$BRA_p_rd_all <- data_BRA_all$p_rd
data_BRA_all$BRA_p_rd_all_log <- log(data_BRA_all$p_rd)
data_BRA_all$BRA_p_rd_all_log_minus_1 <- log(1 - data_BRA_all$p_rd)
data_BRA_all[2]<- NULL

data_BRA_all$BRA_n_c_all <- data_BRA_all$n_c
data_BRA_all[2]<- NULL
data_BRA_all$BRA_n_p_all <- data_BRA_all$n_p
data_BRA_all[2]<- NULL
data_BRA_all$BRA_n_e_all <- data_BRA_all$n_e
data_BRA_all[2]<- NULL
data_BRA_all$BRA_N_all <- data_BRA_all$N
data_BRA_all[2]<- NULL
data_BRA_all$BRA_APL_all <- data_BRA_all$APL
data_BRA_all[2]<- NULL

data_BRA_all$BRA_all_extra_1 <- data_BRA_all$BRA_p_a_all * data_BRA_all$BRA_n_p_all
data_BRA_all$BRA_all_extra_2 <- data_BRA_all$BRA_p_e_all * data_BRA_all$BRA_n_e_all
data_BRA_all$BRA_all_extra_3 <- data_BRA_all$BRA_p_e_all * data_BRA_all$BRA_n_e_all * data_BRA_all$BRA_n_p_all
data_BRA_all$BRA_all_extra_4 <- data_BRA_all$BRA_p_d_all * data_BRA_all$BRA_n_c_all

data_BRA_all$BRA_all_certainly_1 <- log((data_BRA_all$BRA_N_all/2) - data_BRA_all$BRA_n_c_all)
data_BRA_all$BRA_all_certainly_2 <- log(data_BRA_all$BRA_n_c_all + ((data_BRA_all$BRA_n_p_all - data_BRA_all$BRA_n_c_all)/2))
data_BRA_all[1]<- NULL

# BRA Only Tipped
BRA_t_tip_only_tipped <- data_BRA_only_tipped$t_tip
data_BRA_only_tipped[2]<- NULL

data_BRA_only_tipped$BRA_theta_a_only_tipped <- data_BRA_only_tipped$Theta_a
data_BRA_only_tipped$BRA_theta_a_only_tipped_log <- log(data_BRA_only_tipped$Theta_a)
data_BRA_only_tipped$BRA_theta_a_only_tipped_log_minus_1 <- log(1 - data_BRA_only_tipped$Theta_a)
data_BRA_only_tipped[2]<- NULL

data_BRA_only_tipped$BRA_theta_d_only_tipped <- data_BRA_only_tipped$Theta_d
data_BRA_only_tipped$BRA_theta_d_only_tipped_log <- log(data_BRA_only_tipped$Theta_d)
data_BRA_only_tipped$BRA_theta_d_only_tipped_log_minus_1 <- log(1 - data_BRA_only_tipped$Theta_d)
data_BRA_only_tipped[3]<- NULL

data_BRA_only_tipped$BRA_p_a_only_tipped <- data_BRA_only_tipped$p_a
data_BRA_only_tipped$BRA_p_a_only_tipped_log <- log(data_BRA_only_tipped$p_a)
data_BRA_only_tipped$BRA_p_a_only_tipped_log_minus_1 <- log(1 - data_BRA_only_tipped$p_a)
data_BRA_only_tipped[2]<- NULL

data_BRA_only_tipped$BRA_p_d_only_tipped <- data_BRA_only_tipped$p_d
data_BRA_only_tipped$BRA_p_d_only_tipped_log <- log(data_BRA_only_tipped$p_d)
data_BRA_only_tipped$BRA_p_d_only_tipped_log_minus_1 <- log(1 - data_BRA_only_tipped$p_d)
data_BRA_only_tipped[2]<- NULL

data_BRA_only_tipped$BRA_p_e_only_tipped <- data_BRA_only_tipped$p_e
data_BRA_only_tipped$BRA_p_e_only_tipped_log <- log(data_BRA_only_tipped$p_e)
data_BRA_only_tipped$BRA_p_e_only_tipped_log_minus_1 <- log(1 - data_BRA_only_tipped$p_e)
data_BRA_only_tipped[2]<- NULL

data_BRA_only_tipped$BRA_p_en_only_tipped <- data_BRA_only_tipped$p_en
data_BRA_only_tipped$BRA_p_en_only_tipped_log <- log(data_BRA_only_tipped$p_en)
data_BRA_only_tipped$BRA_p_en_only_tipped_log_minus_1 <- log(1 - data_BRA_only_tipped$p_en)
data_BRA_only_tipped[2]<- NULL

data_BRA_only_tipped$BRA_p_ra_only_tipped <- data_BRA_only_tipped$p_ra
data_BRA_only_tipped$BRA_p_ra_only_tipped_log <- log(data_BRA_only_tipped$p_ra)
data_BRA_only_tipped$BRA_p_ra_only_tipped_log_minus_1 <- log(1 - data_BRA_only_tipped$p_ra)
data_BRA_only_tipped[2]<- NULL

data_BRA_only_tipped$BRA_p_rd_only_tipped <- data_BRA_only_tipped$p_rd
data_BRA_only_tipped$BRA_p_rd_only_tipped_log <- log(data_BRA_only_tipped$p_rd)
data_BRA_only_tipped$BRA_p_rd_only_tipped_log_minus_1 <- log(1 - data_BRA_only_tipped$p_rd)
data_BRA_only_tipped[2]<- NULL

data_BRA_only_tipped$BRA_n_c_only_tipped <- data_BRA_only_tipped$n_c
data_BRA_only_tipped[2]<- NULL
data_BRA_only_tipped$BRA_n_p_only_tipped <- data_BRA_only_tipped$n_p
data_BRA_only_tipped[2]<- NULL
data_BRA_only_tipped$BRA_n_e_only_tipped <- data_BRA_only_tipped$n_e
data_BRA_only_tipped[2]<- NULL
data_BRA_only_tipped$BRA_N_only_tipped <- data_BRA_only_tipped$N
data_BRA_only_tipped[2]<- NULL

data_BRA_only_tipped$BRA_APL_only_tipped <- data_BRA_only_tipped$APL
data_BRA_only_tipped[2]<- NULL

data_BRA_only_tipped$BRA_only_tipped_extra_1 <- data_BRA_only_tipped$BRA_p_a_only_tipped * data_BRA_only_tipped$BRA_n_p_only_tipped
data_BRA_only_tipped$BRA_only_tipped_extra_2 <- data_BRA_only_tipped$BRA_p_e_only_tipped * data_BRA_only_tipped$BRA_n_e_only_tipped
data_BRA_only_tipped$BRA_only_tipped_extra_3 <- data_BRA_only_tipped$BRA_p_e_only_tipped * data_BRA_only_tipped$BRA_n_e_only_tipped * data_BRA_only_tipped$BRA_n_p_only_tipped
data_BRA_only_tipped$BRA_only_tipped_extra_4 <- data_BRA_only_tipped$BRA_p_d_only_tipped * data_BRA_only_tipped$BRA_n_c_only_tipped

data_BRA_only_tipped$BRA_only_tipped_certainly_1 <- log((data_BRA_only_tipped$BRA_N_only_tipped/2) - data_BRA_only_tipped$BRA_n_c_only_tipped)
data_BRA_only_tipped$BRA_only_tipped_certainly_2 <- log(data_BRA_only_tipped$BRA_n_c_only_tipped + ((data_BRA_only_tipped$BRA_n_p_only_tipped - data_BRA_only_tipped$BRA_n_c_only_tipped)/2))
data_BRA_only_tipped[1]<- NULL


# ---EU---
EU_tipped_or_not <- data_EU_all$is_tipped
data_EU_all[2]<- NULL
EU_t_tip_all <- data_EU_all$t_tip
EU_tipping_transformed_all <- 1/data_EU_all$t_tip
data_EU_all[2]<- NULL

data_EU_all$EU_theta_a_all <- data_EU_all$Theta_a
data_EU_all$EU_theta_a_all_log <- log(data_EU_all$Theta_a)
data_EU_all$EU_theta_a_all_log_minus_1 <- log(1 - data_EU_all$Theta_a)
data_EU_all[2]<- NULL

data_EU_all$EU_theta_d_all <- data_EU_all$Theta_d
data_EU_all$EU_theta_d_all_log <- log(data_EU_all$Theta_d)
data_EU_all$EU_theta_d_all_log_minus_1 <- log(1 - data_EU_all$Theta_d)
data_EU_all[3]<- NULL

data_EU_all$EU_p_a_all <- data_EU_all$p_a
data_EU_all$EU_p_a_all_log <- log(data_EU_all$p_a)
data_EU_all$EU_p_a_all_log_minus_1 <- log(1 - data_EU_all$p_a)
data_EU_all[2]<- NULL

data_EU_all$EU_p_d_all <- data_EU_all$p_d
data_EU_all$EU_p_d_all_log <- log(data_EU_all$p_d)
data_EU_all$EU_p_d_all_log_minus_1 <- log(1 - data_EU_all$p_d)
data_EU_all[2]<- NULL

data_EU_all$EU_p_e_all <- data_EU_all$p_e
data_EU_all$EU_p_e_all_log <- log(data_EU_all$p_e)
data_EU_all$EU_p_e_all_log_minus_1 <- log(1 - data_EU_all$p_e)
data_EU_all[2]<- NULL

data_EU_all$EU_p_en_all <- data_EU_all$p_en
data_EU_all$EU_p_en_all_log <- log(data_EU_all$p_en)
data_EU_all$EU_p_en_all_log_minus_1 <- log(1 - data_EU_all$p_en)
data_EU_all[2]<- NULL

data_EU_all$EU_p_ra_all <- data_EU_all$p_ra
data_EU_all$EU_p_ra_all_log <- log(data_EU_all$p_ra)
data_EU_all$EU_p_ra_all_log_minus_1 <- log(1 - data_EU_all$p_ra)
data_EU_all[2]<- NULL

data_EU_all$EU_p_rd_all <- data_EU_all$p_rd
data_EU_all$EU_p_rd_all_log <- log(data_EU_all$p_rd)
data_EU_all$EU_p_rd_all_log_minus_1 <- log(1 - data_EU_all$p_rd)
data_EU_all[2]<- NULL

data_EU_all$EU_n_c_all <- data_EU_all$n_c
data_EU_all[2]<- NULL
data_EU_all$EU_n_p_all <- data_EU_all$n_p
data_EU_all[2]<- NULL
data_EU_all$EU_n_e_all <- data_EU_all$n_e
data_EU_all[2]<- NULL
data_EU_all$EU_N_all <- data_EU_all$N
data_EU_all[2]<- NULL
data_EU_all$EU_APL_all <- data_EU_all$APL
data_EU_all[2]<- NULL

data_EU_all$EU_all_extra_1 <- data_EU_all$EU_p_a_all * data_EU_all$EU_n_p_all
data_EU_all$EU_all_extra_2 <- data_EU_all$EU_p_e_all * data_EU_all$EU_n_e_all
data_EU_all$EU_all_extra_3 <- data_EU_all$EU_p_e_all * data_EU_all$EU_n_e_all * data_EU_all$EU_n_p_all
data_EU_all$EU_all_extra_4 <- data_EU_all$EU_p_d_all * data_EU_all$EU_n_c_all

data_EU_all$EU_all_certainly_1 <- log((data_EU_all$EU_N_all/2) - data_EU_all$EU_n_c_all)
data_EU_all$EU_all_certainly_2 <- log(data_EU_all$EU_n_c_all + ((data_EU_all$EU_n_p_all - data_EU_all$EU_n_c_all)/2))
data_EU_all[1]<- NULL

# EU Only Tipped
EU_t_tip_only_tipped <- data_EU_only_tipped$t_tip
data_EU_only_tipped[2]<- NULL

data_EU_only_tipped$EU_theta_a_only_tipped <- data_EU_only_tipped$Theta_a
data_EU_only_tipped$EU_theta_a_only_tipped_log <- log(data_EU_only_tipped$Theta_a)
data_EU_only_tipped$EU_theta_a_only_tipped_log_minus_1 <- log(1 - data_EU_only_tipped$Theta_a)
data_EU_only_tipped[2]<- NULL

data_EU_only_tipped$EU_theta_d_only_tipped <- data_EU_only_tipped$Theta_d
data_EU_only_tipped$EU_theta_d_only_tipped_log <- log(data_EU_only_tipped$Theta_d)
data_EU_only_tipped$EU_theta_d_only_tipped_log_minus_1 <- log(1 - data_EU_only_tipped$Theta_d)
data_EU_only_tipped[3]<- NULL

data_EU_only_tipped$EU_p_a_only_tipped <- data_EU_only_tipped$p_a
data_EU_only_tipped$EU_p_a_only_tipped_log <- log(data_EU_only_tipped$p_a)
data_EU_only_tipped$EU_p_a_only_tipped_log_minus_1 <- log(1 - data_EU_only_tipped$p_a)
data_EU_only_tipped[2]<- NULL

data_EU_only_tipped$EU_p_d_only_tipped <- data_EU_only_tipped$p_d
data_EU_only_tipped$EU_p_d_only_tipped_log <- log(data_EU_only_tipped$p_d)
data_EU_only_tipped$EU_p_d_only_tipped_log_minus_1 <- log(1 - data_EU_only_tipped$p_d)
data_EU_only_tipped[2]<- NULL

data_EU_only_tipped$EU_p_e_only_tipped <- data_EU_only_tipped$p_e
data_EU_only_tipped$EU_p_e_only_tipped_log <- log(data_EU_only_tipped$p_e)
data_EU_only_tipped$EU_p_e_only_tipped_log_minus_1 <- log(1 - data_EU_only_tipped$p_e)
data_EU_only_tipped[2]<- NULL

data_EU_only_tipped$EU_p_en_only_tipped <- data_EU_only_tipped$p_en
data_EU_only_tipped$EU_p_en_only_tipped_log <- log(data_EU_only_tipped$p_en)
data_EU_only_tipped$EU_p_en_only_tipped_log_minus_1 <- log(1 - data_EU_only_tipped$p_en)
data_EU_only_tipped[2]<- NULL

data_EU_only_tipped$EU_p_ra_only_tipped <- data_EU_only_tipped$p_ra
data_EU_only_tipped$EU_p_ra_only_tipped_log <- log(data_EU_only_tipped$p_ra)
data_EU_only_tipped$EU_p_ra_only_tipped_log_minus_1 <- log(1 - data_EU_only_tipped$p_ra)
data_EU_only_tipped[2]<- NULL

data_EU_only_tipped$EU_p_rd_only_tipped <- data_EU_only_tipped$p_rd
data_EU_only_tipped$EU_p_rd_only_tipped_log <- log(data_EU_only_tipped$p_rd)
data_EU_only_tipped$EU_p_rd_only_tipped_log_minus_1 <- log(1 - data_EU_only_tipped$p_rd)
data_EU_only_tipped[2]<- NULL

data_EU_only_tipped$EU_n_c_only_tipped <- data_EU_only_tipped$n_c
data_EU_only_tipped[2]<- NULL
data_EU_only_tipped$EU_n_p_only_tipped <- data_EU_only_tipped$n_p
data_EU_only_tipped[2]<- NULL
data_EU_only_tipped$EU_n_e_only_tipped <- data_EU_only_tipped$n_e
data_EU_only_tipped[2]<- NULL
data_EU_only_tipped$EU_N_only_tipped <- data_EU_only_tipped$N
data_EU_only_tipped[2]<- NULL

data_EU_only_tipped$EU_APL_only_tipped <- data_EU_only_tipped$APL
data_EU_only_tipped[2]<- NULL

data_EU_only_tipped$EU_only_tipped_extra_1 <- data_EU_only_tipped$EU_p_a_only_tipped * data_EU_only_tipped$EU_n_p_only_tipped
data_EU_only_tipped$EU_only_tipped_extra_2 <- data_EU_only_tipped$EU_p_e_only_tipped * data_EU_only_tipped$EU_n_e_only_tipped
data_EU_only_tipped$EU_only_tipped_extra_3 <- data_EU_only_tipped$EU_p_e_only_tipped * data_EU_only_tipped$EU_n_e_only_tipped * data_EU_only_tipped$EU_n_p_only_tipped
data_EU_only_tipped$EU_only_tipped_extra_4 <- data_EU_only_tipped$EU_p_d_only_tipped * data_EU_only_tipped$EU_n_c_only_tipped

data_EU_only_tipped$EU_only_tipped_certainly_1 <- log((data_EU_only_tipped$EU_N_only_tipped/2) - data_EU_only_tipped$EU_n_c_only_tipped)
data_EU_only_tipped$EU_only_tipped_certainly_2 <- log(data_EU_only_tipped$EU_n_c_only_tipped + ((data_EU_only_tipped$EU_n_p_only_tipped - data_EU_only_tipped$EU_n_c_only_tipped)/2))
data_EU_only_tipped[1]<- NULL


# ---JPN---
JPN_tipped_or_not <- data_JPN_all$is_tipped
data_JPN_all[2]<- NULL
JPN_t_tip_all <- data_JPN_all$t_tip
JPN_tipping_transformed_all <- 1/data_JPN_all$t_tip
data_JPN_all[2]<- NULL

data_JPN_all$JPN_theta_a_all <- data_JPN_all$Theta_a
data_JPN_all$JPN_theta_a_all_log <- log(data_JPN_all$Theta_a)
data_JPN_all$JPN_theta_a_all_log_minus_1 <- log(1 - data_JPN_all$Theta_a)
data_JPN_all[2]<- NULL

data_JPN_all$JPN_theta_d_all <- data_JPN_all$Theta_d
data_JPN_all$JPN_theta_d_all_log <- log(data_JPN_all$Theta_d)
data_JPN_all$JPN_theta_d_all_log_minus_1 <- log(1 - data_JPN_all$Theta_d)
data_JPN_all[3]<- NULL

data_JPN_all$JPN_p_a_all <- data_JPN_all$p_a
data_JPN_all$JPN_p_a_all_log <- log(data_JPN_all$p_a)
data_JPN_all$JPN_p_a_all_log_minus_1 <- log(1 - data_JPN_all$p_a)
data_JPN_all[2]<- NULL

data_JPN_all$JPN_p_d_all <- data_JPN_all$p_d
data_JPN_all$JPN_p_d_all_log <- log(data_JPN_all$p_d)
data_JPN_all$JPN_p_d_all_log_minus_1 <- log(1 - data_JPN_all$p_d)
data_JPN_all[2]<- NULL

data_JPN_all$JPN_p_e_all <- data_JPN_all$p_e
data_JPN_all$JPN_p_e_all_log <- log(data_JPN_all$p_e)
data_JPN_all$JPN_p_e_all_log_minus_1 <- log(1 - data_JPN_all$p_e)
data_JPN_all[2]<- NULL

data_JPN_all$JPN_p_en_all <- data_JPN_all$p_en
data_JPN_all$JPN_p_en_all_log <- log(data_JPN_all$p_en)
data_JPN_all$JPN_p_en_all_log_minus_1 <- log(1 - data_JPN_all$p_en)
data_JPN_all[2]<- NULL

data_JPN_all$JPN_p_ra_all <- data_JPN_all$p_ra
data_JPN_all$JPN_p_ra_all_log <- log(data_JPN_all$p_ra)
data_JPN_all$JPN_p_ra_all_log_minus_1 <- log(1 - data_JPN_all$p_ra)
data_JPN_all[2]<- NULL

data_JPN_all$JPN_p_rd_all <- data_JPN_all$p_rd
data_JPN_all$JPN_p_rd_all_log <- log(data_JPN_all$p_rd)
data_JPN_all$JPN_p_rd_all_log_minus_1 <- log(1 - data_JPN_all$p_rd)
data_JPN_all[2]<- NULL

data_JPN_all$JPN_n_c_all <- data_JPN_all$n_c
data_JPN_all[2]<- NULL
data_JPN_all$JPN_n_p_all <- data_JPN_all$n_p
data_JPN_all[2]<- NULL
data_JPN_all$JPN_n_e_all <- data_JPN_all$n_e
data_JPN_all[2]<- NULL
data_JPN_all$JPN_N_all <- data_JPN_all$N
data_JPN_all[2]<- NULL
data_JPN_all$JPN_APL_all <- data_JPN_all$APL
data_JPN_all[2]<- NULL

data_JPN_all$JPN_all_extra_1 <- data_JPN_all$JPN_p_a_all * data_JPN_all$JPN_n_p_all
data_JPN_all$JPN_all_extra_2 <- data_JPN_all$JPN_p_e_all * data_JPN_all$JPN_n_e_all
data_JPN_all$JPN_all_extra_3 <- data_JPN_all$JPN_p_e_all * data_JPN_all$JPN_n_e_all * data_JPN_all$JPN_n_p_all
data_JPN_all$JPN_all_extra_4 <- data_JPN_all$JPN_p_d_all * data_JPN_all$JPN_n_c_all

data_JPN_all$JPN_all_certainly_1 <- log((data_JPN_all$JPN_N_all/2) - data_JPN_all$JPN_n_c_all)
data_JPN_all$JPN_all_certainly_2 <- log(data_JPN_all$JPN_n_c_all + ((data_JPN_all$JPN_n_p_all - data_JPN_all$JPN_n_c_all)/2))
data_JPN_all[1]<- NULL

# JPN Only Tipped
JPN_t_tip_only_tipped <- data_JPN_only_tipped$t_tip
data_JPN_only_tipped[2]<- NULL

data_JPN_only_tipped$JPN_theta_a_only_tipped <- data_JPN_only_tipped$Theta_a
data_JPN_only_tipped$JPN_theta_a_only_tipped_log <- log(data_JPN_only_tipped$Theta_a)
data_JPN_only_tipped$JPN_theta_a_only_tipped_log_minus_1 <- log(1 - data_JPN_only_tipped$Theta_a)
data_JPN_only_tipped[2]<- NULL

data_JPN_only_tipped$JPN_theta_d_only_tipped <- data_JPN_only_tipped$Theta_d
data_JPN_only_tipped$JPN_theta_d_only_tipped_log <- log(data_JPN_only_tipped$Theta_d)
data_JPN_only_tipped$JPN_theta_d_only_tipped_log_minus_1 <- log(1 - data_JPN_only_tipped$Theta_d)
data_JPN_only_tipped[3]<- NULL

data_JPN_only_tipped$JPN_p_a_only_tipped <- data_JPN_only_tipped$p_a
data_JPN_only_tipped$JPN_p_a_only_tipped_log <- log(data_JPN_only_tipped$p_a)
data_JPN_only_tipped$JPN_p_a_only_tipped_log_minus_1 <- log(1 - data_JPN_only_tipped$p_a)
data_JPN_only_tipped[2]<- NULL

data_JPN_only_tipped$JPN_p_d_only_tipped <- data_JPN_only_tipped$p_d
data_JPN_only_tipped$JPN_p_d_only_tipped_log <- log(data_JPN_only_tipped$p_d)
data_JPN_only_tipped$JPN_p_d_only_tipped_log_minus_1 <- log(1 - data_JPN_only_tipped$p_d)
data_JPN_only_tipped[2]<- NULL

data_JPN_only_tipped$JPN_p_e_only_tipped <- data_JPN_only_tipped$p_e
data_JPN_only_tipped$JPN_p_e_only_tipped_log <- log(data_JPN_only_tipped$p_e)
data_JPN_only_tipped$JPN_p_e_only_tipped_log_minus_1 <- log(1 - data_JPN_only_tipped$p_e)
data_JPN_only_tipped[2]<- NULL

data_JPN_only_tipped$JPN_p_en_only_tipped <- data_JPN_only_tipped$p_en
data_JPN_only_tipped$JPN_p_en_only_tipped_log <- log(data_JPN_only_tipped$p_en)
data_JPN_only_tipped$JPN_p_en_only_tipped_log_minus_1 <- log(1 - data_JPN_only_tipped$p_en)
data_JPN_only_tipped[2]<- NULL

data_JPN_only_tipped$JPN_p_ra_only_tipped <- data_JPN_only_tipped$p_ra
data_JPN_only_tipped$JPN_p_ra_only_tipped_log <- log(data_JPN_only_tipped$p_ra)
data_JPN_only_tipped$JPN_p_ra_only_tipped_log_minus_1 <- log(1 - data_JPN_only_tipped$p_ra)
data_JPN_only_tipped[2]<- NULL

data_JPN_only_tipped$JPN_p_rd_only_tipped <- data_JPN_only_tipped$p_rd
data_JPN_only_tipped$JPN_p_rd_only_tipped_log <- log(data_JPN_only_tipped$p_rd)
data_JPN_only_tipped$JPN_p_rd_only_tipped_log_minus_1 <- log(1 - data_JPN_only_tipped$p_rd)
data_JPN_only_tipped[2]<- NULL

data_JPN_only_tipped$JPN_n_c_only_tipped <- data_JPN_only_tipped$n_c
data_JPN_only_tipped[2]<- NULL
data_JPN_only_tipped$JPN_n_p_only_tipped <- data_JPN_only_tipped$n_p
data_JPN_only_tipped[2]<- NULL
data_JPN_only_tipped$JPN_n_e_only_tipped <- data_JPN_only_tipped$n_e
data_JPN_only_tipped[2]<- NULL
data_JPN_only_tipped$JPN_N_only_tipped <- data_JPN_only_tipped$N
data_JPN_only_tipped[2]<- NULL

data_JPN_only_tipped$JPN_APL_only_tipped <- data_JPN_only_tipped$APL
data_JPN_only_tipped[2]<- NULL

data_JPN_only_tipped$JPN_only_tipped_extra_1 <- data_JPN_only_tipped$JPN_p_a_only_tipped * data_JPN_only_tipped$JPN_n_p_only_tipped
data_JPN_only_tipped$JPN_only_tipped_extra_2 <- data_JPN_only_tipped$JPN_p_e_only_tipped * data_JPN_only_tipped$JPN_n_e_only_tipped
data_JPN_only_tipped$JPN_only_tipped_extra_3 <- data_JPN_only_tipped$JPN_p_e_only_tipped * data_JPN_only_tipped$JPN_n_e_only_tipped * data_JPN_only_tipped$JPN_n_p_only_tipped
data_JPN_only_tipped$JPN_only_tipped_extra_4 <- data_JPN_only_tipped$JPN_p_d_only_tipped * data_JPN_only_tipped$JPN_n_c_only_tipped

data_JPN_only_tipped$JPN_only_tipped_certainly_1 <- log((data_JPN_only_tipped$JPN_N_only_tipped/2) - data_JPN_only_tipped$JPN_n_c_only_tipped)
data_JPN_only_tipped$JPN_only_tipped_certainly_2 <- log(data_JPN_only_tipped$JPN_n_c_only_tipped + ((data_JPN_only_tipped$JPN_n_p_only_tipped - data_JPN_only_tipped$JPN_n_c_only_tipped)/2))
data_JPN_only_tipped[1]<- NULL

#------------------------------------------------------------------------------------
# parameter sets for the conditional varibale log(t_tip)
set.seed(42) # to avoid randomized results

global_parameter_log_ttip <- model.matrix(log(global_t_tip_only_tipped) ~. -1, data =data_global_only_tipped)
global_model_log_ttip <- cv.glmnet(global_parameter_log_ttip, log(global_t_tip_only_tipped), relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.1), alpha = 1, family='gaussian')
global_model_log_ttip_coeff_values <- coef(global_model_log_ttip, s="lambda.1se", gamma="gamma.1se")
global_model_log_ttip_coeff <- c(rownames(coef(global_model_log_ttip, s="lambda.1se", gamma="gamma.1se"))[coef(global_model_log_ttip, s="lambda.1se", gamma="gamma.1se")[,1]!= 0])
global_model_log_ttip_coeff_keep <- global_model_log_ttip_coeff[2:length(global_model_log_ttip_coeff)]
data_global_only_tipped_ols_coef_log_ttip <- data_global_only_tipped[global_model_log_ttip_coeff_keep]
global_OLS_model_log_ttip <- lm(log(global_t_tip_only_tipped) ~. -1, data=data_global_only_tipped_ols_coef_log_ttip)
global_OLS_model_log_ttip_coeff_values <- summary(global_OLS_model_log_ttip)



global_parameter_ttip_trans <- model.matrix(global_tipping_transformed_all ~. , data=data_global_all)[,-1]
global_model_ttip_trans <- cv.glmnet(global_parameter_ttip_trans, global_tipping_transformed_all, relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.1), alpha = 1, family='gaussian')
global_model_ttip_trans_coeff_values <- coef(global_model_ttip_trans, s="lambda.1se", gamma="gamma.1se")
global_model_ttip_trans_coeff <- c(rownames(coef(global_model_ttip_trans, s="lambda.1se", gamma="gamma.1se"))[coef(global_model_ttip_trans, s="lambda.1se", gamma="gamma.1se")[,1]!= 0])
global_model_ttip_trans_coeff_keep <- global_model_ttip_trans_coeff[2:length(global_model_ttip_trans_coeff)]
data_global_all_OLS_coef_ttip_trans <- data_global_all[global_model_ttip_trans_coeff_keep]
global_OLS_model_ttip_trans <- lm(global_tipping_transformed_all ~. -1, data=data_global_all_OLS_coef_ttip_trans)
global_OLS_model_ttip_trans_coeff_values <- summary(global_OLS_model_ttip_trans)


global_parameter_logistic <- model.matrix(global_tipped_or_not ~.  , data=data_global_all)[,-1]
global_model_logistic <- cv.glmnet(global_parameter_logistic, global_tipped_or_not, relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.1), alpha = 1, family='binomial')
global_model_logistic_coeff_values <- coef(global_model_logistic, s="lambda.1se", gamma="gamma.1se")
global_model_logistic_coeff <- c(rownames(coef(global_model_logistic, s="lambda.1se", gamma="gamma.1se"))[coef(global_model_logistic, s="lambda.1se", gamma="gamma.1se")[,1]!= 0])
global_model_logistic_coeff_keep <- global_model_logistic_coeff[2:length(global_model_logistic_coeff)]
data_global_all_OLS_coef_logistic <- data_global_all[global_model_logistic_coeff_keep]
global_OLS_model_logistic <- glm(global_tipped_or_not ~. -1, data=data_global_all_OLS_coef_logistic, family='binomial')
global_OLS_model_logistic_coeff_values <- summary(global_OLS_model_logistic)

# --- USA ---










