/*

Purpose: Introduce students to law of large numbers and central limit theorem. Go over consistency.

Date Started: October 27, 2019

Notes:


*/

* Setup
clear all
set more off
set seed 12345

** Law of Large Numbers
set obs 5000

* Generate heads or tails
generate tails = uniform() > 0.5

* Generate number of flips index
gen flips = _n

* Compute proportion of tails for each n
gen prop_tails_n = .

* Itterate over n
forvalues n = 1/5000 {

		* For each n compute prop. tails
		qui sum tails if _n <= `n'
		replace prop_tails_n = r(mean) in `n' 
}

* Plot proportion of tails as function of flips
twoway (scatter prop_tails_n flips), ytitle("Proportion of Tails") xtitle("Number of Flips") yline(0.5)

** Central Limit Theorem
clear all
set more off
set seed 12345

* Consider X ~ Beta(1.5,5) and N = 100
set obs 10000
gen X = rbeta(1.5,5)
hist X, title("Distribution of X")

* Store mean draws
gen mean_draws = .

* Let us generate many sample means 
forvalues n_draw = 1/10000 {

	* Generate sample of size N = 500 from population of Beta(2,5)
	gen draw_sample = rbeta(2,5)
	
	* Take sample mean and store it in a variable
	qui sum draw_sample
	replace mean_draws = r(mean) in `n_draw'
	
	* Drop sample after storing mean
	drop draw_sample

}

* Plot histogram of means with normal overlayed
* From CLT since N is large sampling distribution of sample mean is normal
hist mean_draws, title("Sampling distribution of sample mean (N = 10000)") normal


