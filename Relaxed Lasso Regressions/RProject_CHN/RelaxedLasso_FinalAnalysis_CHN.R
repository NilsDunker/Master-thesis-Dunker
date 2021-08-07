# read and load data
library(glmnet)
csv_CHN_all <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/CHN_all_Datframe_100000Simulations.csv'
csv_CHN_only_tipped <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/CHN_Only_tipped_Datframe_46411Simulations.csv'
data_CHN_all <- read.csv(file = csv_CHN_all)
data_CHN_only_tipped <- read.csv(file = csv_CHN_only_tipped) 
data_CHN_all[data_CHN_all==-2] <- Inf


# CHN variables for all simulations and the only tipped ones
CHN_tipped_or_not <- data_CHN_all$is_tipped
data_CHN_all[2]<- NULL
CHN_t_tip_all <- data_CHN_all$t_tip
CHN_tipping_transformed_all <- 1/data_CHN_all$t_tip
data_CHN_all[2]<- NULL

data_CHN_all$CHN_theta_a_all <- data_CHN_all$Theta_a
data_CHN_all$CHN_theta_a_all_log <- log(data_CHN_all$Theta_a)
data_CHN_all$CHN_theta_a_all_log_minus_1 <- log(1 - data_CHN_all$Theta_a)
data_CHN_all$CHN_1_div_theta_a_all <- 1/(data_CHN_all$Theta_a)
data_CHN_all$CHN_root_theta_a_all <- sqrt(data_CHN_all$Theta_a)
data_CHN_all$CHN_logistic_theta_a_all <- 1/(1 + exp( - data_CHN_all$Theta_a))
data_CHN_all$CHN_quad_theta_a_all <- (data_CHN_all$Theta_a)**2                        
data_CHN_all[2]<- NULL

data_CHN_all$CHN_theta_d_all <- data_CHN_all$Theta_d
data_CHN_all$CHN_theta_d_all_log <- log(data_CHN_all$Theta_d)
data_CHN_all$CHN_theta_d_all_log_minus_1 <- log(1 - data_CHN_all$Theta_d)
data_CHN_all$CHN_1_div_theta_d_all <- 1/(data_CHN_all$Theta_d)
data_CHN_all$CHN_root_theta_d_all <- sqrt(data_CHN_all$Theta_d)
data_CHN_all$CHN_logistic_theta_d_all <- 1/(1 + exp( - data_CHN_all$Theta_d))
data_CHN_all$CHN_quad_theta_d_all <- (data_CHN_all$Theta_d)**2  
data_CHN_all[3]<- NULL

data_CHN_all$CHN_p_a_all <- data_CHN_all$p_a
data_CHN_all$CHN_p_a_all_log <- log(data_CHN_all$p_a)
data_CHN_all$CHN_p_a_all_log_minus_1 <- log(1 - data_CHN_all$p_a)
data_CHN_all$CHN_1_div_p_a_all <- 1/(data_CHN_all$p_a)
data_CHN_all$CHN_root_p_a_all <- sqrt(data_CHN_all$p_a)
data_CHN_all$CHN_logistic_p_a_all <- 1/(1 + exp( - data_CHN_all$p_a))
data_CHN_all$CHN_quad_p_a_all <- (data_CHN_all$p_a)**2  
data_CHN_all[2]<- NULL

data_CHN_all$CHN_p_d_all <- data_CHN_all$p_d
data_CHN_all$CHN_p_d_all_log <- log(data_CHN_all$p_d)
data_CHN_all$CHN_p_d_all_log_minus_1 <- log(1 - data_CHN_all$p_d)
data_CHN_all$CHN_1_div_p_d_all <- 1/(data_CHN_all$p_d)
data_CHN_all$CHN_root_p_d_all <- sqrt(data_CHN_all$p_d)
data_CHN_all$CHN_logistic_p_d_all <- 1/(1 + exp( - data_CHN_all$p_d))
data_CHN_all$CHN_quad_p_d_all <- (data_CHN_all$p_d)**2  
data_CHN_all[2]<- NULL

data_CHN_all$CHN_p_e_all <- data_CHN_all$p_e
data_CHN_all$CHN_p_e_all_log <- log(data_CHN_all$p_e)
data_CHN_all$CHN_p_e_all_log_minus_1 <- log(1 - data_CHN_all$p_e)
data_CHN_all$CHN_1_div_p_e_all <- 1/(data_CHN_all$p_e)
data_CHN_all$CHN_root_p_e_all <- sqrt(data_CHN_all$p_e)
data_CHN_all$CHN_logistic_p_e_all <- 1/(1 + exp( - data_CHN_all$p_e))
data_CHN_all$CHN_quad_p_e_all <- (data_CHN_all$p_e)**2  
data_CHN_all[2]<- NULL

