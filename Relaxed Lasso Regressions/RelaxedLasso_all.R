# read and load data
library(glmnet)
csv_file_all <- 'Z:/Uni Nils/Energy Science Master/Masterarbeit/Python/Marc GranovetterModell/pygranovetter/Workprogress Scripts/Auswertung/Arrays_events_yearly/Datframe_for_R_Lasso_1000Simulations.csv'
data_array_all <- read.csv(file = csv_file_all)
data_array_all_inf <- data_array_all
data_array_all_inf[data_array_all==-2] <- Inf

# define variables
tipped_or_not <- data_array_all$is_tipped
t_tip_all <- data_array_all$t_tip
tipping_transformed <- 1/data_array_all_inf$t_tip
theta_a_all <- data_array_all$Theta_a
p_a_all <- data_array_all$p_a
theta_d_all <- data_array_all$Theta_d
p_d_all <- data_array_all$p_d
p_e_all <- data_array_all$p_e
ln_p_e_all <- log(data_array_all$p_e)
n_c_all <- data_array_all$n_c
n_p_all <- data_array_all$n_p
n_e_all <- data_array_all$n_e
N_all <- data_array_all$N

logit_theta_a_all <- (log(theta_a_all) - log(1 - theta_a_all))
logit_theta_d_all <- (log(theta_d_all) - log(1 - theta_d_all))
logit_p_a_all <- (log(p_a_all) - log(1 - p_a_all))
logit_p_d_all <- (log(p_d_all) - log(1 - p_d_all))
logit_p_e_all <- (log(p_e_all) - log(1 - p_e_all))

param_all_logit = model.matrix(tipping_transformed ~ p_a_all + p_d_all + p_e_all + log(p_a_all) + log(p_d_all) + log(p_e_all) + log(1 - p_a_all) + log(1-p_d_all) + log(1-p_e_all) + logit_p_a_all + logit_p_d_all + logit_p_e_all + log(N_all/2 - n_c_all) + log(n_c_all + (n_p_all - n_c_all)/2 ) + theta_a_all + theta_d_all + log(theta_a_all) + log(theta_d_all) + log(1 - theta_a_all) + log(1 - theta_d_all) + logit_theta_a_all + logit_theta_d_all + n_p_all + n_c_all + n_e_all + p_d_all*n_c_all + p_e_all*n_e_all*n_p_all + p_e_all*n_e_all + p_a_all*n_p_all , data=data_array_all_inf)[,-1]
param_all = model.matrix(tipping_transformed ~ p_a_all + p_d_all + p_e_all + log(p_a_all) + log(p_d_all) + log(p_e_all) + log(1 - p_a_all) + log(1-p_d_all) + log(1-p_e_all) + log(N_all/2 - n_c_all) + log(n_c_all + (n_p_all - n_c_all)/2 ) + theta_a_all + theta_d_all + log(theta_a_all) + log(theta_d_all) + log(1 - theta_a_all) + log(1 - theta_d_all) + n_p_all + n_c_all + n_e_all + p_d_all*n_c_all + p_e_all*n_e_all*n_p_all + p_e_all*n_e_all + p_a_all*n_p_all , data=data_array_all_inf)[,-1]
current_parameter_set_all = param_all

# find amount of penalty lambda by CV (search lambda for min MSE)
regression <- cv.glmnet(current_parameter_set_all, tipping_transformed, relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.001), alpha = 1) 

coef(regression, s="lambda.min", gamma="gamma.min")
# plot(regression$glmnet.fit, "lambda", label=TRUE) # influence of different lambdas on parameters
# plot(regression) # MSE for several lambda
# print(regression)
# summary(regression)

