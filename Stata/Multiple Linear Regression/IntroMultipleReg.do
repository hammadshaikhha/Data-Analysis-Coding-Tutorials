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
reg wage educ

* Education and earnings regression controlling for parents education
reg wage educ motheduc fatheduc

* Scatter plot of education and earnings
twoway (scatter wage educ) (lfit wage educ), title("Unadjusted") name(EducEarnings, replace)


** Scatter plot of education and earnings adjusting for parents education

* Obtain variation in education independant of parents education
reg educ motheduc fatheduc
predict educ_adjusted, resid

* Adjusted education and earnings regression 
reg wage educ_adjusted

* Scatter plot using adjusted education
sum educ
replace educ_adjusted = educ_adjusted + r(mean)
twoway (scatter wage educ_adjusted) (lfit wage educ_adjusted), title("Adjusted for Parental Education") xtitle("Adjusted Education (added mean education)") name(EducEarningsAdjusted, replace)

* Combine standard and adjusted graphs
graph combine EducEarnings EducEarningsAdjusted, rows(1) cols(2)

* Education and earning regression controlling for several factors
reg wage educ motheduc fatheduc IQ libcrd14 black smsa

** Multiple regression on simulated data
clear

* Data generating process
set obs 1000
gen X = rnormal()
gen Z = 0.5*X + rnormal()
gen eps = rnormal()
gen Y = 5 + 10*X + 5*Z + eps

* Model correctly specified
reg Y X Z

* Ommited variable bias
reg Y X

* Computing OMVB bias E(beta_hat) - beta_true (n = 1000 and k = 10000 simulations)

** program command in Stata
capture program drop omvb_bias 
program omvb_bias, rclass

	* Clear data
	drop _all
	
	* Data generating process
	set obs 1000
	gen X = rnormal()
	gen Z = 0.5*X + rnormal()
	gen eps = rnormal()
	gen Y = 5 + 10*X + 5*Z + eps
	
	* Regression with ommited varianble
	reg Y X
	
	* Compute bias = E(beta_hat) - beta_true 
	return scalar slope_bias = _b[X] - 10
end

* Execute simulation and compute bias
simulate "omvb_bias" bias = r(slope_bias), reps(10000)
sum bias

