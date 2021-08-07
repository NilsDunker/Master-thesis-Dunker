# read and load data
library(glmnet)
csv_global_all <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/Global_all_Datframe_100000Simulations.csv'
csv_global_only_tipped <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/Global_Only_tipped_Datframe_53178Simulations.csv'
data_global_all <- read.csv(file = csv_global_all)
data_global_only_tipped <- read.csv(file = csv_global_only_tipped) 
data_global_all[data_global_all==-2] <- Inf


# global variables for all simulations and the only tipped ones
global_tipped_or_not <- data_global_all$is_tipped
data_global_all[2]<- NULL
global_t_tip_all <- data_global_all$t_tip
global_tipping_transformed_all <- 1/data_global_all$t_tip
data_global_all[2]<- NULL

data_global_all$global_theta_a_all <- data_global_all$Theta_a
data_global_all$global_theta_a_all_log <- log(data_global_all$Theta_a)
data_global_all$global_theta_a_all_log_minus_1 <- log(1 - data_global_all$Theta_a)
data_global_all$global_1_div_theta_a_all <- 1/(data_global_all$Theta_a)
data_global_all$global_root_theta_a_all <- sqrt(data_global_all$Theta_a)
data_global_all$global_logistic_theta_a_all <- 1/(1 + exp( - data_global_all$Theta_a))
data_global_all$global_quad_theta_a_all <- (data_global_all$Theta_a)**2                        
data_global_all[2]<- NULL

data_global_all$global_theta_d_all <- data_global_all$Theta_d
data_global_all$global_theta_d_all_log <- log(data_global_all$Theta_d)
data_global_all$global_theta_d_all_log_minus_1 <- log(1 - data_global_all$Theta_d)
data_global_all$global_1_div_theta_d_all <- 1/(data_global_all$Theta_d)
data_global_all$global_root_theta_d_all <- sqrt(data_global_all$Theta_d)
data_global_all$global_logistic_theta_d_all <- 1/(1 + exp( - data_global_all$Theta_d))
data_global_all$global_quad_theta_d_all <- (data_global_all$Theta_d)**2  
data_global_all[3]<- NULL

data_global_all$global_p_a_all <- data_global_all$p_a
data_global_all$global_p_a_all_log <- log(data_global_all$p_a)
data_global_all$global_p_a_all_log_minus_1 <- log(1 - data_global_all$p_a)
data_global_all$global_1_div_p_a_all <- 1/(data_global_all$p_a)
data_global_all$global_root_p_a_all <- sqrt(data_global_all$p_a)
data_global_all$global_logistic_p_a_all <- 1/(1 + exp( - data_global_all$p_a))
data_global_all$global_quad_p_a_all <- (data_global_all$p_a)**2  
data_global_all[2]<- NULL

data_global_all$global_p_d_all <- data_global_all$p_d
data_global_all$global_p_d_all_log <- log(data_global_all$p_d)
data_global_all$global_p_d_all_log_minus_1 <- log(1 - data_global_all$p_d)
data_global_all$global_1_div_p_d_all <- 1/(data_global_all$p_d)
data_global_all$global_root_p_d_all <- sqrt(data_global_all$p_d)
data_global_all$global_logistic_p_d_all <- 1/(1 + exp( - data_global_all$p_d))
data_global_all$global_quad_p_d_all <- (data_global_all$p_d)**2  
data_global_all[2]<- NULL

data_global_all$global_p_e_all <- data_global_all$p_e
data_global_all$global_p_e_all_log <- log(data_global_all$p_e)
data_global_all$global_p_e_all_log_minus_1 <- log(1 - data_global_all$p_e)
data_global_all$global_1_div_p_e_all <- 1/(data_global_all$p_e)
data_global_all$global_root_p_e_all <- sqrt(data_global_all$p_e)
data_global_all$global_logistic_p_e_all <- 1/(1 + exp( - data_global_all$p_e))
data_global_all$global_quad_p_e_all <- (data_global_all$p_e)**2  
data_global_all[2]<- NULL

data_global_all$global_p_en_all <- data_global_all$p_en
data_global_all$global_p_en_all_log <- log(data_global_all$p_en)
data_global_all$global_p_en_all_log_minus_1 <- log(1 - data_global_all$p_en)
data_global_all$global_1_div_p_en_all <- 1/(data_global_all$p_en)
data_global_all$global_root_p_en_all <- sqrt(data_global_all$p_en)
data_global_all$global_logistic_p_en_all <- 1/(1 + exp( - data_global_all$p_en))
data_global_all$global_quad_p_en_all <- (data_global_all$p_en)**2  
data_global_all[2]<- NULL

