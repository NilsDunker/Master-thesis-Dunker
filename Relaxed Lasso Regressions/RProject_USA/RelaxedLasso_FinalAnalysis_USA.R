# read and load data
library(glmnet)
csv_USA_all <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/USA_all_Datframe_100000Simulations.csv'
csv_USA_only_tipped <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/USA_Only_tipped_Datframe_31093Simulations.csv'
data_USA_all <- read.csv(file = csv_USA_all)
data_USA_only_tipped <- read.csv(file = csv_USA_only_tipped) 
data_USA_all[data_USA_all==-2] <- Inf


# USA variables for all simulations and the only tipped ones
USA_tipped_or_not <- data_USA_all$is_tipped
data_USA_all[2]<- NULL
USA_t_tip_all <- data_USA_all$t_tip
USA_tipping_transformed_all <- 1/data_USA_all$t_tip
data_USA_all[2]<- NULL

data_USA_all$USA_theta_a_all <- data_USA_all$Theta_a
data_USA_all$USA_theta_a_all_log <- log(data_USA_all$Theta_a)
data_USA_all$USA_theta_a_all_log_minus_1 <- log(1 - data_USA_all$Theta_a)
data_USA_all$USA_1_div_theta_a_all <- 1/(data_USA_all$Theta_a)
data_USA_all$USA_root_theta_a_all <- sqrt(data_USA_all$Theta_a)
data_USA_all$USA_logistic_theta_a_all <- 1/(1 + exp( - data_USA_all$Theta_a))
data_USA_all$USA_quad_theta_a_all <- (data_USA_all$Theta_a)**2                        
data_USA_all[2]<- NULL

data_USA_all$USA_theta_d_all <- data_USA_all$Theta_d
data_USA_all$USA_theta_d_all_log <- log(data_USA_all$Theta_d)
data_USA_all$USA_theta_d_all_log_minus_1 <- log(1 - data_USA_all$Theta_d)
data_USA_all$USA_1_div_theta_d_all <- 1/(data_USA_all$Theta_d)
data_USA_all$USA_root_theta_d_all <- sqrt(data_USA_all$Theta_d)
data_USA_all$USA_logistic_theta_d_all <- 1/(1 + exp( - data_USA_all$Theta_d))
data_USA_all$USA_quad_theta_d_all <- (data_USA_all$Theta_d)**2  
data_USA_all[3]<- NULL

data_USA_all$USA_p_a_all <- data_USA_all$p_a
data_USA_all$USA_p_a_all_log <- log(data_USA_all$p_a)
data_USA_all$USA_p_a_all_log_minus_1 <- log(1 - data_USA_all$p_a)
data_USA_all$USA_1_div_p_a_all <- 1/(data_USA_all$p_a)
data_USA_all$USA_root_p_a_all <- sqrt(data_USA_all$p_a)
data_USA_all$USA_logistic_p_a_all <- 1/(1 + exp( - data_USA_all$p_a))
data_USA_all$USA_quad_p_a_all <- (data_USA_all$p_a)**2  
data_USA_all[2]<- NULL

data_USA_all$USA_p_d_all <- data_USA_all$p_d
data_USA_all$USA_p_d_all_log <- log(data_USA_all$p_d)
data_USA_all$USA_p_d_all_log_minus_1 <- log(1 - data_USA_all$p_d)
data_USA_all$USA_1_div_p_d_all <- 1/(data_USA_all$p_d)
data_USA_all$USA_root_p_d_all <- sqrt(data_USA_all$p_d)
data_USA_all$USA_logistic_p_d_all <- 1/(1 + exp( - data_USA_all$p_d))
data_USA_all$USA_quad_p_d_all <- (data_USA_all$p_d)**2  
data_USA_all[2]<- NULL

data_USA_all$USA_p_e_all <- data_USA_all$p_e
data_USA_all$USA_p_e_all_log <- log(data_USA_all$p_e)
data_USA_all$USA_p_e_all_log_minus_1 <- log(1 - data_USA_all$p_e)
data_USA_all$USA_1_div_p_e_all <- 1/(data_USA_all$p_e)
data_USA_all$USA_root_p_e_all <- sqrt(data_USA_all$p_e)
data_USA_all$USA_logistic_p_e_all <- 1/(1 + exp( - data_USA_all$p_e))
data_USA_all$USA_quad_p_e_all <- (data_USA_all$p_e)**2  
data_USA_all[2]<- NULL

