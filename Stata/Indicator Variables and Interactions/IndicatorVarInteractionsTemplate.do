/*

Date started: November 3, 2019

Purpose: Introduce indicator variables and interaction terms to students.

Primary Inputs:
- Card1995.dta

Notes:

*/

* Set up
clear all
set more off
cd "/Users/hammadshaikh/Documents/GitHub/Data-Analysis-Coding-Tutorials/Stata/Indicator Variables and Interactions"

* Open data set
use "Card1995.dta", clear

* Above median education
gen educ_above_median = educ > 12

* Convert wage to dollars
replace wage = wage/100

* Earnings and education



* Returns to education by race
* wage = b0 + b1*I(educ above median) + b2*I(black) + b3*I(educ above median)*I(black)


* Alternate specification for returns to education by race


* wage = a1*I(educ above median)*I(black) + a2*I(educ above median)*I(white) + a3*I(black) + a4*I(white)


* Regression with multiple levels of a dummy variable (family structure)
