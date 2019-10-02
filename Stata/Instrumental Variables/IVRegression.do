/*

Purpose: Introduce instrumental variable regression to students. Replicates key results from Card (1995)

Date started: Sept 22, 2019

Primary Inputs:
- Card1995.dta

Notes:
- Data set only contains those with valid education and wages. 


*/

* Set up
clear all
set more off
cd "/Users/hammadshaikh/Documents/GitHub/Data-Analysis-Coding-Tutorials/Stata/Instrumental Variables"

* Open data set
use "Card1995.dta", clear

** Replicating some summary statistics (Table 1)

* Family structure  
gen family_structure = 0 if momdad14 == 1
replace family_structure = 1 if sinmom14 == 1
replace family_structure = 2 if step14 == 1
replace family_structure = 3 if family_structure == .

* Label family structure
label define FamilyStructure 0 "Mom and Dad" 1 "Mom only" 2 "Step parent" 3 "Other"
label values family_structure FamilyStructure

* Family structure distribution and export into word table
tab family_structure
asdoc tab family_structure, replace

* Parent education mean
tabstat fatheduc motheduc, stat(mean)

* Relationship between education and wages
twoway (scatter wage educ, mcolor(black) msymbol(circle_hollow) mlwidth(thin)) (lfit wage educ), ///
xtitle("Years of Education", size(med)) ytitle("Hourly Salary (Dollars)", size(med) height(5)) title("Earnings and Education") graphregion(color(white))

* Relationship between education and having college in county
label define CountyCollege 0 "No 4 Yr College in County" 1 "Have 4 Yr College in County"
label values nearc4 CountyCollege
reg educ nearc4
local pval = round(2 * ttail(e(df_r), abs(_b[nearc4]/_se[nearc4])),0.0001)
cibar educ, over1(nearc4) graphopts(title("Education and College in County") subtitle("P-value of mean difference = `pval'") graphregion(color(white)))


** Simple IV analysis of returns to education with no controls

* OLS wage on education
reg lwage educ

* Indirect effect of college in county on wages
reg lwage nearc4 
scalar total_effect = _b[nearc4]

* Direct effect of college in county on education
reg educ nearc4
scalar first_stage = _b[nearc4]

* IV estimate returns to education
display total_effect/first_stage

* Double check with Stata ivreg
ivregress 2sls lwage (educ=nearc4)


** Replicate mean education by quartiles of predicted education (Figure 1) 

* Replication OLS regression results (Table 2)
reg lwage educ exper expersq black south smsa
reg lwage educ exper expersq black south smsa reg662-reg669 smsa66 fatheduc motheduc momdad14 sinmom14

* IV regression (instrument education with having college in county)
ivregress 2sls lwage (educ=nearc4) exper black south married smsa, first

* Indirect effect of having college in county on earning
reg lwage nearc4 educ exper expersq black south smsa