data_USA_all$USA_p_en_all <- data_USA_all$p_en
data_USA_all$USA_p_en_all_log <- log(data_USA_all$p_en)
data_USA_all$USA_p_en_all_log_minus_1 <- log(1 - data_USA_all$p_en)
data_USA_all$USA_1_div_p_en_all <- 1/(data_USA_all$p_en)
data_USA_all$USA_root_p_en_all <- sqrt(data_USA_all$p_en)
data_USA_all$USA_logistic_p_en_all <- 1/(1 + exp( - data_USA_all$p_en))
data_USA_all$USA_quad_p_en_all <- (data_USA_all$p_en)**2  
data_USA_all[2]<- NULL

data_USA_all$USA_p_ra_all <- data_USA_all$p_ra
data_USA_all$USA_p_ra_all_log <- log(data_USA_all$p_ra)
data_USA_all$USA_p_ra_all_log_minus_1 <- log(1 - data_USA_all$p_ra)
data_USA_all$USA_1_div_p_ra_all <- 1/(data_USA_all$p_ra)
data_USA_all$USA_root_p_ra_all <- sqrt(data_USA_all$p_ra)
data_USA_all$USA_logistic_p_ra_all <- 1/(1 + exp( - data_USA_all$p_ra))
data_USA_all$USA_quad_p_ra_all <- (data_USA_all$p_ra)**2  
data_USA_all[2]<- NULL

data_USA_all$USA_p_rd_all <- data_USA_all$p_rd
data_USA_all$USA_p_rd_all_log <- log(data_USA_all$p_rd)
data_USA_all$USA_p_rd_all_log_minus_1 <- log(1 - data_USA_all$p_rd)
data_USA_all$USA_1_div_p_rd_all <- 1/(data_USA_all$p_rd)
data_USA_all$USA_root_p_rd_all <- sqrt(data_USA_all$p_rd)
data_USA_all$USA_logistic_p_rd_all <- 1/(1 + exp( - data_USA_all$p_rd))
data_USA_all$USA_quad_p_rd_all <- (data_USA_all$p_rd)**2  
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
data_USA_only_tipped$USA_1_div_theta_a_only_tipped <- 1/(data_USA_only_tipped$Theta_a)
data_USA_only_tipped$USA_root_theta_a_only_tipped <- sqrt(data_USA_only_tipped$Theta_a)
data_USA_only_tipped$USA_logistic_theta_a_only_tipped <- 1/(1 + exp( - data_USA_only_tipped$Theta_a))
data_USA_only_tipped$USA_quad_theta_a_only_tipped <- (data_USA_only_tipped$Theta_a)**2                        
data_USA_only_tipped[2]<- NULL

data_USA_only_tipped$USA_theta_d_only_tipped <- data_USA_only_tipped$Theta_d
data_USA_only_tipped$USA_theta_d_only_tipped_log <- log(data_USA_only_tipped$Theta_d)
data_USA_only_tipped$USA_theta_d_only_tipped_log_minus_1 <- log(1 - data_USA_only_tipped$Theta_d)
data_USA_only_tipped$USA_1_div_theta_d_only_tipped <- 1/(data_USA_only_tipped$Theta_d)
data_USA_only_tipped$USA_root_theta_d_only_tipped <- sqrt(data_USA_only_tipped$Theta_d)
data_USA_only_tipped$USA_logistic_theta_d_only_tipped <- 1/(1 + exp( - data_USA_only_tipped$Theta_d))
data_USA_only_tipped$USA_quad_theta_d_only_tipped <- (data_USA_only_tipped$Theta_d)**2  
data_USA_only_tipped[3]<- NULL

data_USA_only_tipped$USA_p_a_only_tipped <- data_USA_only_tipped$p_a
data_USA_only_tipped$USA_p_a_only_tipped_log <- log(data_USA_only_tipped$p_a)
data_USA_only_tipped$USA_p_a_only_tipped_log_minus_1 <- log(1 - data_USA_only_tipped$p_a)
data_USA_only_tipped$USA_1_div_p_a_only_tipped <- 1/(data_USA_only_tipped$p_a)
data_USA_only_tipped$USA_root_p_a_only_tipped <- sqrt(data_USA_only_tipped$p_a)
data_USA_only_tipped$USA_logistic_p_a_only_tipped <- 1/(1 + exp( - data_USA_only_tipped$p_a))
data_USA_only_tipped$USA_quad_p_a_only_tipped <- (data_USA_only_tipped$p_a)**2  
data_USA_only_tipped[2]<- NULL

