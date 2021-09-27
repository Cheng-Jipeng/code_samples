# Code Samples
The sample codes include the scripts developed by me (Jipeng Cheng) in my previous experience to demonstrate my programming ability.

## 1. Mathematica
The nb files create the graphs for the simulation section in my writing sample, which shows how the variables of interest respond to trade cost shock in the trade model. To run the codes, please first open ‘AutGraph.nb’ and set the working directory correctly in the first line. Then just run the code cell by cell. If you want as clear graphs as in the writing sample, please open ‘ResSum.nb’ and run it cell by cell.

## 2. MATLAB
The codes replicate Fig 5.3 in Bilbiie et al. (2008), which shows how the economy responds to monetary policy shocks in the DSGE model. To run the codes, please set the correct working directory in MATLAB and then run ‘Fig_5_3.m’.
> Reference:
> Monetary Policy and Business Cycles with Endogenous Entry and Product Variety, Florin O. Bilbiie, Fabio Ghironi, Marc J. Melitz. in NBER Macroeconomics Annual 2007, Volume 22, Acemoglu, Rogoff, and Woodford. 2008

## 3. Python (based on Jupyter Lab)
The codes present a mixed back-testing framework for gamma scalping in China option markets. The strategy tries to go long on volatility based on volatility timing by gamma scaling with long straddles consisting of nearby stock options and stocks. The back-testing starts with 1 million RMBs and reports the final value of the portfolio. The file ‘data_prep_opt.ipynb’ does data cleaning work and creates the dataset ‘daily_option_preopen.csv’ from an API of some financial data provider. The file ‘Option_data.ipynb’ actually does the back-testing with the created dataset, whose cells without regard to the API are executable (remember to set your working directory in Jupyter Lab by hand or by extra codes). (These files rely on the API to get raw data, so it is better to just look at the codes.)

## 4. Stata
The codes report the impulse response functions that describe how the macroeconomic variables in Argentina and 15 other developing countries respond to the US monetary policy shocks by local projections. Please set your directory in Stata and run the do file ‘EME_irf_MP’.
