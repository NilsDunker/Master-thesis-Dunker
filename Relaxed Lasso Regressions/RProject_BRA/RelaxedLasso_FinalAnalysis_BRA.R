# read and load data
library(glmnet)
csv_BRA_all <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/BRA_all_Datframe_100000Simulations.csv'
csv_BRA_only_tipped <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/BRA_Only_tipped_Datframe_60532Simulations.csv'
data_BRA_all <- read.csv(file = csv_BRA_all)
data_BRA_only_tipped <- read.csv(file = csv_BRA_only_tipped) 
data_BRA_all[data_BRA_all==-2] <- Inf


# BRA variables for all simulations and the only tipped ones
BRA_tipped_or_not <- data_BRA_all$is_tipped
data_BRA_all[2]<- NULL
BRA_t_tip_all <- data_BRA_all$t_tip
BRA_tipping_transformed_all <- 1/data_BRA_all$t_tip
data_BRA_all[2]<- NULL

data_BRA_all$BRA_theta_a_all <- data_BRA_all$Theta_a
data_BRA_all$BRA_theta_a_all_log <- log(data_BRA_all$Theta_a)
data_BRA_all$BRA_theta_a_all_log_minus_1 <- log(1 - data_BRA_all$Theta_a)
data_BRA_all$BRA_1_div_theta_a_all <- 1/(data_BRA_all$Theta_a)
data_BRA_all$BRA_root_theta_a_all <- sqrt(data_BRA_all$Theta_a)
data_BRA_all$BRA_logistic_theta_a_all <- 1/(1 + exp( - data_BRA_all$Theta_a))
data_BRA_all$BRA_quad_theta_a_all <- (data_BRA_all$Theta_a)**2                        
data_BRA_all[2]<- NULL

data_BRA_all$BRA_theta_d_all <- data_BRA_all$Theta_d
data_BRA_all$BRA_theta_d_all_log <- log(data_BRA_all$Theta_d)
data_BRA_all$BRA_theta_d_all_log_minus_1 <- log(1 - data_BRA_all$Theta_d)
data_BRA_all$BRA_1_div_theta_d_all <- 1/(data_BRA_all$Theta_d)
data_BRA_all$BRA_root_theta_d_all <- sqrt(data_BRA_all$Theta_d)
data_BRA_all$BRA_logistic_theta_d_all <- 1/(1 + exp( - data_BRA_all$Theta_d))
data_BRA_all$BRA_quad_theta_d_all <- (data_BRA_all$Theta_d)**2  
data_BRA_all[3]<- NULL

data_BRA_all$BRA_p_a_all <- data_BRA_all$p_a
data_BRA_all$BRA_p_a_all_log <- log(data_BRA_all$p_a)
data_BRA_all$BRA_p_a_all_log_minus_1 <- log(1 - data_BRA_all$p_a)
data_BRA_all$BRA_1_div_p_a_all <- 1/(data_BRA_all$p_a)
data_BRA_all$BRA_root_p_a_all <- sqrt(data_BRA_all$p_a)
data_BRA_all$BRA_logistic_p_a_all <- 1/(1 + exp( - data_BRA_all$p_a))
data_BRA_all$BRA_quad_p_a_all <- (data_BRA_all$p_a)**2  
data_BRA_all[2]<- NULL

data_BRA_all$BRA_p_d_all <- data_BRA_all$p_d
data_BRA_all$BRA_p_d_all_log <- log(data_BRA_all$p_d)
data_BRA_all$BRA_p_d_all_log_minus_1 <- log(1 - data_BRA_all$p_d)
data_BRA_all$BRA_1_div_p_d_all <- 1/(data_BRA_all$p_d)
data_BRA_all$BRA_root_p_d_all <- sqrt(data_BRA_all$p_d)
data_BRA_all$BRA_logistic_p_d_all <- 1/(1 + exp( - data_BRA_all$p_d))
data_BRA_all$BRA_quad_p_d_all <- (data_BRA_all$p_d)**2  
data_BRA_all[2]<- NULL

data_BRA_all$BRA_p_e_all <- data_BRA_all$p_e
data_BRA_all$BRA_p_e_all_log <- log(data_BRA_all$p_e)
data_BRA_all$BRA_p_e_all_log_minus_1 <- log(1 - data_BRA_all$p_e)
data_BRA_all$BRA_1_div_p_e_all <- 1/(data_BRA_all$p_e)
data_BRA_all$BRA_root_p_e_all <- sqrt(data_BRA_all$p_e)
data_BRA_all$BRA_logistic_p_e_all <- 1/(1 + exp( - data_BRA_all$p_e))
data_BRA_all$BRA_quad_p_e_all <- (data_BRA_all$p_e)**2  
data_BRA_all[2]<- NULL