data_CHN_all$CHN_p_en_all <- data_CHN_all$p_en
data_CHN_all$CHN_p_en_all_log <- log(data_CHN_all$p_en)
data_CHN_all$CHN_p_en_all_log_minus_1 <- log(1 - data_CHN_all$p_en)
data_CHN_all$CHN_1_div_p_en_all <- 1/(data_CHN_all$p_en)
data_CHN_all$CHN_root_p_en_all <- sqrt(data_CHN_all$p_en)
data_CHN_all$CHN_logistic_p_en_all <- 1/(1 + exp( - data_CHN_all$p_en))
data_CHN_all$CHN_quad_p_en_all <- (data_CHN_all$p_en)**2  
data_CHN_all[2]<- NULL

data_CHN_all$CHN_p_ra_all <- data_CHN_all$p_ra
data_CHN_all$CHN_p_ra_all_log <- log(data_CHN_all$p_ra)
data_CHN_all$CHN_p_ra_all_log_minus_1 <- log(1 - data_CHN_all$p_ra)
data_CHN_all$CHN_1_div_p_ra_all <- 1/(data_CHN_all$p_ra)
data_CHN_all$CHN_root_p_ra_all <- sqrt(data_CHN_all$p_ra)
data_CHN_all$CHN_logistic_p_ra_all <- 1/(1 + exp( - data_CHN_all$p_ra))
data_CHN_all$CHN_quad_p_ra_all <- (data_CHN_all$p_ra)**2  
data_CHN_all[2]<- NULL

data_CHN_all$CHN_p_rd_all <- data_CHN_all$p_rd
data_CHN_all$CHN_p_rd_all_log <- log(data_CHN_all$p_rd)
data_CHN_all$CHN_p_rd_all_log_minus_1 <- log(1 - data_CHN_all$p_rd)
data_CHN_all$CHN_1_div_p_rd_all <- 1/(data_CHN_all$p_rd)
data_CHN_all$CHN_root_p_rd_all <- sqrt(data_CHN_all$p_rd)
data_CHN_all$CHN_logistic_p_rd_all <- 1/(1 + exp( - data_CHN_all$p_rd))
data_CHN_all$CHN_quad_p_rd_all <- (data_CHN_all$p_rd)**2  
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
data_CHN_only_tipped$CHN_1_div_theta_a_only_tipped <- 1/(data_CHN_only_tipped$Theta_a)
data_CHN_only_tipped$CHN_root_theta_a_only_tipped <- sqrt(data_CHN_only_tipped$Theta_a)
data_CHN_only_tipped$CHN_logistic_theta_a_only_tipped <- 1/(1 + exp( - data_CHN_only_tipped$Theta_a))
data_CHN_only_tipped$CHN_quad_theta_a_only_tipped <- (data_CHN_only_tipped$Theta_a)**2                        
data_CHN_only_tipped[2]<- NULL

data_CHN_only_tipped$CHN_theta_d_only_tipped <- data_CHN_only_tipped$Theta_d
data_CHN_only_tipped$CHN_theta_d_only_tipped_log <- log(data_CHN_only_tipped$Theta_d)
data_CHN_only_tipped$CHN_theta_d_only_tipped_log_minus_1 <- log(1 - data_CHN_only_tipped$Theta_d)
data_CHN_only_tipped$CHN_1_div_theta_d_only_tipped <- 1/(data_CHN_only_tipped$Theta_d)
data_CHN_only_tipped$CHN_root_theta_d_only_tipped <- sqrt(data_CHN_only_tipped$Theta_d)
data_CHN_only_tipped$CHN_logistic_theta_d_only_tipped <- 1/(1 + exp( - data_CHN_only_tipped$Theta_d))
data_CHN_only_tipped$CHN_quad_theta_d_only_tipped <- (data_CHN_only_tipped$Theta_d)**2  
data_CHN_only_tipped[3]<- NULL

data_CHN_only_tipped$CHN_p_a_only_tipped <- data_CHN_only_tipped$p_a
data_CHN_only_tipped$CHN_p_a_only_tipped_log <- log(data_CHN_only_tipped$p_a)
data_CHN_only_tipped$CHN_p_a_only_tipped_log_minus_1 <- log(1 - data_CHN_only_tipped$p_a)
data_CHN_only_tipped$CHN_1_div_p_a_only_tipped <- 1/(data_CHN_only_tipped$p_a)
data_CHN_only_tipped$CHN_root_p_a_only_tipped <- sqrt(data_CHN_only_tipped$p_a)
data_CHN_only_tipped$CHN_logistic_p_a_only_tipped <- 1/(1 + exp( - data_CHN_only_tipped$p_a))
data_CHN_only_tipped$CHN_quad_p_a_only_tipped <- (data_CHN_only_tipped$p_a)**2  
data_CHN_only_tipped[2]<- NULL

