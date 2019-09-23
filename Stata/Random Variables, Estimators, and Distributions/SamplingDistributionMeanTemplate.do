/*

Purpose: Introduce students to random variables, estimators, and sampling distributions.

Date Started: Sept 22, 2019

Notes:


*/

* Setup
clear all
set more off
set seed 12345

* Consider X ~ Beta(1.5,5) and N = 100

* Given N = 100 data points from population suppose we want to estimate mean

* True population mean for beta distribution

* True variance


* Consider multiple samples from population

* Sample means of all three samples

* Let's approximate the sample distribution of the mean
* This requires us to generate many different sample means

* Generate variable for storing the sample means

* Let us generate 100 sample means 

	* Generate sample of size N = 100 from population

	* Take sample mean and store it in a variable
	
	* Drop sample after storing mean


* Distribution of sample means with overlaying normal

* Let us increase sample size to N = 500

* Let us generate 100 sample means (now with N = 100000)

	* Generate sample of size N = 100000 from population
	
	* Take sample mean and store it in a variable
	
	* Drop sample after storing mean


* From CLT since N is large sampling distribution of sample mean is normal
