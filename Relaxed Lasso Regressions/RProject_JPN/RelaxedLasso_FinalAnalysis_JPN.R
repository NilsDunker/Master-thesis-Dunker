# read and load data
library(glmnet)
csv_JPN_all <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/JPN_all_Datframe_100000Simulations.csv'
csv_JPN_only_tipped <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/JPN_Only_tipped_Datframe_56740Simulations.csv'
data_JPN_all <- read.csv(file = csv_JPN_all)
data_JPN_only_tipped <- read.csv(file = csv_JPN_only_tipped) 
data_JPN_all[data_JPN_all==-2] <- Inf


# JPN variables for all simulations and the only tipped ones
JPN_tipped_or_not <- data_JPN_all$is_tipped
data_JPN_all[2]<- NULL
JPN_t_tip_all <- data_JPN_all$t_tip
JPN_tipping_transformed_all <- 1/data_JPN_all$t_tip
data_JPN_all[2]<- NULL

data_JPN_all$JPN_theta_a_all <- data_JPN_all$Theta_a
data_JPN_all$JPN_theta_a_all_log <- log(data_JPN_all$Theta_a)
data_JPN_all$JPN_theta_a_all_log_minus_1 <- log(1 - data_JPN_all$Theta_a)
data_JPN_all$JPN_1_div_theta_a_all <- 1/(data_JPN_all$Theta_a)
data_JPN_all$JPN_root_theta_a_all <- sqrt(data_JPN_all$Theta_a)
data_JPN_all$JPN_logistic_theta_a_all <- 1/(1 + exp( - data_JPN_all$Theta_a))
data_JPN_all$JPN_quad_theta_a_all <- (data_JPN_all$Theta_a)**2                        
data_JPN_all[2]<- NULL

data_JPN_all$JPN_theta_d_all <- data_JPN_all$Theta_d
data_JPN_all$JPN_theta_d_all_log <- log(data_JPN_all$Theta_d)
data_JPN_all$JPN_theta_d_all_log_minus_1 <- log(1 - data_JPN_all$Theta_d)
data_JPN_all$JPN_1_div_theta_d_all <- 1/(data_JPN_all$Theta_d)
data_JPN_all$JPN_root_theta_d_all <- sqrt(data_JPN_all$Theta_d)
data_JPN_all$JPN_logistic_theta_d_all <- 1/(1 + exp( - data_JPN_all$Theta_d))
data_JPN_all$JPN_quad_theta_d_all <- (data_JPN_all$Theta_d)**2  
data_JPN_all[3]<- NULL

data_JPN_all$JPN_p_a_all <- data_JPN_all$p_a
data_JPN_all$JPN_p_a_all_log <- log(data_JPN_all$p_a)
data_JPN_all$JPN_p_a_all_log_minus_1 <- log(1 - data_JPN_all$p_a)
data_JPN_all$JPN_1_div_p_a_all <- 1/(data_JPN_all$p_a)
data_JPN_all$JPN_root_p_a_all <- sqrt(data_JPN_all$p_a)
data_JPN_all$JPN_logistic_p_a_all <- 1/(1 + exp( - data_JPN_all$p_a))
data_JPN_all$JPN_quad_p_a_all <- (data_JPN_all$p_a)**2  
data_JPN_all[2]<- NULL

data_JPN_all$JPN_p_d_all <- data_JPN_all$p_d
data_JPN_all$JPN_p_d_all_log <- log(data_JPN_all$p_d)
data_JPN_all$JPN_p_d_all_log_minus_1 <- log(1 - data_JPN_all$p_d)
data_JPN_all$JPN_1_div_p_d_all <- 1/(data_JPN_all$p_d)
data_JPN_all$JPN_root_p_d_all <- sqrt(data_JPN_all$p_d)
data_JPN_all$JPN_logistic_p_d_all <- 1/(1 + exp( - data_JPN_all$p_d))
data_JPN_all$JPN_quad_p_d_all <- (data_JPN_all$p_d)**2  
data_JPN_all[2]<- NULL

data_JPN_all$JPN_p_e_all <- data_JPN_all$p_e
data_JPN_all$JPN_p_e_all_log <- log(data_JPN_all$p_e)
data_JPN_all$JPN_p_e_all_log_minus_1 <- log(1 - data_JPN_all$p_e)
data_JPN_all$JPN_1_div_p_e_all <- 1/(data_JPN_all$p_e)
data_JPN_all$JPN_root_p_e_all <- sqrt(data_JPN_all$p_e)
data_JPN_all$JPN_logistic_p_e_all <- 1/(1 + exp( - data_JPN_all$p_e))
data_JPN_all$JPN_quad_p_e_all <- (data_JPN_all$p_e)**2  
data_JPN_all[2]<- NULL

