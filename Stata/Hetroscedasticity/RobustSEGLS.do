/*

Date started: November 10, 2019

Purpose: Introduce robust standard errors and generalized least squares

Notes:

*/

* Set up
clear all
set more off

** Data Generate Process (DGP)

* Sample size
set obs 1000

* Y = 5 + 10X1 + U, V(U) = 4*X1^2
gen X1 = rnormal()
gen U = 2*X1*rnormal()
gen Y = 5 + 10*X1 + U

** How to store p-values from reg (for assignment 2)
* Method 1: computing using t-stat and t-dbn
reg Y X1
disp round(2 * ttail(e(df_r), abs(_b[X1]/_se[X1])),0.0001)

* Method 2: test in stata (suggested by Srishti)
reg Y X1
test X1
disp r(p)

* Visual test for hetroscedasticity 
twoway (scatter Y X)


* Estimate Y = B0 + B1*X1 + epsilon under homoscedastic
reg Y X1

* Estimate Y = B0 + B1*X1 + epsilon with robust SE
reg Y X1, robust

* Estimate Y = B0 + B1*X1 + epsilon with GLS
gen int_gls = 1/(X1)
gen Y_gls = Y*int_gls

* Estimate Y_tilde = B0*X0 + B1
reg Y_gls int_gls

