# read and load data
library(glmnet)
csv_IND_all <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/IND_all_Datframe_100000Simulations.csv'
csv_IND_only_tipped <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/IND_Only_tipped_Datframe_61349Simulations.csv'
data_IND_all <- read.csv(file = csv_IND_all)
data_IND_only_tipped <- read.csv(file = csv_IND_only_tipped) 
data_IND_all[data_IND_all==-2] <- Inf


# IND variables for all simulations and the only tipped ones
IND_tipped_or_not <- data_IND_all$is_tipped
data_IND_all[2]<- NULL
IND_t_tip_all <- data_IND_all$t_tip
IND_tipping_transformed_all <- 1/data_IND_all$t_tip
data_IND_all[2]<- NULL

data_IND_all$IND_theta_a_all <- data_IND_all$Theta_a
data_IND_all$IND_theta_a_all_log <- log(data_IND_all$Theta_a)
data_IND_all$IND_theta_a_all_log_minus_1 <- log(1 - data_IND_all$Theta_a)
data_IND_all$IND_1_div_theta_a_all <- 1/(data_IND_all$Theta_a)
data_IND_all$IND_root_theta_a_all <- sqrt(data_IND_all$Theta_a)
data_IND_all$IND_logistic_theta_a_all <- 1/(1 + exp( - data_IND_all$Theta_a))
data_IND_all$IND_quad_theta_a_all <- (data_IND_all$Theta_a)**2                        
data_IND_all[2]<- NULL

data_IND_all$IND_theta_d_all <- data_IND_all$Theta_d
data_IND_all$IND_theta_d_all_log <- log(data_IND_all$Theta_d)
data_IND_all$IND_theta_d_all_log_minus_1 <- log(1 - data_IND_all$Theta_d)
data_IND_all$IND_1_div_theta_d_all <- 1/(data_IND_all$Theta_d)
data_IND_all$IND_root_theta_d_all <- sqrt(data_IND_all$Theta_d)
data_IND_all$IND_logistic_theta_d_all <- 1/(1 + exp( - data_IND_all$Theta_d))
data_IND_all$IND_quad_theta_d_all <- (data_IND_all$Theta_d)**2  
data_IND_all[3]<- NULL

data_IND_all$IND_p_a_all <- data_IND_all$p_a
data_IND_all$IND_p_a_all_log <- log(data_IND_all$p_a)
data_IND_all$IND_p_a_all_log_minus_1 <- log(1 - data_IND_all$p_a)
data_IND_all$IND_1_div_p_a_all <- 1/(data_IND_all$p_a)
data_IND_all$IND_root_p_a_all <- sqrt(data_IND_all$p_a)
data_IND_all$IND_logistic_p_a_all <- 1/(1 + exp( - data_IND_all$p_a))
data_IND_all$IND_quad_p_a_all <- (data_IND_all$p_a)**2  
data_IND_all[2]<- NULL

data_IND_all$IND_p_d_all <- data_IND_all$p_d
data_IND_all$IND_p_d_all_log <- log(data_IND_all$p_d)
data_IND_all$IND_p_d_all_log_minus_1 <- log(1 - data_IND_all$p_d)
data_IND_all$IND_1_div_p_d_all <- 1/(data_IND_all$p_d)
data_IND_all$IND_root_p_d_all <- sqrt(data_IND_all$p_d)
data_IND_all$IND_logistic_p_d_all <- 1/(1 + exp( - data_IND_all$p_d))
data_IND_all$IND_quad_p_d_all <- (data_IND_all$p_d)**2  
data_IND_all[2]<- NULL

data_IND_all$IND_p_e_all <- data_IND_all$p_e
data_IND_all$IND_p_e_all_log <- log(data_IND_all$p_e)
data_IND_all$IND_p_e_all_log_minus_1 <- log(1 - data_IND_all$p_e)
data_IND_all$IND_1_div_p_e_all <- 1/(data_IND_all$p_e)
data_IND_all$IND_root_p_e_all <- sqrt(data_IND_all$p_e)
data_IND_all$IND_logistic_p_e_all <- 1/(1 + exp( - data_IND_all$p_e))
data_IND_all$IND_quad_p_e_all <- (data_IND_all$p_e)**2  
data_IND_all[2]<- NULL