data_USA_only_tipped$USA_p_d_only_tipped <- data_USA_only_tipped$p_d
data_USA_only_tipped$USA_p_d_only_tipped_log <- log(data_USA_only_tipped$p_d)
data_USA_only_tipped$USA_p_d_only_tipped_log_minus_1 <- log(1 - data_USA_only_tipped$p_d)
data_USA_only_tipped$USA_1_div_p_d_only_tipped <- 1/(data_USA_only_tipped$p_d)
data_USA_only_tipped$USA_root_p_d_only_tipped <- sqrt(data_USA_only_tipped$p_d)
data_USA_only_tipped$USA_logistic_p_d_only_tipped <- 1/(1 + exp( - data_USA_only_tipped$p_d))
data_USA_only_tipped$USA_quad_p_d_only_tipped <- (data_USA_only_tipped$p_d)**2  
data_USA_only_tipped[2]<- NULL

data_USA_only_tipped$USA_p_e_only_tipped <- data_USA_only_tipped$p_e
data_USA_only_tipped$USA_p_e_only_tipped_log <- log(data_USA_only_tipped$p_e)
data_USA_only_tipped$USA_p_e_only_tipped_log_minus_1 <- log(1 - data_USA_only_tipped$p_e)
data_USA_only_tipped$USA_1_div_p_e_only_tipped <- 1/(data_USA_only_tipped$p_e)
data_USA_only_tipped$USA_root_p_e_only_tipped <- sqrt(data_USA_only_tipped$p_e)
data_USA_only_tipped$USA_logistic_p_e_only_tipped <- 1/(1 + exp( - data_USA_only_tipped$p_e))
data_USA_only_tipped$USA_quad_p_e_only_tipped <- (data_USA_only_tipped$p_e)**2  
data_USA_only_tipped[2]<- NULL

data_USA_only_tipped$USA_p_en_only_tipped <- data_USA_only_tipped$p_en
data_USA_only_tipped$USA_p_en_only_tipped_log <- log(data_USA_only_tipped$p_en)
data_USA_only_tipped$USA_p_en_only_tipped_log_minus_1 <- log(1 - data_USA_only_tipped$p_en)
data_USA_only_tipped$USA_1_div_p_en_only_tipped <- 1/(data_USA_only_tipped$p_en)
data_USA_only_tipped$USA_root_p_en_only_tipped <- sqrt(data_USA_only_tipped$p_en)
data_USA_only_tipped$USA_logistic_p_en_only_tipped <- 1/(1 + exp( - data_USA_only_tipped$p_en))
data_USA_only_tipped$USA_quad_p_en_only_tipped <- (data_USA_only_tipped$p_en)**2  
data_USA_only_tipped[2]<- NULL

data_USA_only_tipped$USA_p_ra_only_tipped <- data_USA_only_tipped$p_ra
data_USA_only_tipped$USA_p_ra_only_tipped_log <- log(data_USA_only_tipped$p_ra)
data_USA_only_tipped$USA_p_ra_only_tipped_log_minus_1 <- log(1 - data_USA_only_tipped$p_ra)
data_USA_only_tipped$USA_1_div_p_ra_only_tipped <- 1/(data_USA_only_tipped$p_ra)
data_USA_only_tipped$USA_root_p_ra_only_tipped <- sqrt(data_USA_only_tipped$p_ra)
data_USA_only_tipped$USA_logistic_p_ra_only_tipped <- 0.0001/(1 + exp( - data_USA_only_tipped$p_ra))
data_USA_only_tipped$USA_quad_p_ra_only_tipped <- (data_USA_only_tipped$p_ra)**2  
data_USA_only_tipped[2]<- NULL

