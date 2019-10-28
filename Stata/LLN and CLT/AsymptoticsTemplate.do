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

* Generate heads or tails

* Generate number of flips index

* Compute proportion of tails for each n

* Itterate over n
forvalues n = 1/5000 {

		* For each n compute prop. tails

		
}

* Plot proportion of tails as function of flips

** Central Limit Theorem
clear all
set more off
set seed 12345

* Consider X ~ Beta(1.5,5) and N = 100


* Store mean draws

* Let us generate many sample means 
forvalues n_draw = 1/10000 {

	* Generate sample of size N = 500 from population of Beta(2,5)
	
	* Take sample mean and store it in a variable
	
	* Drop sample after storing mean

}

* Plot histogram of means with normal overlayed
* From CLT since N is large sampling distribution of sample mean is normal