data_IND_all$IND_p_en_all <- data_IND_all$p_en
data_IND_all$IND_p_en_all_log <- log(data_IND_all$p_en)
data_IND_all$IND_p_en_all_log_minus_1 <- log(1 - data_IND_all$p_en)
data_IND_all$IND_1_div_p_en_all <- 1/(data_IND_all$p_en)
data_IND_all$IND_root_p_en_all <- sqrt(data_IND_all$p_en)
data_IND_all$IND_logistic_p_en_all <- 1/(1 + exp( - data_IND_all$p_en))
data_IND_all$IND_quad_p_en_all <- (data_IND_all$p_en)**2  
data_IND_all[2]<- NULL

data_IND_all$IND_p_ra_all <- data_IND_all$p_ra
data_IND_all$IND_p_ra_all_log <- log(data_IND_all$p_ra)
data_IND_all$IND_p_ra_all_log_minus_1 <- log(1 - data_IND_all$p_ra)
data_IND_all$IND_1_div_p_ra_all <- 1/(data_IND_all$p_ra)
data_IND_all$IND_root_p_ra_all <- sqrt(data_IND_all$p_ra)
data_IND_all$IND_logistic_p_ra_all <- 1/(1 + exp( - data_IND_all$p_ra))
data_IND_all$IND_quad_p_ra_all <- (data_IND_all$p_ra)**2  
data_IND_all[2]<- NULL

data_IND_all$IND_p_rd_all <- data_IND_all$p_rd
data_IND_all$IND_p_rd_all_log <- log(data_IND_all$p_rd)
data_IND_all$IND_p_rd_all_log_minus_1 <- log(1 - data_IND_all$p_rd)
data_IND_all$IND_1_div_p_rd_all <- 1/(data_IND_all$p_rd)
data_IND_all$IND_root_p_rd_all <- sqrt(data_IND_all$p_rd)
data_IND_all$IND_logistic_p_rd_all <- 1/(1 + exp( - data_IND_all$p_rd))
data_IND_all$IND_quad_p_rd_all <- (data_IND_all$p_rd)**2  
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
data_IND_only_tipped$IND_1_div_theta_a_only_tipped <- 1/(data_IND_only_tipped$Theta_a)
data_IND_only_tipped$IND_root_theta_a_only_tipped <- sqrt(data_IND_only_tipped$Theta_a)
data_IND_only_tipped$IND_logistic_theta_a_only_tipped <- 1/(1 + exp( - data_IND_only_tipped$Theta_a))
data_IND_only_tipped$IND_quad_theta_a_only_tipped <- (data_IND_only_tipped$Theta_a)**2                        
data_IND_only_tipped[2]<- NULL

data_IND_only_tipped$IND_theta_d_only_tipped <- data_IND_only_tipped$Theta_d
data_IND_only_tipped$IND_theta_d_only_tipped_log <- log(data_IND_only_tipped$Theta_d)
data_IND_only_tipped$IND_theta_d_only_tipped_log_minus_1 <- log(1 - data_IND_only_tipped$Theta_d)
data_IND_only_tipped$IND_1_div_theta_d_only_tipped <- 1/(data_IND_only_tipped$Theta_d)
data_IND_only_tipped$IND_root_theta_d_only_tipped <- sqrt(data_IND_only_tipped$Theta_d)
data_IND_only_tipped$IND_logistic_theta_d_only_tipped <- 1/(1 + exp( - data_IND_only_tipped$Theta_d))
data_IND_only_tipped$IND_quad_theta_d_only_tipped <- (data_IND_only_tipped$Theta_d)**2  
data_IND_only_tipped[3]<- NULL

data_IND_only_tipped$IND_p_a_only_tipped <- data_IND_only_tipped$p_a
data_IND_only_tipped$IND_p_a_only_tipped_log <- log(data_IND_only_tipped$p_a)
data_IND_only_tipped$IND_p_a_only_tipped_log_minus_1 <- log(1 - data_IND_only_tipped$p_a)
data_IND_only_tipped$IND_1_div_p_a_only_tipped <- 1/(data_IND_only_tipped$p_a)
data_IND_only_tipped$IND_root_p_a_only_tipped <- sqrt(data_IND_only_tipped$p_a)
data_IND_only_tipped$IND_logistic_p_a_only_tipped <- 1/(1 + exp( - data_IND_only_tipped$p_a))
data_IND_only_tipped$IND_quad_p_a_only_tipped <- (data_IND_only_tipped$p_a)**2  
data_IND_only_tipped[2]<- NULL