data_BRA_all$BRA_p_en_all <- data_BRA_all$p_en
data_BRA_all$BRA_p_en_all_log <- log(data_BRA_all$p_en)
data_BRA_all$BRA_p_en_all_log_minus_1 <- log(1 - data_BRA_all$p_en)
data_BRA_all$BRA_1_div_p_en_all <- 1/(data_BRA_all$p_en)
data_BRA_all$BRA_root_p_en_all <- sqrt(data_BRA_all$p_en)
data_BRA_all$BRA_logistic_p_en_all <- 1/(1 + exp( - data_BRA_all$p_en))
data_BRA_all$BRA_quad_p_en_all <- (data_BRA_all$p_en)**2  
data_BRA_all[2]<- NULL

data_BRA_all$BRA_p_ra_all <- data_BRA_all$p_ra
data_BRA_all$BRA_p_ra_all_log <- log(data_BRA_all$p_ra)
data_BRA_all$BRA_p_ra_all_log_minus_1 <- log(1 - data_BRA_all$p_ra)
data_BRA_all$BRA_1_div_p_ra_all <- 1/(data_BRA_all$p_ra)
data_BRA_all$BRA_root_p_ra_all <- sqrt(data_BRA_all$p_ra)
data_BRA_all$BRA_logistic_p_ra_all <- 1/(1 + exp( - data_BRA_all$p_ra))
data_BRA_all$BRA_quad_p_ra_all <- (data_BRA_all$p_ra)**2  
data_BRA_all[2]<- NULL

data_BRA_all$BRA_p_rd_all <- data_BRA_all$p_rd
data_BRA_all$BRA_p_rd_all_log <- log(data_BRA_all$p_rd)
data_BRA_all$BRA_p_rd_all_log_minus_1 <- log(1 - data_BRA_all$p_rd)
data_BRA_all$BRA_1_div_p_rd_all <- 1/(data_BRA_all$p_rd)
data_BRA_all$BRA_root_p_rd_all <- sqrt(data_BRA_all$p_rd)
data_BRA_all$BRA_logistic_p_rd_all <- 1/(1 + exp( - data_BRA_all$p_rd))
data_BRA_all$BRA_quad_p_rd_all <- (data_BRA_all$p_rd)**2  
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
data_BRA_only_tipped$BRA_1_div_theta_a_only_tipped <- 1/(data_BRA_only_tipped$Theta_a)
data_BRA_only_tipped$BRA_root_theta_a_only_tipped <- sqrt(data_BRA_only_tipped$Theta_a)
data_BRA_only_tipped$BRA_logistic_theta_a_only_tipped <- 1/(1 + exp( - data_BRA_only_tipped$Theta_a))
data_BRA_only_tipped$BRA_quad_theta_a_only_tipped <- (data_BRA_only_tipped$Theta_a)**2                        
data_BRA_only_tipped[2]<- NULL

data_BRA_only_tipped$BRA_theta_d_only_tipped <- data_BRA_only_tipped$Theta_d
data_BRA_only_tipped$BRA_theta_d_only_tipped_log <- log(data_BRA_only_tipped$Theta_d)
data_BRA_only_tipped$BRA_theta_d_only_tipped_log_minus_1 <- log(1 - data_BRA_only_tipped$Theta_d)
data_BRA_only_tipped$BRA_1_div_theta_d_only_tipped <- 1/(data_BRA_only_tipped$Theta_d)
data_BRA_only_tipped$BRA_root_theta_d_only_tipped <- sqrt(data_BRA_only_tipped$Theta_d)
data_BRA_only_tipped$BRA_logistic_theta_d_only_tipped <- 1/(1 + exp( - data_BRA_only_tipped$Theta_d))
data_BRA_only_tipped$BRA_quad_theta_d_only_tipped <- (data_BRA_only_tipped$Theta_d)**2  
data_BRA_only_tipped[3]<- NULL

data_BRA_only_tipped$BRA_p_a_only_tipped <- data_BRA_only_tipped$p_a
data_BRA_only_tipped$BRA_p_a_only_tipped_log <- log(data_BRA_only_tipped$p_a)
data_BRA_only_tipped$BRA_p_a_only_tipped_log_minus_1 <- log(1 - data_BRA_only_tipped$p_a)
data_BRA_only_tipped$BRA_1_div_p_a_only_tipped <- 1/(data_BRA_only_tipped$p_a)
data_BRA_only_tipped$BRA_root_p_a_only_tipped <- sqrt(data_BRA_only_tipped$p_a)
data_BRA_only_tipped$BRA_logistic_p_a_only_tipped <- 1/(1 + exp( - data_BRA_only_tipped$p_a))
data_BRA_only_tipped$BRA_quad_p_a_only_tipped <- (data_BRA_only_tipped$p_a)**2  
data_BRA_only_tipped[2]<- NULL

