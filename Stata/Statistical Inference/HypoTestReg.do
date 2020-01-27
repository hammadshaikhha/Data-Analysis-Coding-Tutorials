/*

Date started: October 19, 2019

Purpose: Introducing Hypothesis testing in a regression setting.

Primary Inputs:
- Card1995.dta

Notes:

*/

* Set up
clear all
set more off
cd "/Users/hammadshaikh/Documents/GitHub/Data-Analysis-Coding-Tutorials/Stata/Statistical Inference"

** Multiple regression on real data

* Open data set
use "Card1995.dta", clear

* Multiple regression for returns to education
reg wage educ motheduc IQ libcrd14 black smsa

* H0: libcrd14 = motheduc
test libcrd14 = motheduc

* H0: educ = IQ
test educ = IQ

* H0: educ = IQ
test educ = 50*IQ

* H0: educ = motheduc = IQ = 0
test educ IQ black 