data_IND_only_tipped$IND_p_d_only_tipped <- data_IND_only_tipped$p_d
data_IND_only_tipped$IND_p_d_only_tipped_log <- log(data_IND_only_tipped$p_d)
data_IND_only_tipped$IND_p_d_only_tipped_log_minus_1 <- log(1 - data_IND_only_tipped$p_d)
data_IND_only_tipped$IND_1_div_p_d_only_tipped <- 1/(data_IND_only_tipped$p_d)
data_IND_only_tipped$IND_root_p_d_only_tipped <- sqrt(data_IND_only_tipped$p_d)
data_IND_only_tipped$IND_logistic_p_d_only_tipped <- 1/(1 + exp( - data_IND_only_tipped$p_d))
data_IND_only_tipped$IND_quad_p_d_only_tipped <- (data_IND_only_tipped$p_d)**2  
data_IND_only_tipped[2]<- NULL

data_IND_only_tipped$IND_p_e_only_tipped <- data_IND_only_tipped$p_e
data_IND_only_tipped$IND_p_e_only_tipped_log <- log(data_IND_only_tipped$p_e)
data_IND_only_tipped$IND_p_e_only_tipped_log_minus_1 <- log(1 - data_IND_only_tipped$p_e)
data_IND_only_tipped$IND_1_div_p_e_only_tipped <- 1/(data_IND_only_tipped$p_e)
data_IND_only_tipped$IND_root_p_e_only_tipped <- sqrt(data_IND_only_tipped$p_e)
data_IND_only_tipped$IND_logistic_p_e_only_tipped <- 1/(1 + exp( - data_IND_only_tipped$p_e))
data_IND_only_tipped$IND_quad_p_e_only_tipped <- (data_IND_only_tipped$p_e)**2  
data_IND_only_tipped[2]<- NULL

data_IND_only_tipped$IND_p_en_only_tipped <- data_IND_only_tipped$p_en
data_IND_only_tipped$IND_p_en_only_tipped_log <- log(data_IND_only_tipped$p_en)
data_IND_only_tipped$IND_p_en_only_tipped_log_minus_1 <- log(1 - data_IND_only_tipped$p_en)
data_IND_only_tipped$IND_1_div_p_en_only_tipped <- 1/(data_IND_only_tipped$p_en)
data_IND_only_tipped$IND_root_p_en_only_tipped <- sqrt(data_IND_only_tipped$p_en)
data_IND_only_tipped$IND_logistic_p_en_only_tipped <- 1/(1 + exp( - data_IND_only_tipped$p_en))
data_IND_only_tipped$IND_quad_p_en_only_tipped <- (data_IND_only_tipped$p_en)**2  
data_IND_only_tipped[2]<- NULL

data_IND_only_tipped$IND_p_ra_only_tipped <- data_IND_only_tipped$p_ra
data_IND_only_tipped$IND_p_ra_only_tipped_log <- log(data_IND_only_tipped$p_ra)
data_IND_only_tipped$IND_p_ra_only_tipped_log_minus_1 <- log(1 - data_IND_only_tipped$p_ra)
data_IND_only_tipped$IND_1_div_p_ra_only_tipped <- 1/(data_IND_only_tipped$p_ra)
data_IND_only_tipped$IND_root_p_ra_only_tipped <- sqrt(data_IND_only_tipped$p_ra)
data_IND_only_tipped$IND_logistic_p_ra_only_tipped <- 0.0001/(1 + exp( - data_IND_only_tipped$p_ra))
data_IND_only_tipped$IND_quad_p_ra_only_tipped <- (data_IND_only_tipped$p_ra)**2  
data_IND_only_tipped[2]<- NULL

