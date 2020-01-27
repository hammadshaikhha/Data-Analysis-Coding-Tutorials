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
reg wage educ_above_median

* Returns to education by race
* wage = b0 + b1*I(educ above median) + b2*I(black) + b3*I(educ above median)*I(black)
gen educ_above_median_black = educ_above_median*black
reg wage educ_above_median black educ_above_median_black

* Alternate specification for returns to education by race
gen white = 1 - black
gen educ_above_median_white = educ_above_median*white

* wage = b0 + b1*I(educ above median)*I(black) + b2*I(educ above median)*I(white) + b3*I(black) + b4*I(white)
reg wage educ_above_median_black educ_above_median_white black white, nocons

* Regression with multiple levels of a dummy variable (family structure)
reg wage momdad14 sinmom14 step14

