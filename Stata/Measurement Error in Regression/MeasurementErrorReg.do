/*

Purpose: Simulation that demonstrates consequences of classical measurmenet error in regression

Date started: Jan 10, 2020

*/

* Setup 
clear all
set more off
set seed 1234

* Generate data (true data generating process)
set obs 1000
gen x = rnormal(10,2)
gen y = 5 + 10*x + rnormal()

* Generate x with error
gen x_error = x + rnormal()

* Generate y with error
gen y_error = y + rnormal()

* Regression with true data
reg y x

* Regression where y measured with error
reg y_error x

* Regression where x measured with error
reg y x_error