data_BRA_only_tipped$BRA_p_d_only_tipped <- data_BRA_only_tipped$p_d
data_BRA_only_tipped$BRA_p_d_only_tipped_log <- log(data_BRA_only_tipped$p_d)
data_BRA_only_tipped$BRA_p_d_only_tipped_log_minus_1 <- log(1 - data_BRA_only_tipped$p_d)
data_BRA_only_tipped$BRA_1_div_p_d_only_tipped <- 1/(data_BRA_only_tipped$p_d)
data_BRA_only_tipped$BRA_root_p_d_only_tipped <- sqrt(data_BRA_only_tipped$p_d)
data_BRA_only_tipped$BRA_logistic_p_d_only_tipped <- 1/(1 + exp( - data_BRA_only_tipped$p_d))
data_BRA_only_tipped$BRA_quad_p_d_only_tipped <- (data_BRA_only_tipped$p_d)**2  
data_BRA_only_tipped[2]<- NULL

data_BRA_only_tipped$BRA_p_e_only_tipped <- data_BRA_only_tipped$p_e
data_BRA_only_tipped$BRA_p_e_only_tipped_log <- log(data_BRA_only_tipped$p_e)
data_BRA_only_tipped$BRA_p_e_only_tipped_log_minus_1 <- log(1 - data_BRA_only_tipped$p_e)
data_BRA_only_tipped$BRA_1_div_p_e_only_tipped <- 1/(data_BRA_only_tipped$p_e)
data_BRA_only_tipped$BRA_root_p_e_only_tipped <- sqrt(data_BRA_only_tipped$p_e)
data_BRA_only_tipped$BRA_logistic_p_e_only_tipped <- 1/(1 + exp( - data_BRA_only_tipped$p_e))
data_BRA_only_tipped$BRA_quad_p_e_only_tipped <- (data_BRA_only_tipped$p_e)**2  
data_BRA_only_tipped[2]<- NULL

data_BRA_only_tipped$BRA_p_en_only_tipped <- data_BRA_only_tipped$p_en
data_BRA_only_tipped$BRA_p_en_only_tipped_log <- log(data_BRA_only_tipped$p_en)
data_BRA_only_tipped$BRA_p_en_only_tipped_log_minus_1 <- log(1 - data_BRA_only_tipped$p_en)
data_BRA_only_tipped$BRA_1_div_p_en_only_tipped <- 1/(data_BRA_only_tipped$p_en)
data_BRA_only_tipped$BRA_root_p_en_only_tipped <- sqrt(data_BRA_only_tipped$p_en)
data_BRA_only_tipped$BRA_logistic_p_en_only_tipped <- 1/(1 + exp( - data_BRA_only_tipped$p_en))
data_BRA_only_tipped$BRA_quad_p_en_only_tipped <- (data_BRA_only_tipped$p_en)**2  
data_BRA_only_tipped[2]<- NULL

data_BRA_only_tipped$BRA_p_ra_only_tipped <- data_BRA_only_tipped$p_ra
data_BRA_only_tipped$BRA_p_ra_only_tipped_log <- log(data_BRA_only_tipped$p_ra)
data_BRA_only_tipped$BRA_p_ra_only_tipped_log_minus_1 <- log(1 - data_BRA_only_tipped$p_ra)
data_BRA_only_tipped$BRA_1_div_p_ra_only_tipped <- 1/(data_BRA_only_tipped$p_ra)
data_BRA_only_tipped$BRA_root_p_ra_only_tipped <- sqrt(data_BRA_only_tipped$p_ra)
data_BRA_only_tipped$BRA_logistic_p_ra_only_tipped <- 0.0001/(1 + exp( - data_BRA_only_tipped$p_ra))
data_BRA_only_tipped$BRA_quad_p_ra_only_tipped <- (data_BRA_only_tipped$p_ra)**2  
data_BRA_only_tipped[2]<- NULL

