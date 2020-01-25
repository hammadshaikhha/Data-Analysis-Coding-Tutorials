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


* Visual test for hetroscedasticity 
twoway (scatter Y X1)


* Estimate Y = B0 + B1*X1 + epsilon under homoscedastic
reg Y X1



* Estimate Y = B0 + B1*X1 + epsilon with robust SE
reg Y X1, robust


* Estimate Y = B0 + B1*X1 + epsilon with GLS

