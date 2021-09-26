set more off

tsset country_id time
*******************
** Set-up of LPs **
*******************

***** LHS variable: the response variable

forvalues i=0/5 {
	
	gen exr`i'	   = (f`i'.lnexr - l.lnexr)
	gen gdp`i'	   = (f`i'.lngdp - l.lngdp)
	gen ifl`i'	   = (f`i'.infl - l.infl)
	gen dor`i'	   = (f`i'.dpr - l.dpr)
	gen ofs`i'	   = (f`i'.of2gdp - l.of2gdp)
	gen ifs`i'	   = (f`i'.if2gdp - l.if2gdp)

}


***** variables to store the impulse response (vector of betas from the LP regressions) and standard errors
gen b_exrmps=.
gen b_gdpmps=.
gen b_iflmps=.
gen b_dormps=.
gen b_ofsmps=.
gen b_ifsmps=.
gen se_exrmps=.
gen se_gdpmps=.
gen se_iflmps=.
gen se_dormps=.
gen se_ofsmps=.
gen se_ifsmps=.

* number of lags
local MaxLPLags 2

* horizon
local horizon 5

* controls in LP regression
local rhsexrmps l(1/`MaxLPLags').og l.infl l.dpr l.lncexr l.cirr2seb l.of2gdp l.if2gdp l.MPshock l.us10
local rhsgdpmps l(1/`MaxLPLags').og l.infl l.dpr l.lncexr l.cirr2seb l.of2gdp l.if2gdp l.MPshock l.us10
local rhsiflmps l(1/`MaxLPLags').og l.infl l.dpr l.lncexr l.cirr2seb l.of2gdp l.if2gdp l.MPshock l.us10
local rhsdormps l(1/`MaxLPLags').og l.infl l.dpr l.lncexr l.cirr2seb l.of2gdp l.if2gdp l.MPshock l.us10
local rhsofsmps l(1/`MaxLPLags').og l.infl l.dpr l.lncexr l.cirr2seb l.of2gdp l.if2gdp l.MPshock l.us10
local rhsifsmps l(1/`MaxLPLags').og l.infl l.dpr l.lncexr l.cirr2seb l.of2gdp l.if2gdp l.MPshock l.us10
					
****************************************************************
*** Baseline LP table Using OLS
****************************************************************

* One regression for each horizon of the response (0-4 years)
forvalues i=0/`horizon' {	
	
	* exr
	xtreg exr`i' MPshock `rhsexrmps', fe vce(cluster country_id)
	eststo ols_exrmps`i'
	replace b_exrmps  = _b[MPshock] if _n == `i'+1
	replace se_exrmps = _se[MPshock] if _n == `i'+1
	
	
	xtreg gdp`i' MPshock `rhsexrmps', fe vce(cluster country_id)
	eststo ols_gdpmps`i'			
	replace b_gdpmps  = _b[MPshock] if _n == `i'+1
	replace se_gdpmps = _se[MPshock] if _n == `i'+1

	
	xtreg ifl`i' MPshock `rhsexrmps', fe vce(cluster country_id)
	eststo ols_iflmps`i'
	replace b_iflmps  = _b[MPshock] if _n == `i'+1
	replace se_iflmps = _se[MPshock] if _n == `i'+1	
	
	
	xtreg dor`i' MPshock `rhsexrmps', fe vce(cluster country_id)
	eststo ols_dormps`i'				
	replace b_dormps  = _b[MPshock] if _n == `i'+1
	replace se_dormps = _se[MPshock] if _n == `i'+1
	
	
	xtreg ofs`i' MPshock `rhsexrmps', fe vce(cluster country_id)
	eststo ols_ofsmps`i'			
	replace b_ofsmps  = _b[MPshock] if _n == `i'+1
	replace se_ofsmps = _se[MPshock] if _n == `i'+1
	
	
	xtreg ifs`i' MPshock `rhsexrmps', fe vce(cluster country_id)
	eststo ifs_ifsmps`i'			
	replace b_ifsmps  = _b[MPshock] if _n == `i'+1
	replace se_ifsmps = _se[MPshock] if _n == `i'+1
			
			}



* labels for MORTGDP path tables
label var exr0 "Year 0"
label var exr1 "Year 1"
label var exr2 "Year 2"
label var exr3 "Year 3"
label var exr4 "Year 4"
label var exr5 "Year 5"

*esttab ols_exrmps0 ols_exrmps1 ols_exrmps2 ols_exrmps3 ols_exrmps4 ols_exrmps5 using table_ols_exrmps.tex , page replace title("exrmps LP") se r2 keep(exrmps) nonum b(2) se(2) sfmt(2) obslast  label star(* 0.10 ** 0.05 *** 0.01)
	
eststo clear

****************************************************************
*** Baseline OLS LP graphs
****************************************************************


gen Years = _n-1 if _n <= `horizon' +1

local texr 

* zero line
gen zero = 0 if _n <= `horizon' +1

***** create confidence bands (in this case 90 and 95%) ****
	scalar sig1 = 0.05	 // specify significance level
	scalar sig2 = 0.3	 // specify significance level

	gen up_exrmps  = b_exrmps + invnormal(1-sig1/2)*se_exrmps  if _n <= (`horizon' + 1)
	gen dn_exrmps  = b_exrmps - invnormal(1-sig1/2)*se_exrmps  if _n <= (`horizon' + 1)
	gen up2_exrmps = b_exrmps + invnormal(1-sig2/2)*se_exrmps if _n <= (`horizon' + 1)
	gen dn2_exrmps = b_exrmps - invnormal(1-sig2/2)*se_exrmps if _n <= (`horizon' + 1)

	gen up_gdpmps  = b_gdpmps + invnormal(1-sig1/2)*se_gdpmps  if _n <= (`horizon' + 1)
	gen dn_gdpmps  = b_gdpmps - invnormal(1-sig1/2)*se_gdpmps  if _n <= (`horizon' + 1)
	gen up2_gdpmps = b_gdpmps + invnormal(1-sig2/2)*se_gdpmps if _n <= (`horizon' + 1)
	gen dn2_gdpmps = b_gdpmps - invnormal(1-sig2/2)*se_gdpmps if _n <= (`horizon' + 1)
	
	gen up_iflmps  = b_iflmps + invnormal(1-sig1/2)*se_iflmps  if _n <= (`horizon' + 1)
	gen dn_iflmps  = b_iflmps - invnormal(1-sig1/2)*se_iflmps  if _n <= (`horizon' + 1)
	gen up2_iflmps = b_iflmps + invnormal(1-sig2/2)*se_iflmps if _n <= (`horizon' + 1)
	gen dn2_iflmps = b_iflmps - invnormal(1-sig2/2)*se_iflmps if _n <= (`horizon' + 1)
	
	gen up_dormps  = b_dormps + invnormal(1-sig1/2)*se_dormps  if _n <= (`horizon' + 1)
	gen dn_dormps  = b_dormps - invnormal(1-sig1/2)*se_dormps  if _n <= (`horizon' + 1)
	gen up2_dormps = b_dormps + invnormal(1-sig2/2)*se_dormps if _n <= (`horizon' + 1)
	gen dn2_dormps = b_dormps - invnormal(1-sig2/2)*se_dormps if _n <= (`horizon' + 1)
	
	gen up_ofsmps  = b_ofsmps + invnormal(1-sig1/2)*se_ofsmps  if _n <= (`horizon' + 1)
	gen dn_ofsmps  = b_ofsmps - invnormal(1-sig1/2)*se_ofsmps  if _n <= (`horizon' + 1)
	gen up2_ofsmps = b_ofsmps + invnormal(1-sig2/2)*se_ofsmps if _n <= (`horizon' + 1)
	gen dn2_ofsmps = b_ofsmps - invnormal(1-sig2/2)*se_ofsmps if _n <= (`horizon' + 1)
	
	gen up_ifsmps  = b_ifsmps + invnormal(1-sig1/2)*se_ifsmps  if _n <= (`horizon' + 1)
	gen dn_ifsmps  = b_ifsmps - invnormal(1-sig1/2)*se_ifsmps  if _n <= (`horizon' + 1)
	gen up2_ifsmps = b_ifsmps + invnormal(1-sig2/2)*se_ifsmps if _n <= (`horizon' + 1)
	gen dn2_ifsmps = b_ifsmps - invnormal(1-sig2/2)*se_ifsmps if _n <= (`horizon' + 1)
* label parameters for Y-axis
/*
local lmortgdp -2
local hmortgdp 2
local cmortgdp 0.2

local ltgdp -2
local htgdp 2
local ctgdp 0.2
*/

************************ OLS version **************************************
	twoway (rarea up_gdpmps dn_gdpmps Years, ///
	fcolor(gs12) lcolor(white) lpattern(solid)) ///
	(rarea up2_gdpmps dn2_gdpmps  Years, ///
	fcolor(gs10) lcolor(white) lpattern(solid)) ///
	(line b_gdpmps Years, lcolor(blue) ///
	lpattern(solid) lwidth(thick)) /// 
	(line zero Years, lcolor(black)), ///
	title("`Log real GDP'", color(black) size(medium)) ///
	ytitle("Percent", size(medsmall)) xtitle("Year", size(medsmall)) ///
	graphregion(color(white)) plotregion(color(white)) ///
	legend(off) name(gdpmps, replace)
	graph save   gdpmps.gph, replace

	twoway (rarea up_exrmps dn_exrmps Years, ///
	fcolor(gs12) lcolor(white) lpattern(solid)) ///
	(rarea up2_exrmps dn2_exrmps  Years, ///
	fcolor(gs10) lcolor(white) lpattern(solid)) ///
	(line b_exrmps Years, lcolor(blue) ///
	lpattern(solid) lwidth(thick)) /// 
	(line zero Years, lcolor(black)), ///
	title("`Log exchange rate against USD'", color(black) size(medium)) ///
	ytitle("Percent", size(medsmall)) xtitle("Year", size(medsmall)) ///
	graphregion(color(white)) plotregion(color(white)) ///
	legend(off) name(exrmps, replace)
	graph save   exrmps.gph, replace

	twoway (rarea up_iflmps dn_iflmps Years, ///
	fcolor(gs12) lcolor(white) lpattern(solid)) ///
	(rarea up2_iflmps dn2_iflmps  Years, ///
	fcolor(gs10) lcolor(white) lpattern(solid)) ///
	(line b_iflmps Years, lcolor(blue) ///
	lpattern(solid) lwidth(thick)) /// 
	(line zero Years, lcolor(black)), ///
	title("`Inflation rate'", color(black) size(medium)) ///
	ytitle("Percent", size(medsmall)) xtitle("Year", size(medsmall)) ///
	graphregion(color(white)) plotregion(color(white)) ///
	legend(off) name(iflmps, replace)
	graph save   iflmps.gph, replace
	
	twoway (rarea up_dormps dn_dormps Years, ///
	fcolor(gs12) lcolor(white) lpattern(solid)) ///
	(rarea up2_dormps dn2_dormps  Years, ///
	fcolor(gs10) lcolor(white) lpattern(solid)) ///
	(line b_dormps Years, lcolor(blue) ///
	lpattern(solid) lwidth(thick)) /// 
	(line zero Years, lcolor(black)), ///
	title("`Domestic policy rate'", color(black) size(medium)) ///
	ytitle("Percent", size(medsmall)) xtitle("Year", size(medsmall)) ///
	graphregion(color(white)) plotregion(color(white)) ///
	legend(off) name(dormps, replace)
	graph save   dormps.gph, replace

	twoway (rarea up_ifsmps dn_ifsmps Years, ///
	fcolor(gs12) lcolor(white) lpattern(solid)) ///
	(rarea up2_ifsmps dn2_ifsmps  Years, ///
	fcolor(gs10) lcolor(white) lpattern(solid)) ///
	(line b_ifsmps Years, lcolor(blue) ///
	lpattern(solid) lwidth(thick)) /// 
	(line zero Years, lcolor(black)), ///
	title("`Portfolio debt inflow/GDP'", color(black) size(medium)) ///
	ytitle("Percent", size(medsmall)) xtitle("Year", size(medsmall)) ///
	graphregion(color(white)) plotregion(color(white)) ///
	legend(off) name(ifsmps, replace)
	graph save   ifsmps.gph, replace
	
	twoway (rarea up_ofsmps dn_ofsmps Years, ///
	fcolor(gs12) lcolor(white) lpattern(solid)) ///
	(rarea up2_ofsmps dn2_ofsmps  Years, ///
	fcolor(gs10) lcolor(white) lpattern(solid)) ///
	(line b_ofsmps Years, lcolor(blue) ///
	lpattern(solid) lwidth(thick)) /// 
	(line zero Years, lcolor(black)), ///
	title("`Portfolio debt outflow/GDP'", color(black) size(medium)) ///
	ytitle("Percent", size(medsmall)) xtitle("Year", size(medsmall)) ///
	graphregion(color(white)) plotregion(color(white)) ///
	legend(off) name(ofsmps, replace)
	graph save   ofsmps.gph, replace



*	ylabel(`lmortgdp'(`cmortgdp')`hmortgdp', nogrid) ///
	
graph combine exrmps.gph gdpmps.gph iflmps.gph dormps.gph ofsmps.gph ifsmps.gph, col(3) iscale(1) ///
	title("EME irf to US MPshcok")
	graph save EME_MP.gph, replace
	
