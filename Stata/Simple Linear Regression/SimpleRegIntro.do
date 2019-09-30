/*

Purpose: Introduce regression analysis.

Date Started: August 7, 2019

Last updated: 
- Include major code updates

Primary input:
- Card1995.dta

Extra Notes:

*/

* clear stata memory
clear all 
set more off
cd "/Users/hammadshaikh/Documents/GitHub/Data-Analysis-Coding-Tutorials/Stata/Simple Linear Regression"

* Load data
use Card1995.dta, replace

* Summary statistics (mean, var, number of obs, min, max)
sum nearc4 educ age black wage married 

* Scatter plot (educ, wage)
twoway (scatter wage educ)

* Conditional expectation function between wage and education
egen MeanWageEduc = mean(wage), by(educ)
twoway (scatter wage educ) (line MeanWageEduc educ, sort)

* Regression is linear approximation of CEF
twoway (scatter wage educ) (lfit wage educ) (line MeanWageEduc educ, sort)

* Binned scatter plot
ssc install binscatter
binscatter wage educ

* Outcomes distributions
hist wage
hist lwage

* Regression analysis on returns to education
reg wage educ

* Relationship between education and having college in county
reg educ nearc4

* Relationship between earnings and having college in county
reg wage nearc4

* Relationship between education and parent education
reg educ motheduc

* Relationship between earnings and parent education
reg wage motheduc