data_CHN_only_tipped$CHN_p_d_only_tipped <- data_CHN_only_tipped$p_d
data_CHN_only_tipped$CHN_p_d_only_tipped_log <- log(data_CHN_only_tipped$p_d)
data_CHN_only_tipped$CHN_p_d_only_tipped_log_minus_1 <- log(1 - data_CHN_only_tipped$p_d)
data_CHN_only_tipped$CHN_1_div_p_d_only_tipped <- 1/(data_CHN_only_tipped$p_d)
data_CHN_only_tipped$CHN_root_p_d_only_tipped <- sqrt(data_CHN_only_tipped$p_d)
data_CHN_only_tipped$CHN_logistic_p_d_only_tipped <- 1/(1 + exp( - data_CHN_only_tipped$p_d))
data_CHN_only_tipped$CHN_quad_p_d_only_tipped <- (data_CHN_only_tipped$p_d)**2  
data_CHN_only_tipped[2]<- NULL

data_CHN_only_tipped$CHN_p_e_only_tipped <- data_CHN_only_tipped$p_e
data_CHN_only_tipped$CHN_p_e_only_tipped_log <- log(data_CHN_only_tipped$p_e)
data_CHN_only_tipped$CHN_p_e_only_tipped_log_minus_1 <- log(1 - data_CHN_only_tipped$p_e)
data_CHN_only_tipped$CHN_1_div_p_e_only_tipped <- 1/(data_CHN_only_tipped$p_e)
data_CHN_only_tipped$CHN_root_p_e_only_tipped <- sqrt(data_CHN_only_tipped$p_e)
data_CHN_only_tipped$CHN_logistic_p_e_only_tipped <- 1/(1 + exp( - data_CHN_only_tipped$p_e))
data_CHN_only_tipped$CHN_quad_p_e_only_tipped <- (data_CHN_only_tipped$p_e)**2  
data_CHN_only_tipped[2]<- NULL

data_CHN_only_tipped$CHN_p_en_only_tipped <- data_CHN_only_tipped$p_en
data_CHN_only_tipped$CHN_p_en_only_tipped_log <- log(data_CHN_only_tipped$p_en)
data_CHN_only_tipped$CHN_p_en_only_tipped_log_minus_1 <- log(1 - data_CHN_only_tipped$p_en)
data_CHN_only_tipped$CHN_1_div_p_en_only_tipped <- 1/(data_CHN_only_tipped$p_en)
data_CHN_only_tipped$CHN_root_p_en_only_tipped <- sqrt(data_CHN_only_tipped$p_en)
data_CHN_only_tipped$CHN_logistic_p_en_only_tipped <- 1/(1 + exp( - data_CHN_only_tipped$p_en))
data_CHN_only_tipped$CHN_quad_p_en_only_tipped <- (data_CHN_only_tipped$p_en)**2  
data_CHN_only_tipped[2]<- NULL

data_CHN_only_tipped$CHN_p_ra_only_tipped <- data_CHN_only_tipped$p_ra
data_CHN_only_tipped$CHN_p_ra_only_tipped_log <- log(data_CHN_only_tipped$p_ra)
data_CHN_only_tipped$CHN_p_ra_only_tipped_log_minus_1 <- log(1 - data_CHN_only_tipped$p_ra)
data_CHN_only_tipped$CHN_1_div_p_ra_only_tipped <- 1/(data_CHN_only_tipped$p_ra)
data_CHN_only_tipped$CHN_root_p_ra_only_tipped <- sqrt(data_CHN_only_tipped$p_ra)
data_CHN_only_tipped$CHN_logistic_p_ra_only_tipped <- 0.0001/(1 + exp( - data_CHN_only_tipped$p_ra))
data_CHN_only_tipped$CHN_quad_p_ra_only_tipped <- (data_CHN_only_tipped$p_ra)**2  
data_CHN_only_tipped[2]<- NULL