data_JPN_all$JPN_p_en_all <- data_JPN_all$p_en
data_JPN_all$JPN_p_en_all_log <- log(data_JPN_all$p_en)
data_JPN_all$JPN_p_en_all_log_minus_1 <- log(1 - data_JPN_all$p_en)
data_JPN_all$JPN_1_div_p_en_all <- 1/(data_JPN_all$p_en)
data_JPN_all$JPN_root_p_en_all <- sqrt(data_JPN_all$p_en)
data_JPN_all$JPN_logistic_p_en_all <- 1/(1 + exp( - data_JPN_all$p_en))
data_JPN_all$JPN_quad_p_en_all <- (data_JPN_all$p_en)**2  
data_JPN_all[2]<- NULL

data_JPN_all$JPN_p_ra_all <- data_JPN_all$p_ra
data_JPN_all$JPN_p_ra_all_log <- log(data_JPN_all$p_ra)
data_JPN_all$JPN_p_ra_all_log_minus_1 <- log(1 - data_JPN_all$p_ra)
data_JPN_all$JPN_1_div_p_ra_all <- 1/(data_JPN_all$p_ra)
data_JPN_all$JPN_root_p_ra_all <- sqrt(data_JPN_all$p_ra)
data_JPN_all$JPN_logistic_p_ra_all <- 1/(1 + exp( - data_JPN_all$p_ra))
data_JPN_all$JPN_quad_p_ra_all <- (data_JPN_all$p_ra)**2  
data_JPN_all[2]<- NULL

data_JPN_all$JPN_p_rd_all <- data_JPN_all$p_rd
data_JPN_all$JPN_p_rd_all_log <- log(data_JPN_all$p_rd)
data_JPN_all$JPN_p_rd_all_log_minus_1 <- log(1 - data_JPN_all$p_rd)
data_JPN_all$JPN_1_div_p_rd_all <- 1/(data_JPN_all$p_rd)
data_JPN_all$JPN_root_p_rd_all <- sqrt(data_JPN_all$p_rd)
data_JPN_all$JPN_logistic_p_rd_all <- 1/(1 + exp( - data_JPN_all$p_rd))
data_JPN_all$JPN_quad_p_rd_all <- (data_JPN_all$p_rd)**2  
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
data_JPN_only_tipped$JPN_1_div_theta_a_only_tipped <- 1/(data_JPN_only_tipped$Theta_a)
data_JPN_only_tipped$JPN_root_theta_a_only_tipped <- sqrt(data_JPN_only_tipped$Theta_a)
data_JPN_only_tipped$JPN_logistic_theta_a_only_tipped <- 1/(1 + exp( - data_JPN_only_tipped$Theta_a))
data_JPN_only_tipped$JPN_quad_theta_a_only_tipped <- (data_JPN_only_tipped$Theta_a)**2                        
data_JPN_only_tipped[2]<- NULL

data_JPN_only_tipped$JPN_theta_d_only_tipped <- data_JPN_only_tipped$Theta_d
data_JPN_only_tipped$JPN_theta_d_only_tipped_log <- log(data_JPN_only_tipped$Theta_d)
data_JPN_only_tipped$JPN_theta_d_only_tipped_log_minus_1 <- log(1 - data_JPN_only_tipped$Theta_d)
data_JPN_only_tipped$JPN_1_div_theta_d_only_tipped <- 1/(data_JPN_only_tipped$Theta_d)
data_JPN_only_tipped$JPN_root_theta_d_only_tipped <- sqrt(data_JPN_only_tipped$Theta_d)
data_JPN_only_tipped$JPN_logistic_theta_d_only_tipped <- 1/(1 + exp( - data_JPN_only_tipped$Theta_d))
data_JPN_only_tipped$JPN_quad_theta_d_only_tipped <- (data_JPN_only_tipped$Theta_d)**2  
data_JPN_only_tipped[3]<- NULL

data_JPN_only_tipped$JPN_p_a_only_tipped <- data_JPN_only_tipped$p_a
data_JPN_only_tipped$JPN_p_a_only_tipped_log <- log(data_JPN_only_tipped$p_a)
data_JPN_only_tipped$JPN_p_a_only_tipped_log_minus_1 <- log(1 - data_JPN_only_tipped$p_a)
data_JPN_only_tipped$JPN_1_div_p_a_only_tipped <- 1/(data_JPN_only_tipped$p_a)
data_JPN_only_tipped$JPN_root_p_a_only_tipped <- sqrt(data_JPN_only_tipped$p_a)
data_JPN_only_tipped$JPN_logistic_p_a_only_tipped <- 1/(1 + exp( - data_JPN_only_tipped$p_a))
data_JPN_only_tipped$JPN_quad_p_a_only_tipped <- (data_JPN_only_tipped$p_a)**2  
data_JPN_only_tipped[2]<- NULL

