/*

Purpose: Introduce instrumental variable regression to students. Replicates key results from Card (1995)

Date started: Sept 22, 2019

Primary Inputs:
- Card1995.dta

Primary outputs:

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
gen family_structure = .
replace family_structure = 1 if momdad14 == 1
replace family_structure = 2 if sinmom14 == 1
replace family_structure = 3 if step14  == 1
replace family_structure = 4 if family_structure == .

* Label family structure
label define FamilyStructure 1 "Mom and Dad" 2 "Mom only" 3 "Step parent" 4 "Other"
label values family_structure FamilyStructure



* Family structure distribution and export into word table


* Parent education means

* Relationship between education and wages


* Relationship between education and having college in county


** Simple IV analysis of returns to education with no controls

* OLS wage on education
reg lwage educ

* Indirect effect of college in county on wages
reg lwage nearc4

* Direct effect of college in county on education
reg educ nearc4

* IV estimate returns to education


* Double check with Stata ivreg
ivregress 2sls lwage (educ = nearc4)

* Replication OLS regression results (Table 2)

* IV regression (instrument education with having college in county)


* Indirect effect of having college in county on earning