data_BRA_only_tipped$BRA_p_rd_only_tipped <- data_BRA_only_tipped$p_rd
data_BRA_only_tipped$BRA_p_rd_only_tipped_log <- log(data_BRA_only_tipped$p_rd)
data_BRA_only_tipped$BRA_p_rd_only_tipped_log_minus_1 <- log(1 - data_BRA_only_tipped$p_rd)
data_BRA_only_tipped$BRA_1_div_p_rd_only_tipped <- 1/(data_BRA_only_tipped$p_rd)
data_BRA_only_tipped$BRA_root_p_rd_only_tipped <- sqrt(data_BRA_only_tipped$p_rd)
data_BRA_only_tipped$BRA_logistic_p_rd_only_tipped <- 0.0001/(1 + exp( - data_BRA_only_tipped$p_rd))
data_BRA_only_tipped$BRA_quad_p_rd_only_tipped <- (data_BRA_only_tipped$p_rd)**2  
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




# -----------------------------------------------------------------------
# Do the regressions
set.seed(42) # to avoid randomized results

BRA_parameter_log_ttip <- model.matrix(log(BRA_t_tip_only_tipped) ~. -1, data =data_BRA_only_tipped)
BRA_model_log_ttip <- cv.glmnet(BRA_parameter_log_ttip, log(BRA_t_tip_only_tipped), relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.1), alpha = 1, family='gaussian')
BRA_model_log_ttip_coeff_values <- coef(BRA_model_log_ttip, s="lambda.1se", gamma="gamma.1se")
BRA_model_log_ttip_coeff <- c(rownames(coef(BRA_model_log_ttip, s="lambda.1se", gamma="gamma.1se"))[coef(BRA_model_log_ttip, s="lambda.1se", gamma="gamma.1se")[,1]!= 0])
BRA_model_log_ttip_coeff_keep <- BRA_model_log_ttip_coeff[2:length(BRA_model_log_ttip_coeff)]
data_BRA_only_tipped_ols_coef_log_ttip <- data_BRA_only_tipped[BRA_model_log_ttip_coeff_keep]
BRA_OLS_model_log_ttip <- lm(log(BRA_t_tip_only_tipped) ~. -1, data=data_BRA_only_tipped_ols_coef_log_ttip)
BRA_OLS_model_log_ttip_coeff_values <- summary(BRA_OLS_model_log_ttip)


set.seed(42)
BRA_parameter_ttip_trans <- model.matrix(BRA_tipping_transformed_all ~. , data=data_BRA_all)[,-1]
BRA_model_ttip_trans <- cv.glmnet(BRA_parameter_ttip_trans, BRA_tipping_transformed_all, relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.1), alpha = 1, family='gaussian')
BRA_model_ttip_trans_coeff_values <- coef(BRA_model_ttip_trans, s="lambda.1se", gamma="gamma.1se")
BRA_model_ttip_trans_coeff <- c(rownames(coef(BRA_model_ttip_trans, s="lambda.1se", gamma="gamma.1se"))[coef(BRA_model_ttip_trans, s="lambda.1se", gamma="gamma.1se")[,1]!= 0])
BRA_model_ttip_trans_coeff_keep <- BRA_model_ttip_trans_coeff[2:length(BRA_model_ttip_trans_coeff)]
data_BRA_all_OLS_coef_ttip_trans <- data_BRA_all[BRA_model_ttip_trans_coeff_keep]
BRA_OLS_model_ttip_trans <- lm(BRA_tipping_transformed_all ~. -1, data=data_BRA_all_OLS_coef_ttip_trans)
BRA_OLS_model_ttip_trans_coeff_values <- summary(BRA_OLS_model_ttip_trans)


BRA_parameter_logistic <- model.matrix(BRA_tipped_or_not ~.  , data=data_BRA_all)[,-1]
BRA_model_logistic <- cv.glmnet(BRA_parameter_logistic, BRA_tipped_or_not, relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.1), alpha = 1, family='binomial')
BRA_model_logistic_coeff_values <- coef(BRA_model_logistic, s="lambda.1se", gamma="gamma.1se")
BRA_model_logistic_coeff <- c(rownames(coef(BRA_model_logistic, s="lambda.1se", gamma="gamma.1se"))[coef(BRA_model_logistic, s="lambda.1se", gamma="gamma.1se")[,1]!= 0])
BRA_model_logistic_coeff_keep <- BRA_model_logistic_coeff[2:length(BRA_model_logistic_coeff)]
data_BRA_all_OLS_coef_logistic <- data_BRA_all[BRA_model_logistic_coeff_keep]
BRA_OLS_model_logistic <- glm(BRA_tipped_or_not ~. -1, data=data_BRA_all_OLS_coef_logistic, family='binomial')
BRA_OLS_model_logistic_coeff_values <- summary(BRA_OLS_model_logistic)

