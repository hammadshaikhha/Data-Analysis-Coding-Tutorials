/*

Date started: October 6, 2019

Purpose: Intorduce multiple regressions to students.

Primary Inputs:
- Card1995.dta

Notes:

*/

* Set up
clear all
set more off
cd "/Users/hammadshaikh/Documents/GitHub/Data-Analysis-Coding-Tutorials/Stata/Multiple Linear Regression"

** Multiple regression on real data

* Open data set
use "Card1995.dta", clear

* Education and earning regression

* Education and earnings regression controlling for parents education


* Scatter plot of education and earnings


** Scatter plot of education and earnings adjusting for parents education

* Obtain variation in education independant of parents education


* Adjusted education and earnings regression 

* Scatter plot using adjusted education


* Combine standard and adjusted graphs

* Education and earning regression controlling for several factors

** Multiple regression on simulated data
clear

* Data generating process
set obs 1000
gen X = rnormal()
gen Z = 0.5*X + rnormal()
gen eps = rnormal()
gen Y = 5 + 10*X + 5*Z + eps

* Model correctly specified

* Ommited variable bias

* Computing OMVB bias E(beta_hat) - beta_true (n = 1000 and k = 10000 simulations)

** program command in Stata


	* Clear data
	

	* Data generating process
	
	
	* Regression with ommited varianble
	
	
	* Compute bias = E(beta_hat) - beta_true 
	
	

* Execute simulation and compute bias