data_JPN_only_tipped$JPN_p_d_only_tipped <- data_JPN_only_tipped$p_d
data_JPN_only_tipped$JPN_p_d_only_tipped_log <- log(data_JPN_only_tipped$p_d)
data_JPN_only_tipped$JPN_p_d_only_tipped_log_minus_1 <- log(1 - data_JPN_only_tipped$p_d)
data_JPN_only_tipped$JPN_1_div_p_d_only_tipped <- 1/(data_JPN_only_tipped$p_d)
data_JPN_only_tipped$JPN_root_p_d_only_tipped <- sqrt(data_JPN_only_tipped$p_d)
data_JPN_only_tipped$JPN_logistic_p_d_only_tipped <- 1/(1 + exp( - data_JPN_only_tipped$p_d))
data_JPN_only_tipped$JPN_quad_p_d_only_tipped <- (data_JPN_only_tipped$p_d)**2  
data_JPN_only_tipped[2]<- NULL

data_JPN_only_tipped$JPN_p_e_only_tipped <- data_JPN_only_tipped$p_e
data_JPN_only_tipped$JPN_p_e_only_tipped_log <- log(data_JPN_only_tipped$p_e)
data_JPN_only_tipped$JPN_p_e_only_tipped_log_minus_1 <- log(1 - data_JPN_only_tipped$p_e)
data_JPN_only_tipped$JPN_1_div_p_e_only_tipped <- 1/(data_JPN_only_tipped$p_e)
data_JPN_only_tipped$JPN_root_p_e_only_tipped <- sqrt(data_JPN_only_tipped$p_e)
data_JPN_only_tipped$JPN_logistic_p_e_only_tipped <- 1/(1 + exp( - data_JPN_only_tipped$p_e))
data_JPN_only_tipped$JPN_quad_p_e_only_tipped <- (data_JPN_only_tipped$p_e)**2  
data_JPN_only_tipped[2]<- NULL

data_JPN_only_tipped$JPN_p_en_only_tipped <- data_JPN_only_tipped$p_en
data_JPN_only_tipped$JPN_p_en_only_tipped_log <- log(data_JPN_only_tipped$p_en)
data_JPN_only_tipped$JPN_p_en_only_tipped_log_minus_1 <- log(1 - data_JPN_only_tipped$p_en)
data_JPN_only_tipped$JPN_1_div_p_en_only_tipped <- 1/(data_JPN_only_tipped$p_en)
data_JPN_only_tipped$JPN_root_p_en_only_tipped <- sqrt(data_JPN_only_tipped$p_en)
data_JPN_only_tipped$JPN_logistic_p_en_only_tipped <- 1/(1 + exp( - data_JPN_only_tipped$p_en))
data_JPN_only_tipped$JPN_quad_p_en_only_tipped <- (data_JPN_only_tipped$p_en)**2  
data_JPN_only_tipped[2]<- NULL

data_JPN_only_tipped$JPN_p_ra_only_tipped <- data_JPN_only_tipped$p_ra
data_JPN_only_tipped$JPN_p_ra_only_tipped_log <- log(data_JPN_only_tipped$p_ra)
data_JPN_only_tipped$JPN_p_ra_only_tipped_log_minus_1 <- log(1 - data_JPN_only_tipped$p_ra)
data_JPN_only_tipped$JPN_1_div_p_ra_only_tipped <- 1/(data_JPN_only_tipped$p_ra)
data_JPN_only_tipped$JPN_root_p_ra_only_tipped <- sqrt(data_JPN_only_tipped$p_ra)
data_JPN_only_tipped$JPN_logistic_p_ra_only_tipped <- 0.0001/(1 + exp( - data_JPN_only_tipped$p_ra))
data_JPN_only_tipped$JPN_quad_p_ra_only_tipped <- (data_JPN_only_tipped$p_ra)**2  
data_JPN_only_tipped[2]<- NULL

