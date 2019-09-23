/*

Purpose: Introduce students to random variables, estimators, and sampling distributions.

Date Started: Sept 22, 2019

Notes:


*/

* Setup
clear all
set more off
set seed 12345

* Consider X ~ Beta(1.5,5) and N = 100
set obs 100
gen X = rbeta(1.5,5)
hist X, title("Distribution of X")

* Given N = 100 data points from population suppose we want to estimate mean
sum X

* True population mean for beta distribution
disp 2/(2+5)

* True variance
disp (2*5)/(((2+5)^2)*(2+5+1))

* Consider multiple samples from population
gen Y = rbeta(2,5)
gen Z = rbeta(2,5)

* Sample means of all three samples
sum X Y Z

* Let's approximate the sample distribution of the mean
* This requires us to generate many different sample means

* Generate variable for storing the sample means
gen mean_draws = .

* Let us generate 100 sample means 
forvalues n_draw = 1/100 {

	* Generate sample of size N = 100 from population
	gen draw_sample = rbeta(2,5)
	
	* Take sample mean and store it in a variable
	qui sum draw_sample
	replace mean_draws = r(mean) in `n_draw'
	
	* Drop sample after storing mean
	drop draw_sample

}

* Distribution of sample means with overlaying normal
hist mean_draws, title("Sampling distribution of sample mean (N = 100)") normal

* Let us increase sample size to N = 10000
set seed 12345
set obs 100000
gen mean_draws_large = .

* Let us generate 100 sample means (now with N = 100000)
forvalues n_draw = 1/100 {

	* Generate sample of size N = 500 from population
	gen draw_sample = rbeta(2,5)
	
	* Take sample mean and store it in a variable
	qui sum draw_sample
	replace mean_draws_large = r(mean) in `n_draw'
	
	* Drop sample after storing mean
	drop draw_sample

}

* From CLT since N is large sampling distribution of sample mean is normal
hist mean_draws_large, title("Sampling distribution of sample mean (N = 100000)") normal

* Mean and standard error
sum mean_draws_large