data_global_all$global_p_ra_all <- data_global_all$p_ra
data_global_all$global_p_ra_all_log <- log(data_global_all$p_ra)
data_global_all$global_p_ra_all_log_minus_1 <- log(1 - data_global_all$p_ra)
data_global_all$global_1_div_p_ra_all <- 1/(data_global_all$p_ra)
data_global_all$global_root_p_ra_all <- sqrt(data_global_all$p_ra)
data_global_all$global_logistic_p_ra_all <- 1/(1 + exp( - data_global_all$p_ra))
data_global_all$global_quad_p_ra_all <- (data_global_all$p_ra)**2  
data_global_all[2]<- NULL

data_global_all$global_p_rd_all <- data_global_all$p_rd
data_global_all$global_p_rd_all_log <- log(data_global_all$p_rd)
data_global_all$global_p_rd_all_log_minus_1 <- log(1 - data_global_all$p_rd)
data_global_all$global_1_div_p_rd_all <- 1/(data_global_all$p_rd)
data_global_all$global_root_p_rd_all <- sqrt(data_global_all$p_rd)
data_global_all$global_logistic_p_rd_all <- 1/(1 + exp( - data_global_all$p_rd))
data_global_all$global_quad_p_rd_all <- (data_global_all$p_rd)**2  
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
data_global_only_tipped$global_1_div_theta_a_only_tipped <- 1/(data_global_only_tipped$Theta_a)
data_global_only_tipped$global_root_theta_a_only_tipped <- sqrt(data_global_only_tipped$Theta_a)
data_global_only_tipped$global_logistic_theta_a_only_tipped <- 1/(1 + exp( - data_global_only_tipped$Theta_a))
data_global_only_tipped$global_quad_theta_a_only_tipped <- (data_global_only_tipped$Theta_a)**2                        
data_global_only_tipped[2]<- NULL

data_global_only_tipped$global_theta_d_only_tipped <- data_global_only_tipped$Theta_d
data_global_only_tipped$global_theta_d_only_tipped_log <- log(data_global_only_tipped$Theta_d)
data_global_only_tipped$global_theta_d_only_tipped_log_minus_1 <- log(1 - data_global_only_tipped$Theta_d)
data_global_only_tipped$global_1_div_theta_d_only_tipped <- 1/(data_global_only_tipped$Theta_d)
data_global_only_tipped$global_root_theta_d_only_tipped <- sqrt(data_global_only_tipped$Theta_d)
data_global_only_tipped$global_logistic_theta_d_only_tipped <- 1/(1 + exp( - data_global_only_tipped$Theta_d))
data_global_only_tipped$global_quad_theta_d_only_tipped <- (data_global_only_tipped$Theta_d)**2  
data_global_only_tipped[3]<- NULL

data_global_only_tipped$global_p_a_only_tipped <- data_global_only_tipped$p_a
data_global_only_tipped$global_p_a_only_tipped_log <- log(data_global_only_tipped$p_a)
data_global_only_tipped$global_p_a_only_tipped_log_minus_1 <- log(1 - data_global_only_tipped$p_a)
data_global_only_tipped$global_1_div_p_a_only_tipped <- 1/(data_global_only_tipped$p_a)
data_global_only_tipped$global_root_p_a_only_tipped <- sqrt(data_global_only_tipped$p_a)
data_global_only_tipped$global_logistic_p_a_only_tipped <- 1/(1 + exp( - data_global_only_tipped$p_a))
data_global_only_tipped$global_quad_p_a_only_tipped <- (data_global_only_tipped$p_a)**2  
data_global_only_tipped[2]<- NULL

data_global_only_tipped$global_p_d_only_tipped <- data_global_only_tipped$p_d
data_global_only_tipped$global_p_d_only_tipped_log <- log(data_global_only_tipped$p_d)
data_global_only_tipped$global_p_d_only_tipped_log_minus_1 <- log(1 - data_global_only_tipped$p_d)
data_global_only_tipped$global_1_div_p_d_only_tipped <- 1/(data_global_only_tipped$p_d)
data_global_only_tipped$global_root_p_d_only_tipped <- sqrt(data_global_only_tipped$p_d)
data_global_only_tipped$global_logistic_p_d_only_tipped <- 1/(1 + exp( - data_global_only_tipped$p_d))
data_global_only_tipped$global_quad_p_d_only_tipped <- (data_global_only_tipped$p_d)**2  
data_global_only_tipped[2]<- NULL