data_JPN_only_tipped$JPN_p_rd_only_tipped <- data_JPN_only_tipped$p_rd
data_JPN_only_tipped$JPN_p_rd_only_tipped_log <- log(data_JPN_only_tipped$p_rd)
data_JPN_only_tipped$JPN_p_rd_only_tipped_log_minus_1 <- log(1 - data_JPN_only_tipped$p_rd)
data_JPN_only_tipped$JPN_1_div_p_rd_only_tipped <- 1/(data_JPN_only_tipped$p_rd)
data_JPN_only_tipped$JPN_root_p_rd_only_tipped <- sqrt(data_JPN_only_tipped$p_rd)
data_JPN_only_tipped$JPN_logistic_p_rd_only_tipped <- 0.0001/(1 + exp( - data_JPN_only_tipped$p_rd))
data_JPN_only_tipped$JPN_quad_p_rd_only_tipped <- (data_JPN_only_tipped$p_rd)**2  
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




# -----------------------------------------------------------------------
# Do the regressions
set.seed(42) # to avoid randomized results

JPN_parameter_log_ttip <- model.matrix(log(JPN_t_tip_only_tipped) ~. -1, data =data_JPN_only_tipped)
JPN_model_log_ttip <- cv.glmnet(JPN_parameter_log_ttip, log(JPN_t_tip_only_tipped), relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.1), alpha = 1, family='gaussian')
JPN_model_log_ttip_coeff_values <- coef(JPN_model_log_ttip, s="lambda.1se", gamma="gamma.1se")
JPN_model_log_ttip_coeff <- c(rownames(coef(JPN_model_log_ttip, s="lambda.1se", gamma="gamma.1se"))[coef(JPN_model_log_ttip, s="lambda.1se", gamma="gamma.1se")[,1]!= 0])
JPN_model_log_ttip_coeff_keep <- JPN_model_log_ttip_coeff[2:length(JPN_model_log_ttip_coeff)]
data_JPN_only_tipped_ols_coef_log_ttip <- data_JPN_only_tipped[JPN_model_log_ttip_coeff_keep]
JPN_OLS_model_log_ttip <- lm(log(JPN_t_tip_only_tipped) ~. -1, data=data_JPN_only_tipped_ols_coef_log_ttip)
JPN_OLS_model_log_ttip_coeff_values <- summary(JPN_OLS_model_log_ttip)


set.seed(42)
JPN_parameter_ttip_trans <- model.matrix(JPN_tipping_transformed_all ~. , data=data_JPN_all)[,-1]
JPN_model_ttip_trans <- cv.glmnet(JPN_parameter_ttip_trans, JPN_tipping_transformed_all, relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.1), alpha = 1, family='gaussian')
JPN_model_ttip_trans_coeff_values <- coef(JPN_model_ttip_trans, s="lambda.1se", gamma="gamma.1se")
JPN_model_ttip_trans_coeff <- c(rownames(coef(JPN_model_ttip_trans, s="lambda.1se", gamma="gamma.1se"))[coef(JPN_model_ttip_trans, s="lambda.1se", gamma="gamma.1se")[,1]!= 0])
JPN_model_ttip_trans_coeff_keep <- JPN_model_ttip_trans_coeff[2:length(JPN_model_ttip_trans_coeff)]
data_JPN_all_OLS_coef_ttip_trans <- data_JPN_all[JPN_model_ttip_trans_coeff_keep]
JPN_OLS_model_ttip_trans <- lm(JPN_tipping_transformed_all ~. -1, data=data_JPN_all_OLS_coef_ttip_trans)
JPN_OLS_model_ttip_trans_coeff_values <- summary(JPN_OLS_model_ttip_trans)


JPN_parameter_logistic <- model.matrix(JPN_tipped_or_not ~.  , data=data_JPN_all)[,-1]
JPN_model_logistic <- cv.glmnet(JPN_parameter_logistic, JPN_tipped_or_not, relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.1), alpha = 1, family='binomial')
JPN_model_logistic_coeff_values <- coef(JPN_model_logistic, s="lambda.1se", gamma="gamma.1se")
JPN_model_logistic_coeff <- c(rownames(coef(JPN_model_logistic, s="lambda.1se", gamma="gamma.1se"))[coef(JPN_model_logistic, s="lambda.1se", gamma="gamma.1se")[,1]!= 0])
JPN_model_logistic_coeff_keep <- JPN_model_logistic_coeff[2:length(JPN_model_logistic_coeff)]
data_JPN_all_OLS_coef_logistic <- data_JPN_all[JPN_model_logistic_coeff_keep]
JPN_OLS_model_logistic <- glm(JPN_tipped_or_not ~. -1, data=data_JPN_all_OLS_coef_logistic, family='binomial')
JPN_OLS_model_logistic_coeff_values <- summary(JPN_OLS_model_logistic)

