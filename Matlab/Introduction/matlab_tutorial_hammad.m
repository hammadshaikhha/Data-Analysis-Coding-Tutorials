%{

Always start .m file with a descriptive header as shown below. This header will
keep your .m files organized, you can update it over time.

Purpose: Introduce Matlab to MA and PhD students. 

Date Started: January 30, 2019

Last updated: 
- Include major code updates

Primary input:
- Include name(s) of they key input files

Primary output:
- Include name(s) of output file this code will produce

Extra Notes:
- Include notes about data as you conduct your analysis. For example  you may discover
a certain variable may have too many missing values. 
- Keep track of problems e.g. fminunc wont coverge.

%}

% Basic setup
clear
% Set folder directory
cd('/Users/hammadshaikh/Documents/GitHub/Data-Analysis-Coding-Tutorials/Matlab/Introduction/') 

%% Vector and Matrix 

% Vector
x = [1,2,3,4,5,6,7,8,9,10] % will print on screen
x = [1,2,3,4,5,6,7,8,9,10]; % not print on screen
x_trans = x'; % transpose

% Size of vector
size(x)
size(x,1) % check rows
size(x')

% Element wise operation
y = x.^2;

% Plot y = x^2
plot(x,y);
title("This is y = x^2")
xlabel("Bunch of x-values")
ylabel("Corresponding y-values")

% Matrix
X = [1,2,3; 4,5,6 ; 6,7,8];
I = eye(3);
D = diag([1,2,3]);
I2 = 2*I;

%% Vector and Matrix algebra

% Add and subtract
x_add_scalar = x + 5;
x_add_y = x + y;
X_add_eye = X + I;

% Matrix multiplication
X_times_I = X*I;

% Matrix inversion
I_inv = inv(I);
I2_inv = inv(I2);

% Element wise multiplication 
a = [1,2,3]';
X_times_a = X*a;
X_elem_times_a = X.*a;
X_elem_times_X = X.*X;

%% Random variables

% Uniform
uni_draw = rand(1);
uni_draw_range = 2 + rand(1);
uni_draw_n = rand(5,1);

% Normal
norm_draw = randn(1);
norm_draw_mult = mvnrnd([1;2], eye(2), 1);


%% Monte Carlo Integration 

% Step 1: Draw many points from U[-3,2]
k = 9001;
uni_draws_k = -3 + 5*rand(k,1);

% Step 2: Compute h(x) = exp((-x^2)/2)
func_eval_draws = exp((-uni_draws_k.^2)/2);
func_eval_draws_mean = mean(func_eval_draws);
integ_val = 5*func_eval_draws_mean;

%% Linear Regression (OLS)

% Generate data (look at home)
n = 1000;
x_indep1 = rand(n,1);
x_indep2 = rand(n,1);
epsilon = 2.*randn(n,1);
y_outcome = 2 + 3.*x_indep1 + 5.*x_indep2 + epsilon;

% Estimate slope
X_design = [ones(n,1), x_indep1, x_indep2];
beta_ols = inv(X_design'*X_design)*(X_design'*y_outcome);

% Generate residuals
e = y_outcome - X_design*beta_ols;

% Hetro. robust cov-matrix
V_robust = inv(X_design'*X_design)*(X_design'*diag(e.^2)*X_design)*inv(X_design'*X_design);

%% Instrumental variables (2SLS)
% generating the endogenous variables and the instruments 
sigma_IV_gen = [1 0.8 0; 0.8 1 0.6; 0 0.6 1];
mu_IV = [0,0,0];
r = mvnrnd(mu_IV,sigma_IV_gen,n);
epsilon_iv = r(:,1);
x_endog = r(:,2);
z = r(:,3);

y = 3.*x_endog + epsilon_iv;

% OLS estimation will be biased
beta_ols_endog = inv(x_endog'*x_endog)*(x_endog'*y);

% IV estimation to correct for endogenity
beta_iv_2sls = inv(z'*x_endog)*(z'*y);

%% Minimization

% MLE
mle_data = [1,1,1,1,1,1,2,2,2,3];

% Render log likelihood as function of theta
loglikeobj = @(theta)loglike(mle_data, theta);
loglikeobj(0.2)


% Log likelihood
[theta_mle, loglike_mle] = fminunc(loglikeobj, 0.9)





