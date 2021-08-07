# read and load data
library(glmnet)
csv_EU_all <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/EU_all_Datframe_100000Simulations.csv'
csv_EU_only_tipped <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/EU_Only_tipped_Datframe_39849Simulations.csv'
data_EU_all <- read.csv(file = csv_EU_all)
data_EU_only_tipped <- read.csv(file = csv_EU_only_tipped) 
data_EU_all[data_EU_all==-2] <- Inf


# EU variables for all simulations and the only tipped ones
EU_tipped_or_not <- data_EU_all$is_tipped
data_EU_all[2]<- NULL
EU_t_tip_all <- data_EU_all$t_tip
EU_tipping_transformed_all <- 1/data_EU_all$t_tip
data_EU_all[2]<- NULL

data_EU_all$EU_theta_a_all <- data_EU_all$Theta_a
data_EU_all$EU_theta_a_all_log <- log(data_EU_all$Theta_a)
data_EU_all$EU_theta_a_all_log_minus_1 <- log(1 - data_EU_all$Theta_a)
data_EU_all$EU_1_div_theta_a_all <- 1/(data_EU_all$Theta_a)
data_EU_all$EU_root_theta_a_all <- sqrt(data_EU_all$Theta_a)
data_EU_all$EU_logistic_theta_a_all <- 1/(1 + exp( - data_EU_all$Theta_a))
data_EU_all$EU_quad_theta_a_all <- (data_EU_all$Theta_a)**2                        
data_EU_all[2]<- NULL

data_EU_all$EU_theta_d_all <- data_EU_all$Theta_d
data_EU_all$EU_theta_d_all_log <- log(data_EU_all$Theta_d)
data_EU_all$EU_theta_d_all_log_minus_1 <- log(1 - data_EU_all$Theta_d)
data_EU_all$EU_1_div_theta_d_all <- 1/(data_EU_all$Theta_d)
data_EU_all$EU_root_theta_d_all <- sqrt(data_EU_all$Theta_d)
data_EU_all$EU_logistic_theta_d_all <- 1/(1 + exp( - data_EU_all$Theta_d))
data_EU_all$EU_quad_theta_d_all <- (data_EU_all$Theta_d)**2  
data_EU_all[3]<- NULL

data_EU_all$EU_p_a_all <- data_EU_all$p_a
data_EU_all$EU_p_a_all_log <- log(data_EU_all$p_a)
data_EU_all$EU_p_a_all_log_minus_1 <- log(1 - data_EU_all$p_a)
data_EU_all$EU_1_div_p_a_all <- 1/(data_EU_all$p_a)
data_EU_all$EU_root_p_a_all <- sqrt(data_EU_all$p_a)
data_EU_all$EU_logistic_p_a_all <- 1/(1 + exp( - data_EU_all$p_a))
data_EU_all$EU_quad_p_a_all <- (data_EU_all$p_a)**2  
data_EU_all[2]<- NULL

data_EU_all$EU_p_d_all <- data_EU_all$p_d
data_EU_all$EU_p_d_all_log <- log(data_EU_all$p_d)
data_EU_all$EU_p_d_all_log_minus_1 <- log(1 - data_EU_all$p_d)
data_EU_all$EU_1_div_p_d_all <- 1/(data_EU_all$p_d)
data_EU_all$EU_root_p_d_all <- sqrt(data_EU_all$p_d)
data_EU_all$EU_logistic_p_d_all <- 1/(1 + exp( - data_EU_all$p_d))
data_EU_all$EU_quad_p_d_all <- (data_EU_all$p_d)**2  
data_EU_all[2]<- NULL

data_EU_all$EU_p_e_all <- data_EU_all$p_e
data_EU_all$EU_p_e_all_log <- log(data_EU_all$p_e)
data_EU_all$EU_p_e_all_log_minus_1 <- log(1 - data_EU_all$p_e)
data_EU_all$EU_1_div_p_e_all <- 1/(data_EU_all$p_e)
data_EU_all$EU_root_p_e_all <- sqrt(data_EU_all$p_e)
data_EU_all$EU_logistic_p_e_all <- 1/(1 + exp( - data_EU_all$p_e))
data_EU_all$EU_quad_p_e_all <- (data_EU_all$p_e)**2  
data_EU_all[2]<- NULL