data_IND_only_tipped$IND_p_rd_only_tipped <- data_IND_only_tipped$p_rd
data_IND_only_tipped$IND_p_rd_only_tipped_log <- log(data_IND_only_tipped$p_rd)
data_IND_only_tipped$IND_p_rd_only_tipped_log_minus_1 <- log(1 - data_IND_only_tipped$p_rd)
data_IND_only_tipped$IND_1_div_p_rd_only_tipped <- 1/(data_IND_only_tipped$p_rd)
data_IND_only_tipped$IND_root_p_rd_only_tipped <- sqrt(data_IND_only_tipped$p_rd)
data_IND_only_tipped$IND_logistic_p_rd_only_tipped <- 0.0001/(1 + exp( - data_IND_only_tipped$p_rd))
data_IND_only_tipped$IND_quad_p_rd_only_tipped <- (data_IND_only_tipped$p_rd)**2  
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




# -----------------------------------------------------------------------
# Do the regressions
set.seed(42) # to avoid randomized results

IND_parameter_log_ttip <- model.matrix(log(IND_t_tip_only_tipped) ~. -1, data =data_IND_only_tipped)
IND_model_log_ttip <- cv.glmnet(IND_parameter_log_ttip, log(IND_t_tip_only_tipped), relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.1), alpha = 1, family='gaussian')
IND_model_log_ttip_coeff_values <- coef(IND_model_log_ttip, s="lambda.1se", gamma="gamma.1se")
IND_model_log_ttip_coeff <- c(rownames(coef(IND_model_log_ttip, s="lambda.1se", gamma="gamma.1se"))[coef(IND_model_log_ttip, s="lambda.1se", gamma="gamma.1se")[,1]!= 0])
IND_model_log_ttip_coeff_keep <- IND_model_log_ttip_coeff[2:length(IND_model_log_ttip_coeff)]
data_IND_only_tipped_ols_coef_log_ttip <- data_IND_only_tipped[IND_model_log_ttip_coeff_keep]
IND_OLS_model_log_ttip <- lm(log(IND_t_tip_only_tipped) ~. -1, data=data_IND_only_tipped_ols_coef_log_ttip)
IND_OLS_model_log_ttip_coeff_values <- summary(IND_OLS_model_log_ttip)


set.seed(42)
IND_parameter_ttip_trans <- model.matrix(IND_tipping_transformed_all ~. , data=data_IND_all)[,-1]
IND_model_ttip_trans <- cv.glmnet(IND_parameter_ttip_trans, IND_tipping_transformed_all, relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.1), alpha = 1, family='gaussian')
IND_model_ttip_trans_coeff_values <- coef(IND_model_ttip_trans, s="lambda.1se", gamma="gamma.1se")
IND_model_ttip_trans_coeff <- c(rownames(coef(IND_model_ttip_trans, s="lambda.1se", gamma="gamma.1se"))[coef(IND_model_ttip_trans, s="lambda.1se", gamma="gamma.1se")[,1]!= 0])
IND_model_ttip_trans_coeff_keep <- IND_model_ttip_trans_coeff[2:length(IND_model_ttip_trans_coeff)]
data_IND_all_OLS_coef_ttip_trans <- data_IND_all[IND_model_ttip_trans_coeff_keep]
IND_OLS_model_ttip_trans <- lm(IND_tipping_transformed_all ~. -1, data=data_IND_all_OLS_coef_ttip_trans)
IND_OLS_model_ttip_trans_coeff_values <- summary(IND_OLS_model_ttip_trans)


IND_parameter_logistic <- model.matrix(IND_tipped_or_not ~.  , data=data_IND_all)[,-1]
IND_model_logistic <- cv.glmnet(IND_parameter_logistic, IND_tipped_or_not, relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.1), alpha = 1, family='binomial')
IND_model_logistic_coeff_values <- coef(IND_model_logistic, s="lambda.1se", gamma="gamma.1se")
IND_model_logistic_coeff <- c(rownames(coef(IND_model_logistic, s="lambda.1se", gamma="gamma.1se"))[coef(IND_model_logistic, s="lambda.1se", gamma="gamma.1se")[,1]!= 0])
IND_model_logistic_coeff_keep <- IND_model_logistic_coeff[2:length(IND_model_logistic_coeff)]
data_IND_all_OLS_coef_logistic <- data_IND_all[IND_model_logistic_coeff_keep]
IND_OLS_model_logistic <- glm(IND_tipped_or_not ~. -1, data=data_IND_all_OLS_coef_logistic, family='binomial')
IND_OLS_model_logistic_coeff_values <- summary(IND_OLS_model_logistic)

