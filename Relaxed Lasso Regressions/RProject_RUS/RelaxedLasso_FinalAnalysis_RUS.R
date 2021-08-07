# read and load data
library(glmnet)
csv_RUS_all <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/RUS_all_Datframe_100000Simulations.csv'
csv_RUS_only_tipped <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_all_cluster_simulations/Relaxed Lasso Data/RUS_Only_tipped_Datframe_23138Simulations.csv'
data_RUS_all <- read.csv(file = csv_RUS_all)
data_RUS_only_tipped <- read.csv(file = csv_RUS_only_tipped) 
data_RUS_all[data_RUS_all==-2] <- Inf


# RUS variables for all simulations and the only tipped ones
RUS_tipped_or_not <- data_RUS_all$is_tipped
data_RUS_all[2]<- NULL
RUS_t_tip_all <- data_RUS_all$t_tip
RUS_tipping_transformed_all <- 1/data_RUS_all$t_tip
data_RUS_all[2]<- NULL

data_RUS_all$RUS_theta_a_all <- data_RUS_all$Theta_a
data_RUS_all$RUS_theta_a_all_log <- log(data_RUS_all$Theta_a)
data_RUS_all$RUS_theta_a_all_log_minus_1 <- log(1 - data_RUS_all$Theta_a)
data_RUS_all$RUS_1_div_theta_a_all <- 1/(data_RUS_all$Theta_a)
data_RUS_all$RUS_root_theta_a_all <- sqrt(data_RUS_all$Theta_a)
data_RUS_all$RUS_logistic_theta_a_all <- 1/(1 + exp( - data_RUS_all$Theta_a))
data_RUS_all$RUS_quad_theta_a_all <- (data_RUS_all$Theta_a)**2                        
data_RUS_all[2]<- NULL

data_RUS_all$RUS_theta_d_all <- data_RUS_all$Theta_d
data_RUS_all$RUS_theta_d_all_log <- log(data_RUS_all$Theta_d)
data_RUS_all$RUS_theta_d_all_log_minus_1 <- log(1 - data_RUS_all$Theta_d)
data_RUS_all$RUS_1_div_theta_d_all <- 1/(data_RUS_all$Theta_d)
data_RUS_all$RUS_root_theta_d_all <- sqrt(data_RUS_all$Theta_d)
data_RUS_all$RUS_logistic_theta_d_all <- 1/(1 + exp( - data_RUS_all$Theta_d))
data_RUS_all$RUS_quad_theta_d_all <- (data_RUS_all$Theta_d)**2  
data_RUS_all[3]<- NULL

data_RUS_all$RUS_p_a_all <- data_RUS_all$p_a
data_RUS_all$RUS_p_a_all_log <- log(data_RUS_all$p_a)
data_RUS_all$RUS_p_a_all_log_minus_1 <- log(1 - data_RUS_all$p_a)
data_RUS_all$RUS_1_div_p_a_all <- 1/(data_RUS_all$p_a)
data_RUS_all$RUS_root_p_a_all <- sqrt(data_RUS_all$p_a)
data_RUS_all$RUS_logistic_p_a_all <- 1/(1 + exp( - data_RUS_all$p_a))
data_RUS_all$RUS_quad_p_a_all <- (data_RUS_all$p_a)**2  
data_RUS_all[2]<- NULL

data_RUS_all$RUS_p_d_all <- data_RUS_all$p_d
data_RUS_all$RUS_p_d_all_log <- log(data_RUS_all$p_d)
data_RUS_all$RUS_p_d_all_log_minus_1 <- log(1 - data_RUS_all$p_d)
data_RUS_all$RUS_1_div_p_d_all <- 1/(data_RUS_all$p_d)
data_RUS_all$RUS_root_p_d_all <- sqrt(data_RUS_all$p_d)
data_RUS_all$RUS_logistic_p_d_all <- 1/(1 + exp( - data_RUS_all$p_d))
data_RUS_all$RUS_quad_p_d_all <- (data_RUS_all$p_d)**2  
data_RUS_all[2]<- NULL

data_RUS_all$RUS_p_e_all <- data_RUS_all$p_e
data_RUS_all$RUS_p_e_all_log <- log(data_RUS_all$p_e)
data_RUS_all$RUS_p_e_all_log_minus_1 <- log(1 - data_RUS_all$p_e)
data_RUS_all$RUS_1_div_p_e_all <- 1/(data_RUS_all$p_e)
data_RUS_all$RUS_root_p_e_all <- sqrt(data_RUS_all$p_e)
data_RUS_all$RUS_logistic_p_e_all <- 1/(1 + exp( - data_RUS_all$p_e))
data_RUS_all$RUS_quad_p_e_all <- (data_RUS_all$p_e)**2  
data_RUS_all[2]<- NULL

