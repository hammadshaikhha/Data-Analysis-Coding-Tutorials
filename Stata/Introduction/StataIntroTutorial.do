/*

Always start do file with a descriptive header as shown below. This header will
keep your .do files organized, you can update it over time.

Purpose: Introduce Stata to students. 

Date Started: September 6, 2018

Last updated: 
- Sept 18, 2018 included duplicate entrie examples
- Sept 14, 2019 added tabstat

Primary input:
- Include name(s) of they key input files
- WageTenureData.dta

Primary output:
- Include name(s) of output file this code will produce
- logfiletut.log

Extra Notes:
- Include notes about data as you conduct your analysis. For example  you may discover
a certain variable may have too many missing values.

*/


** Standard setup
* clear stata memory
clear all 
* load all output without pausing
set more off
* set directory (change this to your own directory where data is saved)
cd "/Users/hammadshaikh/Documents/GitHub/Data-Analysis-Coding-Tutorials/Stata/Introduction"

* Load data (cross-sectional)
use "WageTenureData.dta"

* Start log file 
log using logfiletut.log, replace 
* Stata Markup and Control Language (smcl)
* log using logfiletut.smcl, replace 

* Take a look at the data set
browse
describe

* Summary statistics
sum educ
sum wage exper tenure

* More detailed summary statistic
sum wage, detail

* Choose certain summary statistics
tabstat wage, stat(mean median max N)

* Distribution of wages
hist wage

* Wage right skewed, consider log(wage)
gen logwage = log(wage)
hist logwage

* Drop variable
drop logwage

* Look for Stata documentation
help summarize 

* Store mean wage
sum educ
scalar mean_educ = r(mean)

* Above average educ (dummy variable)
gen AboveAvgEduc = 0
replace AboveAvgEduc = 1 if educ > mean_educ

* Frequency tabulation
tab educ
tab AboveAvgEduc

* Summary statistics by education
tabstat wage, stat(mean median max N) by(AboveAvgEduc)

* Bar plot of wages across low and highly educated workers
label define EducCategory 0 "Below Average Education" 1 "Above Average Education"
label values AboveAvgEduc EducCategory
graph bar (mean) wage, over(AboveAvgEduc) blabel(bar, size(medium))

** egen applied functions to entire variable (gen is only each entry)
* Median wage 
egen MedianWage = median(wage)

* Scatter plot (educ, wage)
twoway (scatter wage educ)

* Mean wage by education
egen MeanWageEduc = mean(wage), by(educ)
twoway (scatter wage educ) (line MeanWageEduc educ, sort)

* Label variables
label var MeanWageEduc "Hourly Salary by Education"

* Scatter plot (educ, wage) with linear fit with good aesthetics and export as PDF
twoway (scatter wage educ, mcolor(black) msymbol(circle_hollow) mlwidth(thin)) (line MeanWageEduc educ, sort lwidth(medthick) lcolor(midblue)) (lfit wage educ, lcolor(midgreen)), xtitle("Years of Education", size(med)) ytitle("Hourly Salary (Dollars)", size(med) height(5)) title("Earnings and Education") graphregion(color(white))
graph export EarningsEducReg.pdf, replace

* Regression analysis
regress wage educ

* Export tables in word
ssc install asdoc
asdoc regress wage educ, save(WageEduc)

* Import new data set (time series)
use "WeightFoodExcercise.dta", clear

* Look at weight and waist size over days
twoway (scatter WeightPoundsMorning Date, yaxis(1) msymbol(circle_hollow)) (scatter WaistSizeMorning Date, yaxis(2) msymbol(circle_hollow)), xtitle("Dates (Day, Month, Year)", size(med)) title("Weight and Waist Size Over Time") graphregion(color(white))
graph export WeightWaistOverTime.pdf, replace

* End log file  
log close
