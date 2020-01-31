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
cd('/Users/hammadshaikh/Documents/GitHub/Data-Analysis-Coding-Tutorials/Matlab')
% Print working directory
pwd

%% Defining Vectors and Matrices 

% Vector
a = [1,2,3,4,5,6,7,8] % will print on screen
b = [1,2,3,4,5,6,7,8]; % not print on screen

% transpose
a'

% Size of vector
size(a)
size(a')

% check rows
size(a',1)

% Element wise operation
c = a + b
y = a.^2


% Plot y = x^2
plot(a,y)
scatter(a,y)


% Matrix
A = [1,2,3;4,5,6;7,8,9]
B = [2,3,4;6,7,8;9,0,10]

C = A + B

% Diagonal matrix
D = diag([1,2,3])

%% Vector and Matrix algebra

% Add and subtract
a + b

% Matrix multiplication
A*D

% Matrix inversion
inv(D)

% D*inv(D) = I
D*inv(D)
eye(3)


% Element wise multiplication 
a.*a
a.*c
A.*B


%% Random variables

% Uniform RV (rand)
rand(1) % U[0,1]
rand(1)+1 % U[1,2]

% Uniform random matrix
rand(3)
rand(2,3)

% Uniform random vector
rand(4,1)
unif_draws = rand(1000,1);
hist(unif_draws)

% Normal RV (randn)
randn(1)


% Normal vector
randn(4,1)
norm_draws = randn(1000,1);
hist(norm_draws)

%% Monte Carlo Integration 


% Step 1: Draw many points from U[-3,2]
k = 9001;
unif_draw_k = 5*rand(k,1) - 3;

% Step 2: Compute h(x) = exp((-x^2)/2)
h_k = exp(-(unif_draw_k.^2)/2);

% Step 3: average h(x)
avg_h = mean(h_k)


% Step 4: scaling
int_value = 5*avg_h

%% Linear Regression (OLS)

% Generate data (look at home)
n = 1000;
x_indep1 = rand(n,1);
x_indep2 = rand(n,1);
epsilon = 2.*randn(n,1);

% True data generating process
y_outcome = 2 + 3.*x_indep1 + 5.*x_indep2 + epsilon;

% Estimate slope
% Data = [y, x1, x2]

% OLS
X = [ones(n,1) x_indep1 x_indep2];
beta_ols = inv(X'*X)*X'*y_outcome

% Residuals
e = y_outcome - X*beta_ols;


% Hetroscedastic robust standard errors
var_cov = inv(X'*X)*(X'*diag(e.^2)*X)*inv(X'*X)



%% Instrumental variables (2SLS)
% generating the endogenous variables and the instruments (look at home) 
sigma_IV_gen = [1 0.8 0; 0.8 1 0.6; 0 0.6 1];
mu_IV = [0,0,0];
r = mvnrnd(mu_IV,sigma_IV_gen,n);
epsilon_iv = r(:,1);
x_endog = r(:,2);
z = r(:,3);

y = 3.*x_endog + epsilon_iv;

% Data = [y, x, z]

% Lets do OLS first
X = [ones(n,1) x_endog];
beta_ols = inv(X'*X)*X'*y

% IV next
beta_iv = inv(z'*x_endog)*z'*y


%% Minimization application (MLE)

% MLE
mle_data = [1,1,1,1,1,1,2,2,2,3];

% Render log likelihood as function of theta
loglikeobj = @(theta)loglike(mle_data, theta);


% Minimize negative Log likelihood
[theta_mle, loglike_mle] = fminunc(loglikeobj, 0.1);





