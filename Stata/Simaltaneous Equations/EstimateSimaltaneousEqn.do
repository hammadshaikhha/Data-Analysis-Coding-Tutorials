/*

Purpose: Show example of simaltaneouty bias and correct through instruments

Date started: Thurs, Jan 21, 2021

*/

* Setup
clear all
set more off
cd "/Users/hammadshaikh/Documents/GitHub/Data-Analysis-Coding-Tutorials/Stata/Simaltaneous Equations"

* Open data
use MROZ.dta

* OLS labour supply regression
reg hours lwage educ age kidslt6 nwifeinc

* OLS wage setting equations
reg lwage hours educ exper expersq

* IV labour supply regression 
ivregress 2sls hours educ age kidslt6 nwifein (lwage = exper expersq)

* IV wage setting equation
ivregress 2sls lwage educ exper expersq (hours = age kidslt6 nwifein)

* IV labour supply regression with endogenous education
ivregress 2sls hours age kidslt6 nwifein (lwage educ = exper expersq motheduc fatheduc)