data_RUS_all$RUS_p_en_all <- data_RUS_all$p_en
data_RUS_all$RUS_p_en_all_log <- log(data_RUS_all$p_en)
data_RUS_all$RUS_p_en_all_log_minus_1 <- log(1 - data_RUS_all$p_en)
data_RUS_all$RUS_1_div_p_en_all <- 1/(data_RUS_all$p_en)
data_RUS_all$RUS_root_p_en_all <- sqrt(data_RUS_all$p_en)
data_RUS_all$RUS_logistic_p_en_all <- 1/(1 + exp( - data_RUS_all$p_en))
data_RUS_all$RUS_quad_p_en_all <- (data_RUS_all$p_en)**2  
data_RUS_all[2]<- NULL

data_RUS_all$RUS_p_ra_all <- data_RUS_all$p_ra
data_RUS_all$RUS_p_ra_all_log <- log(data_RUS_all$p_ra)
data_RUS_all$RUS_p_ra_all_log_minus_1 <- log(1 - data_RUS_all$p_ra)
data_RUS_all$RUS_1_div_p_ra_all <- 1/(data_RUS_all$p_ra)
data_RUS_all$RUS_root_p_ra_all <- sqrt(data_RUS_all$p_ra)
data_RUS_all$RUS_logistic_p_ra_all <- 1/(1 + exp( - data_RUS_all$p_ra))
data_RUS_all$RUS_quad_p_ra_all <- (data_RUS_all$p_ra)**2  
data_RUS_all[2]<- NULL

data_RUS_all$RUS_p_rd_all <- data_RUS_all$p_rd
data_RUS_all$RUS_p_rd_all_log <- log(data_RUS_all$p_rd)
data_RUS_all$RUS_p_rd_all_log_minus_1 <- log(1 - data_RUS_all$p_rd)
data_RUS_all$RUS_1_div_p_rd_all <- 1/(data_RUS_all$p_rd)
data_RUS_all$RUS_root_p_rd_all <- sqrt(data_RUS_all$p_rd)
data_RUS_all$RUS_logistic_p_rd_all <- 1/(1 + exp( - data_RUS_all$p_rd))
data_RUS_all$RUS_quad_p_rd_all <- (data_RUS_all$p_rd)**2  
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
data_RUS_only_tipped$RUS_1_div_theta_a_only_tipped <- 1/(data_RUS_only_tipped$Theta_a)
data_RUS_only_tipped$RUS_root_theta_a_only_tipped <- sqrt(data_RUS_only_tipped$Theta_a)
data_RUS_only_tipped$RUS_logistic_theta_a_only_tipped <- 1/(1 + exp( - data_RUS_only_tipped$Theta_a))
data_RUS_only_tipped$RUS_quad_theta_a_only_tipped <- (data_RUS_only_tipped$Theta_a)**2                        
data_RUS_only_tipped[2]<- NULL

data_RUS_only_tipped$RUS_theta_d_only_tipped <- data_RUS_only_tipped$Theta_d
data_RUS_only_tipped$RUS_theta_d_only_tipped_log <- log(data_RUS_only_tipped$Theta_d)
data_RUS_only_tipped$RUS_theta_d_only_tipped_log_minus_1 <- log(1 - data_RUS_only_tipped$Theta_d)
data_RUS_only_tipped$RUS_1_div_theta_d_only_tipped <- 1/(data_RUS_only_tipped$Theta_d)
data_RUS_only_tipped$RUS_root_theta_d_only_tipped <- sqrt(data_RUS_only_tipped$Theta_d)
data_RUS_only_tipped$RUS_logistic_theta_d_only_tipped <- 1/(1 + exp( - data_RUS_only_tipped$Theta_d))
data_RUS_only_tipped$RUS_quad_theta_d_only_tipped <- (data_RUS_only_tipped$Theta_d)**2  
data_RUS_only_tipped[3]<- NULL

data_RUS_only_tipped$RUS_p_a_only_tipped <- data_RUS_only_tipped$p_a
data_RUS_only_tipped$RUS_p_a_only_tipped_log <- log(data_RUS_only_tipped$p_a)
data_RUS_only_tipped$RUS_p_a_only_tipped_log_minus_1 <- log(1 - data_RUS_only_tipped$p_a)
data_RUS_only_tipped$RUS_1_div_p_a_only_tipped <- 1/(data_RUS_only_tipped$p_a)
data_RUS_only_tipped$RUS_root_p_a_only_tipped <- sqrt(data_RUS_only_tipped$p_a)
data_RUS_only_tipped$RUS_logistic_p_a_only_tipped <- 1/(1 + exp( - data_RUS_only_tipped$p_a))
data_RUS_only_tipped$RUS_quad_p_a_only_tipped <- (data_RUS_only_tipped$p_a)**2  
data_RUS_only_tipped[2]<- NULL