data_CHN_only_tipped$CHN_p_rd_only_tipped <- data_CHN_only_tipped$p_rd
data_CHN_only_tipped$CHN_p_rd_only_tipped_log <- log(data_CHN_only_tipped$p_rd)
data_CHN_only_tipped$CHN_p_rd_only_tipped_log_minus_1 <- log(1 - data_CHN_only_tipped$p_rd)
data_CHN_only_tipped$CHN_1_div_p_rd_only_tipped <- 1/(data_CHN_only_tipped$p_rd)
data_CHN_only_tipped$CHN_root_p_rd_only_tipped <- sqrt(data_CHN_only_tipped$p_rd)
data_CHN_only_tipped$CHN_logistic_p_rd_only_tipped <- 0.0001/(1 + exp( - data_CHN_only_tipped$p_rd))
data_CHN_only_tipped$CHN_quad_p_rd_only_tipped <- (data_CHN_only_tipped$p_rd)**2  
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




# -----------------------------------------------------------------------
# Do the regressions
set.seed(42) # to avoid randomized results

CHN_parameter_log_ttip <- model.matrix(log(CHN_t_tip_only_tipped) ~. -1, data =data_CHN_only_tipped)
CHN_model_log_ttip <- cv.glmnet(CHN_parameter_log_ttip, log(CHN_t_tip_only_tipped), relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.1), alpha = 1, family='gaussian')
CHN_model_log_ttip_coeff_values <- coef(CHN_model_log_ttip, s="lambda.1se", gamma="gamma.1se")
CHN_model_log_ttip_coeff <- c(rownames(coef(CHN_model_log_ttip, s="lambda.1se", gamma="gamma.1se"))[coef(CHN_model_log_ttip, s="lambda.1se", gamma="gamma.1se")[,1]!= 0])
CHN_model_log_ttip_coeff_keep <- CHN_model_log_ttip_coeff[2:length(CHN_model_log_ttip_coeff)]
data_CHN_only_tipped_ols_coef_log_ttip <- data_CHN_only_tipped[CHN_model_log_ttip_coeff_keep]
CHN_OLS_model_log_ttip <- lm(log(CHN_t_tip_only_tipped) ~. -1, data=data_CHN_only_tipped_ols_coef_log_ttip)
CHN_OLS_model_log_ttip_coeff_values <- summary(CHN_OLS_model_log_ttip)


set.seed(42)
CHN_parameter_ttip_trans <- model.matrix(CHN_tipping_transformed_all ~. , data=data_CHN_all)[,-1]
CHN_model_ttip_trans <- cv.glmnet(CHN_parameter_ttip_trans, CHN_tipping_transformed_all, relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.1), alpha = 1, family='gaussian')
CHN_model_ttip_trans_coeff_values <- coef(CHN_model_ttip_trans, s="lambda.1se", gamma="gamma.1se")
CHN_model_ttip_trans_coeff <- c(rownames(coef(CHN_model_ttip_trans, s="lambda.1se", gamma="gamma.1se"))[coef(CHN_model_ttip_trans, s="lambda.1se", gamma="gamma.1se")[,1]!= 0])
CHN_model_ttip_trans_coeff_keep <- CHN_model_ttip_trans_coeff[2:length(CHN_model_ttip_trans_coeff)]
data_CHN_all_OLS_coef_ttip_trans <- data_CHN_all[CHN_model_ttip_trans_coeff_keep]
CHN_OLS_model_ttip_trans <- lm(CHN_tipping_transformed_all ~. -1, data=data_CHN_all_OLS_coef_ttip_trans)
CHN_OLS_model_ttip_trans_coeff_values <- summary(CHN_OLS_model_ttip_trans)


CHN_parameter_logistic <- model.matrix(CHN_tipped_or_not ~.  , data=data_CHN_all)[,-1]
CHN_model_logistic <- cv.glmnet(CHN_parameter_logistic, CHN_tipped_or_not, relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.1), alpha = 1, family='binomial')
CHN_model_logistic_coeff_values <- coef(CHN_model_logistic, s="lambda.1se", gamma="gamma.1se")
CHN_model_logistic_coeff <- c(rownames(coef(CHN_model_logistic, s="lambda.1se", gamma="gamma.1se"))[coef(CHN_model_logistic, s="lambda.1se", gamma="gamma.1se")[,1]!= 0])
CHN_model_logistic_coeff_keep <- CHN_model_logistic_coeff[2:length(CHN_model_logistic_coeff)]
data_CHN_all_OLS_coef_logistic <- data_CHN_all[CHN_model_logistic_coeff_keep]
CHN_OLS_model_logistic <- glm(CHN_tipped_or_not ~. -1, data=data_CHN_all_OLS_coef_logistic, family='binomial')
CHN_OLS_model_logistic_coeff_values <- summary(CHN_OLS_model_logistic)