# compare with OLS(ordinary least sqaures regression)
ols.model <- lm(tipping_transformed ~ p_a_all + p_d_all + p_e_all + log(p_a_all) + log(p_d_all) + log(p_e_all) + log(1 - p_a_all) + log(1-p_d_all) + log(1-p_e_all) + log(N_all/2 - n_c_all) + log(n_c_all + (n_p_all - n_c_all)/2 ) + theta_a_all + theta_d_all + log(theta_a_all) + log(theta_d_all) + log(1 - theta_a_all) + log(1 - theta_d_all) + n_p_all + n_c_all + n_e_all + p_d_all*n_c_all + p_e_all*n_e_all*n_p_all + p_e_all*n_e_all + p_a_all*n_p_all , data=data_array_all_inf)
summary(ols.model)
ols.model_logit <- lm(tipping_transformed ~ p_a_all + p_d_all + p_e_all + log(p_a_all) + log(p_d_all) + log(p_e_all) + log(1 - p_a_all) + log(1-p_d_all) + log(1-p_e_all) + logit_p_a_all + logit_p_d_all + logit_p_e_all + log(N_all/2 - n_c_all) + log(n_c_all + (n_p_all - n_c_all)/2 ) + theta_a_all + theta_d_all + log(theta_a_all) + log(theta_d_all) + log(1 - theta_a_all) + log(1 - theta_d_all) + logit_theta_a_all + logit_theta_d_all + n_p_all + n_c_all + n_e_all + p_d_all*n_c_all + p_e_all*n_e_all*n_p_all + p_e_all*n_e_all + p_a_all*n_p_all , data=data_array_all_inf)
summary(ols.model_logit)

# z-Standardisieren um Variablen miteinander vergleichen zu können
Ztipped_or_not <- scale(data_array_all$is_tipped)
Zt_tip_all <- scale(data_array_all$t_tip)
Ztipping_transformed <- scale(1/data_array_all_inf$t_tip)

Ztheta_a_all <- scale(data_array_all$Theta_a)
Zlog_theta_a_all <- scale(log(data_array_all$Theta_a))
Zlog_theta_a_all_1 <- scale(log(1-data_array_all$Theta_a))

Ztheta_d_all <- scale(data_array_all$Theta_d)
Zlog_theta_d_all <- scale(log(data_array_all$Theta_d))
Zlog_theta_d_all_1 <- scale(log(1-data_array_all$Theta_d))

Zp_a_all <- scale(data_array_all$p_a)
Zlog_p_a_all <- scale(log(data_array_all$p_a))
Zlog_p_a_all_1 <- scale(log(1-data_array_all$p_a))

Zp_d_all <- scale(data_array_all$p_d)
Zlog_p_d_all <- scale(log(data_array_all$p_d))
Zlog_p_d_all_1 <- scale(log(1-data_array_all$p_d))

Zp_e_all <- scale(data_array_all$p_e)
Zlog_p_e_all <- scale(log(data_array_all$p_e))
Zlog_p_e_all_1 <- scale(log(1-data_array_all$p_e))

Zn_c_all <- scale(data_array_all$n_c)
Zn_p_all <- scale(data_array_all$n_p)
Zn_e_all <- scale(data_array_all$n_e)
ZN_all <- scale(data_array_all$N)
Zcertainly_1 <- scale(log(N_all/2 - n_c_all))
Zcertainly_2 <-log(n_c_all + (n_p_all - n_c_all)/2 ) 
Zextra_1 <- p_d_all*n_c_all
Zextra_2 <- p_e_all*n_e_all*n_p_all
Zextra_3 <- p_e_all*n_e_all 
Zextra_4 <- p_a_all*n_p_all 

ztestmodel <- lm(Ztipping_transformed~ Ztheta_a_all + Zlog_theta_a_all + Zlog_theta_a_all_1 + Ztheta_d_all + Zlog_theta_d_all + Zlog_theta_d_all_1 + Zp_a_all + Zlog_p_a_all + Zlog_p_a_all_1 + Zp_d_all + Zlog_p_d_all + Zlog_p_d_all_1 + Zp_e_all + Zlog_p_e_all + Zlog_p_e_all_1 + Zn_c_all + Zn_p_all + Zn_e_all + Zcertainly_1 + Zcertainly_2 + Zextra_1 + Zextra_2 + Zextra_3 + Zextra_4, data=data_array_all )
summary(ztestmodel)


# get lasso estimates with min lambda
l.lasso.min <- regression$lambda.min
lasso.model <- glmnet(current_parameter_set_all, tipping_transformed, relax = TRUE, trace.it = TRUE, gamma=gamma.min, lambda = l.lasso.min)
print(lasso.model$beta) # coefficients
# plot(lasso.model)



#-------
# Check for theta behaviour
Y <- (1*0.221664431) + (1/theta_a_all*(-0.131374136)) - (1/(1-theta_a_all)*0.004963936)
plot(x=theta_a_all, y=Y)
print(Y)
print(theta_a_all)