data_RUS_only_tipped$RUS_p_d_only_tipped <- data_RUS_only_tipped$p_d
data_RUS_only_tipped$RUS_p_d_only_tipped_log <- log(data_RUS_only_tipped$p_d)
data_RUS_only_tipped$RUS_p_d_only_tipped_log_minus_1 <- log(1 - data_RUS_only_tipped$p_d)
data_RUS_only_tipped$RUS_1_div_p_d_only_tipped <- 1/(data_RUS_only_tipped$p_d)
data_RUS_only_tipped$RUS_root_p_d_only_tipped <- sqrt(data_RUS_only_tipped$p_d)
data_RUS_only_tipped$RUS_logistic_p_d_only_tipped <- 1/(1 + exp( - data_RUS_only_tipped$p_d))
data_RUS_only_tipped$RUS_quad_p_d_only_tipped <- (data_RUS_only_tipped$p_d)**2  
data_RUS_only_tipped[2]<- NULL

data_RUS_only_tipped$RUS_p_e_only_tipped <- data_RUS_only_tipped$p_e
data_RUS_only_tipped$RUS_p_e_only_tipped_log <- log(data_RUS_only_tipped$p_e)
data_RUS_only_tipped$RUS_p_e_only_tipped_log_minus_1 <- log(1 - data_RUS_only_tipped$p_e)
data_RUS_only_tipped$RUS_1_div_p_e_only_tipped <- 1/(data_RUS_only_tipped$p_e)
data_RUS_only_tipped$RUS_root_p_e_only_tipped <- sqrt(data_RUS_only_tipped$p_e)
data_RUS_only_tipped$RUS_logistic_p_e_only_tipped <- 1/(1 + exp( - data_RUS_only_tipped$p_e))
data_RUS_only_tipped$RUS_quad_p_e_only_tipped <- (data_RUS_only_tipped$p_e)**2  
data_RUS_only_tipped[2]<- NULL

data_RUS_only_tipped$RUS_p_en_only_tipped <- data_RUS_only_tipped$p_en
data_RUS_only_tipped$RUS_p_en_only_tipped_log <- log(data_RUS_only_tipped$p_en)
data_RUS_only_tipped$RUS_p_en_only_tipped_log_minus_1 <- log(1 - data_RUS_only_tipped$p_en)
data_RUS_only_tipped$RUS_1_div_p_en_only_tipped <- 1/(data_RUS_only_tipped$p_en)
data_RUS_only_tipped$RUS_root_p_en_only_tipped <- sqrt(data_RUS_only_tipped$p_en)
data_RUS_only_tipped$RUS_logistic_p_en_only_tipped <- 1/(1 + exp( - data_RUS_only_tipped$p_en))
data_RUS_only_tipped$RUS_quad_p_en_only_tipped <- (data_RUS_only_tipped$p_en)**2  
data_RUS_only_tipped[2]<- NULL

data_RUS_only_tipped$RUS_p_ra_only_tipped <- data_RUS_only_tipped$p_ra
data_RUS_only_tipped$RUS_p_ra_only_tipped_log <- log(data_RUS_only_tipped$p_ra)
data_RUS_only_tipped$RUS_p_ra_only_tipped_log_minus_1 <- log(1 - data_RUS_only_tipped$p_ra)
data_RUS_only_tipped$RUS_1_div_p_ra_only_tipped <- 1/(data_RUS_only_tipped$p_ra)
data_RUS_only_tipped$RUS_root_p_ra_only_tipped <- sqrt(data_RUS_only_tipped$p_ra)
data_RUS_only_tipped$RUS_logistic_p_ra_only_tipped <- 0.0001/(1 + exp( - data_RUS_only_tipped$p_ra))
data_RUS_only_tipped$RUS_quad_p_ra_only_tipped <- (data_RUS_only_tipped$p_ra)**2  
data_RUS_only_tipped[2]<- NULL