data_EU_all$EU_p_en_all <- data_EU_all$p_en
data_EU_all$EU_p_en_all_log <- log(data_EU_all$p_en)
data_EU_all$EU_p_en_all_log_minus_1 <- log(1 - data_EU_all$p_en)
data_EU_all$EU_1_div_p_en_all <- 1/(data_EU_all$p_en)
data_EU_all$EU_root_p_en_all <- sqrt(data_EU_all$p_en)
data_EU_all$EU_logistic_p_en_all <- 1/(1 + exp( - data_EU_all$p_en))
data_EU_all$EU_quad_p_en_all <- (data_EU_all$p_en)**2  
data_EU_all[2]<- NULL

data_EU_all$EU_p_ra_all <- data_EU_all$p_ra
data_EU_all$EU_p_ra_all_log <- log(data_EU_all$p_ra)
data_EU_all$EU_p_ra_all_log_minus_1 <- log(1 - data_EU_all$p_ra)
data_EU_all$EU_1_div_p_ra_all <- 1/(data_EU_all$p_ra)
data_EU_all$EU_root_p_ra_all <- sqrt(data_EU_all$p_ra)
data_EU_all$EU_logistic_p_ra_all <- 1/(1 + exp( - data_EU_all$p_ra))
data_EU_all$EU_quad_p_ra_all <- (data_EU_all$p_ra)**2  
data_EU_all[2]<- NULL

data_EU_all$EU_p_rd_all <- data_EU_all$p_rd
data_EU_all$EU_p_rd_all_log <- log(data_EU_all$p_rd)
data_EU_all$EU_p_rd_all_log_minus_1 <- log(1 - data_EU_all$p_rd)
data_EU_all$EU_1_div_p_rd_all <- 1/(data_EU_all$p_rd)
data_EU_all$EU_root_p_rd_all <- sqrt(data_EU_all$p_rd)
data_EU_all$EU_logistic_p_rd_all <- 1/(1 + exp( - data_EU_all$p_rd))
data_EU_all$EU_quad_p_rd_all <- (data_EU_all$p_rd)**2  
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
data_EU_only_tipped$EU_1_div_theta_a_only_tipped <- 1/(data_EU_only_tipped$Theta_a)
data_EU_only_tipped$EU_root_theta_a_only_tipped <- sqrt(data_EU_only_tipped$Theta_a)
data_EU_only_tipped$EU_logistic_theta_a_only_tipped <- 1/(1 + exp( - data_EU_only_tipped$Theta_a))
data_EU_only_tipped$EU_quad_theta_a_only_tipped <- (data_EU_only_tipped$Theta_a)**2                        
data_EU_only_tipped[2]<- NULL

data_EU_only_tipped$EU_theta_d_only_tipped <- data_EU_only_tipped$Theta_d
data_EU_only_tipped$EU_theta_d_only_tipped_log <- log(data_EU_only_tipped$Theta_d)
data_EU_only_tipped$EU_theta_d_only_tipped_log_minus_1 <- log(1 - data_EU_only_tipped$Theta_d)
data_EU_only_tipped$EU_1_div_theta_d_only_tipped <- 1/(data_EU_only_tipped$Theta_d)
data_EU_only_tipped$EU_root_theta_d_only_tipped <- sqrt(data_EU_only_tipped$Theta_d)
data_EU_only_tipped$EU_logistic_theta_d_only_tipped <- 1/(1 + exp( - data_EU_only_tipped$Theta_d))
data_EU_only_tipped$EU_quad_theta_d_only_tipped <- (data_EU_only_tipped$Theta_d)**2  
data_EU_only_tipped[3]<- NULL

data_EU_only_tipped$EU_p_a_only_tipped <- data_EU_only_tipped$p_a
data_EU_only_tipped$EU_p_a_only_tipped_log <- log(data_EU_only_tipped$p_a)
data_EU_only_tipped$EU_p_a_only_tipped_log_minus_1 <- log(1 - data_EU_only_tipped$p_a)
data_EU_only_tipped$EU_1_div_p_a_only_tipped <- 1/(data_EU_only_tipped$p_a)
data_EU_only_tipped$EU_root_p_a_only_tipped <- sqrt(data_EU_only_tipped$p_a)
data_EU_only_tipped$EU_logistic_p_a_only_tipped <- 1/(1 + exp( - data_EU_only_tipped$p_a))
data_EU_only_tipped$EU_quad_p_a_only_tipped <- (data_EU_only_tipped$p_a)**2  
data_EU_only_tipped[2]<- NULL