# --------------------------------------------------------------------------------------------------------
# logistic regression
param_all = model.matrix(tipped_or_not ~ p_a_all + p_d_all + p_e_all + log(p_a_all) + log(p_d_all) + log(p_e_all) + log(1 - p_a_all) + log(1-p_d_all) + log(1-p_e_all) + log(N_all/2 - n_c_all) + log(n_c_all + (n_p_all - n_c_all)/2 ) + theta_a_all + theta_d_all + log(theta_a_all) + log(theta_d_all) + log(1 - theta_a_all) + log(1 - theta_d_all) + n_p_all + n_c_all + n_e_all + p_d_all*n_c_all + p_e_all*n_e_all*n_p_all + p_e_all*n_e_all + p_a_all*n_p_all, data=data_array_all)[,-1]
param_all_logit = model.matrix(tipped_or_not ~ p_a_all + p_d_all + p_e_all + log(p_a_all) + log(p_d_all) + log(p_e_all) + log(1 - p_a_all) + log(1-p_d_all) + log(1-p_e_all) + logit_p_a_all + logit_p_d_all + logit_p_e_all + log(N_all/2 - n_c_all) + log(n_c_all + (n_p_all - n_c_all)/2 ) + theta_a_all + theta_d_all + log(theta_a_all) + log(theta_d_all) + log(1 - theta_a_all) + log(1 - theta_d_all) + logit_theta_a_all + logit_theta_d_all + n_p_all + n_c_all + n_e_all + p_d_all*n_c_all + p_e_all*n_e_all*n_p_all + p_e_all*n_e_all + p_a_all*n_p_all , data=data_array_all)[,-1]

# use lasso for logistic regression by first finding lambda through CV
current_parameter_set_all = param_all_logit
logistic_regression <- cv.glmnet(current_parameter_set_all, tipped_or_not, family='binomial',  relax = TRUE, trace.it = TRUE, gamma=seq(from=0, to=1, by=0.001), alpha = 1) # alpha=1 -> lasso
coef(logistic_regression, s="lambda.min", gamma="gamma.min")
plot(logistic_regression) # binomial deviance is the loss function of the logistic regression

# use min lasso to do lasso plot logistic model
l.min <- logistic_regression$lambda.min
lasso.model <- glmnet(current_parameter_set_all, tipped_or_not, family = "binomial", alpha=1, lambda = l.min, gamma=gamma.min)
lasso.model$beta
assess.glmnet(lasso.model, newx = current_parameter_set_all, newy = tipped_or_not) # give several statistics

coef(logistic_regression, s="lambda.min", gamma="gamma.min")
print(logistic_regression)

ols.model_logistic <- glm(tipped_or_not ~ p_a_all + p_d_all + p_e_all + log(p_a_all) + log(p_d_all) + log(p_e_all) + log(1 - p_a_all) + log(1-p_d_all) + log(1-p_e_all) + log(N_all/2 - n_c_all) + log(n_c_all + (n_p_all - n_c_all)/2 ) + theta_a_all + theta_d_all + log(theta_a_all) + log(theta_d_all) + log(1 - theta_a_all) + log(1 - theta_d_all) + n_p_all + n_c_all + n_e_all + p_d_all*n_c_all + p_e_all*n_e_all*n_p_all + p_e_all*n_e_all + p_a_all*n_p_all, data=data_array_all, family = binomial)
summary(ols.model_logistic)
ols.model_logistic_logit <- glm(tipped_or_not ~ p_a_all + p_d_all + p_e_all + log(p_a_all) + log(p_d_all) + log(p_e_all) + log(1 - p_a_all) + log(1-p_d_all) + log(1-p_e_all) + logit_p_a_all + logit_p_d_all + logit_p_e_all + log(N_all/2 - n_c_all) + log(n_c_all + (n_p_all - n_c_all)/2 ) + theta_a_all + theta_d_all + log(theta_a_all) + log(theta_d_all) + log(1 - theta_a_all) + log(1 - theta_d_all) + logit_theta_a_all + logit_theta_d_all + n_p_all + n_c_all + n_e_all + p_d_all*n_c_all + p_e_all*n_e_all*n_p_all + p_e_all*n_e_all + p_a_all*n_p_all , data=data_array_all, family = binomial)
summary(ols.model_logistic_logit)

#-------------------------------------------------------------------------------------------------------------
# plot correlations
library(corrplot)     
set.seed(122)

correlations_all <- cor(data_array_all[,c(-12)])
corrplot(correlations_all) 