data_global_only_tipped$global_p_e_only_tipped <- data_global_only_tipped$p_e
data_global_only_tipped$global_p_e_only_tipped_log <- log(data_global_only_tipped$p_e)
data_global_only_tipped$global_p_e_only_tipped_log_minus_1 <- log(1 - data_global_only_tipped$p_e)
data_global_only_tipped$global_1_div_p_e_only_tipped <- 1/(data_global_only_tipped$p_e)
data_global_only_tipped$global_root_p_e_only_tipped <- sqrt(data_global_only_tipped$p_e)
data_global_only_tipped$global_logistic_p_e_only_tipped <- 1/(1 + exp( - data_global_only_tipped$p_e))
data_global_only_tipped$global_quad_p_e_only_tipped <- (data_global_only_tipped$p_e)**2  
data_global_only_tipped[2]<- NULL

data_global_only_tipped$global_p_en_only_tipped <- data_global_only_tipped$p_en
data_global_only_tipped$global_p_en_only_tipped_log <- log(data_global_only_tipped$p_en)
data_global_only_tipped$global_p_en_only_tipped_log_minus_1 <- log(1 - data_global_only_tipped$p_en)
data_global_only_tipped$global_1_div_p_en_only_tipped <- 1/(data_global_only_tipped$p_en)
data_global_only_tipped$global_root_p_en_only_tipped <- sqrt(data_global_only_tipped$p_en)
data_global_only_tipped$global_logistic_p_en_only_tipped <- 1/(1 + exp( - data_global_only_tipped$p_en))
data_global_only_tipped$global_quad_p_en_only_tipped <- (data_global_only_tipped$p_en)**2  
data_global_only_tipped[2]<- NULL

data_global_only_tipped$global_p_ra_only_tipped <- data_global_only_tipped$p_ra
data_global_only_tipped$global_p_ra_only_tipped_log <- log(data_global_only_tipped$p_ra)
data_global_only_tipped$global_p_ra_only_tipped_log_minus_1 <- log(1 - data_global_only_tipped$p_ra)
data_global_only_tipped$global_1_div_p_ra_only_tipped <- 1/(data_global_only_tipped$p_ra)
data_global_only_tipped$global_root_p_ra_only_tipped <- sqrt(data_global_only_tipped$p_ra)
data_global_only_tipped$global_logistic_p_ra_only_tipped <- 0.0001/(1 + exp( - data_global_only_tipped$p_ra))
data_global_only_tipped$global_quad_p_ra_only_tipped <- (data_global_only_tipped$p_ra)**2  
data_global_only_tipped[2]<- NULL

data_global_only_tipped$global_p_rd_only_tipped <- data_global_only_tipped$p_rd
data_global_only_tipped$global_p_rd_only_tipped_log <- log(data_global_only_tipped$p_rd)
data_global_only_tipped$global_p_rd_only_tipped_log_minus_1 <- log(1 - data_global_only_tipped$p_rd)
data_global_only_tipped$global_1_div_p_rd_only_tipped <- 1/(data_global_only_tipped$p_rd)
data_global_only_tipped$global_root_p_rd_only_tipped <- sqrt(data_global_only_tipped$p_rd)
data_global_only_tipped$global_logistic_p_rd_only_tipped <- 0.0001/(1 + exp( - data_global_only_tipped$p_rd))
data_global_only_tipped$global_quad_p_rd_only_tipped <- (data_global_only_tipped$p_rd)**2  
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




# -----------------------------------------------------------------------
# Do the regressions
set.seed(42) # to avoid randomized results

global_parameter_log_ttip <- model.matrix(log(global_t_tip_only_tipped) ~. -1, data =data_global_only_tipped)
global_model_log_ttip <- cv.glmnet(global_parameter_log_ttip, log(global_t_tip_only_tipped), relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.1), alpha = 1, family='gaussian')
global_model_log_ttip_coeff_values <- coef(global_model_log_ttip, s="lambda.1se", gamma="gamma.1se")
global_model_log_ttip_coeff <- c(rownames(coef(global_model_log_ttip, s="lambda.1se", gamma="gamma.1se"))[coef(global_model_log_ttip, s="lambda.1se", gamma="gamma.1se")[,1]!= 0])
global_model_log_ttip_coeff_keep <- global_model_log_ttip_coeff[2:length(global_model_log_ttip_coeff)]
data_global_only_tipped_ols_coef_log_ttip <- data_global_only_tipped[global_model_log_ttip_coeff_keep]
global_OLS_model_log_ttip <- lm(log(global_t_tip_only_tipped) ~. -1, data=data_global_only_tipped_ols_coef_log_ttip)
global_OLS_model_log_ttip_coeff_values <- summary(global_OLS_model_log_ttip)


set.seed(42)
global_parameter_ttip_trans <- model.matrix(global_tipping_transformed_all ~. , data=data_global_all)[,-1]
global_model_ttip_trans <- cv.glmnet(global_parameter_ttip_trans, global_tipping_transformed_all, relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.0001), alpha = 1, family='gaussian')
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