data_EU_only_tipped$EU_p_d_only_tipped <- data_EU_only_tipped$p_d
data_EU_only_tipped$EU_p_d_only_tipped_log <- log(data_EU_only_tipped$p_d)
data_EU_only_tipped$EU_p_d_only_tipped_log_minus_1 <- log(1 - data_EU_only_tipped$p_d)
data_EU_only_tipped$EU_1_div_p_d_only_tipped <- 1/(data_EU_only_tipped$p_d)
data_EU_only_tipped$EU_root_p_d_only_tipped <- sqrt(data_EU_only_tipped$p_d)
data_EU_only_tipped$EU_logistic_p_d_only_tipped <- 1/(1 + exp( - data_EU_only_tipped$p_d))
data_EU_only_tipped$EU_quad_p_d_only_tipped <- (data_EU_only_tipped$p_d)**2  
data_EU_only_tipped[2]<- NULL

data_EU_only_tipped$EU_p_e_only_tipped <- data_EU_only_tipped$p_e
data_EU_only_tipped$EU_p_e_only_tipped_log <- log(data_EU_only_tipped$p_e)
data_EU_only_tipped$EU_p_e_only_tipped_log_minus_1 <- log(1 - data_EU_only_tipped$p_e)
data_EU_only_tipped$EU_1_div_p_e_only_tipped <- 1/(data_EU_only_tipped$p_e)
data_EU_only_tipped$EU_root_p_e_only_tipped <- sqrt(data_EU_only_tipped$p_e)
data_EU_only_tipped$EU_logistic_p_e_only_tipped <- 1/(1 + exp( - data_EU_only_tipped$p_e))
data_EU_only_tipped$EU_quad_p_e_only_tipped <- (data_EU_only_tipped$p_e)**2  
data_EU_only_tipped[2]<- NULL

data_EU_only_tipped$EU_p_en_only_tipped <- data_EU_only_tipped$p_en
data_EU_only_tipped$EU_p_en_only_tipped_log <- log(data_EU_only_tipped$p_en)
data_EU_only_tipped$EU_p_en_only_tipped_log_minus_1 <- log(1 - data_EU_only_tipped$p_en)
data_EU_only_tipped$EU_1_div_p_en_only_tipped <- 1/(data_EU_only_tipped$p_en)
data_EU_only_tipped$EU_root_p_en_only_tipped <- sqrt(data_EU_only_tipped$p_en)
data_EU_only_tipped$EU_logistic_p_en_only_tipped <- 1/(1 + exp( - data_EU_only_tipped$p_en))
data_EU_only_tipped$EU_quad_p_en_only_tipped <- (data_EU_only_tipped$p_en)**2  
data_EU_only_tipped[2]<- NULL

data_EU_only_tipped$EU_p_ra_only_tipped <- data_EU_only_tipped$p_ra
data_EU_only_tipped$EU_p_ra_only_tipped_log <- log(data_EU_only_tipped$p_ra)
data_EU_only_tipped$EU_p_ra_only_tipped_log_minus_1 <- log(1 - data_EU_only_tipped$p_ra)
data_EU_only_tipped$EU_1_div_p_ra_only_tipped <- 1/(data_EU_only_tipped$p_ra)
data_EU_only_tipped$EU_root_p_ra_only_tipped <- sqrt(data_EU_only_tipped$p_ra)
data_EU_only_tipped$EU_logistic_p_ra_only_tipped <- 0.0001/(1 + exp( - data_EU_only_tipped$p_ra))
data_EU_only_tipped$EU_quad_p_ra_only_tipped <- (data_EU_only_tipped$p_ra)**2  
data_EU_only_tipped[2]<- NULL