data_USA_only_tipped$USA_p_rd_only_tipped <- data_USA_only_tipped$p_rd
data_USA_only_tipped$USA_p_rd_only_tipped_log <- log(data_USA_only_tipped$p_rd)
data_USA_only_tipped$USA_p_rd_only_tipped_log_minus_1 <- log(1 - data_USA_only_tipped$p_rd)
data_USA_only_tipped$USA_1_div_p_rd_only_tipped <- 1/(data_USA_only_tipped$p_rd)
data_USA_only_tipped$USA_root_p_rd_only_tipped <- sqrt(data_USA_only_tipped$p_rd)
data_USA_only_tipped$USA_logistic_p_rd_only_tipped <- 0.0001/(1 + exp( - data_USA_only_tipped$p_rd))
data_USA_only_tipped$USA_quad_p_rd_only_tipped <- (data_USA_only_tipped$p_rd)**2  
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




# -----------------------------------------------------------------------
# Do the regressions
set.seed(42) # to avoid randomized results

USA_parameter_log_ttip <- model.matrix(log(USA_t_tip_only_tipped) ~. -1, data =data_USA_only_tipped)
USA_model_log_ttip <- cv.glmnet(USA_parameter_log_ttip, log(USA_t_tip_only_tipped), relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.1), alpha = 1, family='gaussian')
USA_model_log_ttip_coeff_values <- coef(USA_model_log_ttip, s="lambda.1se", gamma="gamma.1se")
USA_model_log_ttip_coeff <- c(rownames(coef(USA_model_log_ttip, s="lambda.1se", gamma="gamma.1se"))[coef(USA_model_log_ttip, s="lambda.1se", gamma="gamma.1se")[,1]!= 0])
USA_model_log_ttip_coeff_keep <- USA_model_log_ttip_coeff[2:length(USA_model_log_ttip_coeff)]
data_USA_only_tipped_ols_coef_log_ttip <- data_USA_only_tipped[USA_model_log_ttip_coeff_keep]
USA_OLS_model_log_ttip <- lm(log(USA_t_tip_only_tipped) ~. -1, data=data_USA_only_tipped_ols_coef_log_ttip)
USA_OLS_model_log_ttip_coeff_values <- summary(USA_OLS_model_log_ttip)


set.seed(42)
USA_parameter_ttip_trans <- model.matrix(USA_tipping_transformed_all ~. , data=data_USA_all)[,-1]
USA_model_ttip_trans <- cv.glmnet(USA_parameter_ttip_trans, USA_tipping_transformed_all, relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.1), alpha = 1, family='gaussian')
USA_model_ttip_trans_coeff_values <- coef(USA_model_ttip_trans, s="lambda.1se", gamma="gamma.1se")
USA_model_ttip_trans_coeff <- c(rownames(coef(USA_model_ttip_trans, s="lambda.1se", gamma="gamma.1se"))[coef(USA_model_ttip_trans, s="lambda.1se", gamma="gamma.1se")[,1]!= 0])
USA_model_ttip_trans_coeff_keep <- USA_model_ttip_trans_coeff[2:length(USA_model_ttip_trans_coeff)]
data_USA_all_OLS_coef_ttip_trans <- data_USA_all[USA_model_ttip_trans_coeff_keep]
USA_OLS_model_ttip_trans <- lm(USA_tipping_transformed_all ~. -1, data=data_USA_all_OLS_coef_ttip_trans)
USA_OLS_model_ttip_trans_coeff_values <- summary(USA_OLS_model_ttip_trans)


USA_parameter_logistic <- model.matrix(USA_tipped_or_not ~.  , data=data_USA_all)[,-1]
USA_model_logistic <- cv.glmnet(USA_parameter_logistic, USA_tipped_or_not, relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.1), alpha = 1, family='binomial')
USA_model_logistic_coeff_values <- coef(USA_model_logistic, s="lambda.1se", gamma="gamma.1se")
USA_model_logistic_coeff <- c(rownames(coef(USA_model_logistic, s="lambda.1se", gamma="gamma.1se"))[coef(USA_model_logistic, s="lambda.1se", gamma="gamma.1se")[,1]!= 0])
USA_model_logistic_coeff_keep <- USA_model_logistic_coeff[2:length(USA_model_logistic_coeff)]
data_USA_all_OLS_coef_logistic <- data_USA_all[USA_model_logistic_coeff_keep]
USA_OLS_model_logistic <- glm(USA_tipped_or_not ~. -1, data=data_USA_all_OLS_coef_logistic, family='binomial')
USA_OLS_model_logistic_coeff_values <- summary(USA_OLS_model_logistic)