data_RUS_only_tipped$RUS_p_rd_only_tipped <- data_RUS_only_tipped$p_rd
data_RUS_only_tipped$RUS_p_rd_only_tipped_log <- log(data_RUS_only_tipped$p_rd)
data_RUS_only_tipped$RUS_p_rd_only_tipped_log_minus_1 <- log(1 - data_RUS_only_tipped$p_rd)
data_RUS_only_tipped$RUS_1_div_p_rd_only_tipped <- 1/(data_RUS_only_tipped$p_rd)
data_RUS_only_tipped$RUS_root_p_rd_only_tipped <- sqrt(data_RUS_only_tipped$p_rd)
data_RUS_only_tipped$RUS_logistic_p_rd_only_tipped <- 0.0001/(1 + exp( - data_RUS_only_tipped$p_rd))
data_RUS_only_tipped$RUS_quad_p_rd_only_tipped <- (data_RUS_only_tipped$p_rd)**2  
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




# -----------------------------------------------------------------------
# Do the regressions
set.seed(42) # to avoid randomized results

RUS_parameter_log_ttip <- model.matrix(log(RUS_t_tip_only_tipped) ~. -1, data =data_RUS_only_tipped)
RUS_model_log_ttip <- cv.glmnet(RUS_parameter_log_ttip, log(RUS_t_tip_only_tipped), relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.1), alpha = 1, family='gaussian')
RUS_model_log_ttip_coeff_values <- coef(RUS_model_log_ttip, s="lambda.1se", gamma="gamma.1se")
RUS_model_log_ttip_coeff <- c(rownames(coef(RUS_model_log_ttip, s="lambda.1se", gamma="gamma.1se"))[coef(RUS_model_log_ttip, s="lambda.1se", gamma="gamma.1se")[,1]!= 0])
RUS_model_log_ttip_coeff_keep <- RUS_model_log_ttip_coeff[2:length(RUS_model_log_ttip_coeff)]
data_RUS_only_tipped_ols_coef_log_ttip <- data_RUS_only_tipped[RUS_model_log_ttip_coeff_keep]
RUS_OLS_model_log_ttip <- lm(log(RUS_t_tip_only_tipped) ~. -1, data=data_RUS_only_tipped_ols_coef_log_ttip)
RUS_OLS_model_log_ttip_coeff_values <- summary(RUS_OLS_model_log_ttip)


set.seed(42)
RUS_parameter_ttip_trans <- model.matrix(RUS_tipping_transformed_all ~. , data=data_RUS_all)[,-1]
RUS_model_ttip_trans <- cv.glmnet(RUS_parameter_ttip_trans, RUS_tipping_transformed_all, relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.1), alpha = 1, family='gaussian')
RUS_model_ttip_trans_coeff_values <- coef(RUS_model_ttip_trans, s="lambda.1se", gamma="gamma.1se")
RUS_model_ttip_trans_coeff <- c(rownames(coef(RUS_model_ttip_trans, s="lambda.1se", gamma="gamma.1se"))[coef(RUS_model_ttip_trans, s="lambda.1se", gamma="gamma.1se")[,1]!= 0])
RUS_model_ttip_trans_coeff_keep <- RUS_model_ttip_trans_coeff[2:length(RUS_model_ttip_trans_coeff)]
data_RUS_all_OLS_coef_ttip_trans <- data_RUS_all[RUS_model_ttip_trans_coeff_keep]
RUS_OLS_model_ttip_trans <- lm(RUS_tipping_transformed_all ~. -1, data=data_RUS_all_OLS_coef_ttip_trans)
RUS_OLS_model_ttip_trans_coeff_values <- summary(RUS_OLS_model_ttip_trans)


RUS_parameter_logistic <- model.matrix(RUS_tipped_or_not ~.  , data=data_RUS_all)[,-1]
RUS_model_logistic <- cv.glmnet(RUS_parameter_logistic, RUS_tipped_or_not, relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.1), alpha = 1, family='binomial')
RUS_model_logistic_coeff_values <- coef(RUS_model_logistic, s="lambda.1se", gamma="gamma.1se")
RUS_model_logistic_coeff <- c(rownames(coef(RUS_model_logistic, s="lambda.1se", gamma="gamma.1se"))[coef(RUS_model_logistic, s="lambda.1se", gamma="gamma.1se")[,1]!= 0])
RUS_model_logistic_coeff_keep <- RUS_model_logistic_coeff[2:length(RUS_model_logistic_coeff)]
data_RUS_all_OLS_coef_logistic <- data_RUS_all[RUS_model_logistic_coeff_keep]
RUS_OLS_model_logistic <- glm(RUS_tipped_or_not ~. -1, data=data_RUS_all_OLS_coef_logistic, family='binomial')
RUS_OLS_model_logistic_coeff_values <- summary(RUS_OLS_model_logistic)