data_EU_only_tipped$EU_p_rd_only_tipped <- data_EU_only_tipped$p_rd
data_EU_only_tipped$EU_p_rd_only_tipped_log <- log(data_EU_only_tipped$p_rd)
data_EU_only_tipped$EU_p_rd_only_tipped_log_minus_1 <- log(1 - data_EU_only_tipped$p_rd)
data_EU_only_tipped$EU_1_div_p_rd_only_tipped <- 1/(data_EU_only_tipped$p_rd)
data_EU_only_tipped$EU_root_p_rd_only_tipped <- sqrt(data_EU_only_tipped$p_rd)
data_EU_only_tipped$EU_logistic_p_rd_only_tipped <- 0.0001/(1 + exp( - data_EU_only_tipped$p_rd))
data_EU_only_tipped$EU_quad_p_rd_only_tipped <- (data_EU_only_tipped$p_rd)**2  
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




# -----------------------------------------------------------------------
# Do the regressions
set.seed(42) # to avoid randomized results

EU_parameter_log_ttip <- model.matrix(log(EU_t_tip_only_tipped) ~. -1, data =data_EU_only_tipped)
EU_model_log_ttip <- cv.glmnet(EU_parameter_log_ttip, log(EU_t_tip_only_tipped), relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.1), alpha = 1, family='gaussian')
EU_model_log_ttip_coeff_values <- coef(EU_model_log_ttip, s="lambda.1se", gamma="gamma.1se")
EU_model_log_ttip_coeff <- c(rownames(coef(EU_model_log_ttip, s="lambda.1se", gamma="gamma.1se"))[coef(EU_model_log_ttip, s="lambda.1se", gamma="gamma.1se")[,1]!= 0])
EU_model_log_ttip_coeff_keep <- EU_model_log_ttip_coeff[2:length(EU_model_log_ttip_coeff)]
data_EU_only_tipped_ols_coef_log_ttip <- data_EU_only_tipped[EU_model_log_ttip_coeff_keep]
EU_OLS_model_log_ttip <- lm(log(EU_t_tip_only_tipped) ~. -1, data=data_EU_only_tipped_ols_coef_log_ttip)
EU_OLS_model_log_ttip_coeff_values <- summary(EU_OLS_model_log_ttip)


set.seed(42)
EU_parameter_ttip_trans <- model.matrix(EU_tipping_transformed_all ~. , data=data_EU_all)[,-1]
EU_model_ttip_trans <- cv.glmnet(EU_parameter_ttip_trans, EU_tipping_transformed_all, relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.1), alpha = 1, family='gaussian')
EU_model_ttip_trans_coeff_values <- coef(EU_model_ttip_trans, s="lambda.1se", gamma="gamma.1se")
EU_model_ttip_trans_coeff <- c(rownames(coef(EU_model_ttip_trans, s="lambda.1se", gamma="gamma.1se"))[coef(EU_model_ttip_trans, s="lambda.1se", gamma="gamma.1se")[,1]!= 0])
EU_model_ttip_trans_coeff_keep <- EU_model_ttip_trans_coeff[2:length(EU_model_ttip_trans_coeff)]
data_EU_all_OLS_coef_ttip_trans <- data_EU_all[EU_model_ttip_trans_coeff_keep]
EU_OLS_model_ttip_trans <- lm(EU_tipping_transformed_all ~. -1, data=data_EU_all_OLS_coef_ttip_trans)
EU_OLS_model_ttip_trans_coeff_values <- summary(EU_OLS_model_ttip_trans)


EU_parameter_logistic <- model.matrix(EU_tipped_or_not ~.  , data=data_EU_all)[,-1]
EU_model_logistic <- cv.glmnet(EU_parameter_logistic, EU_tipped_or_not, relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.1), alpha = 1, family='binomial')
EU_model_logistic_coeff_values <- coef(EU_model_logistic, s="lambda.1se", gamma="gamma.1se")
EU_model_logistic_coeff <- c(rownames(coef(EU_model_logistic, s="lambda.1se", gamma="gamma.1se"))[coef(EU_model_logistic, s="lambda.1se", gamma="gamma.1se")[,1]!= 0])
EU_model_logistic_coeff_keep <- EU_model_logistic_coeff[2:length(EU_model_logistic_coeff)]
data_EU_all_OLS_coef_logistic <- data_EU_all[EU_model_logistic_coeff_keep]
EU_OLS_model_logistic <- glm(EU_tipped_or_not ~. -1, data=data_EU_all_OLS_coef_logistic, family='binomial')
EU_OLS_model_logistic_coeff_values <- summary(EU_OLS_model_logistic)
