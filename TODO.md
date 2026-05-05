1. OK   -  Pattern matching - to make sure scripts only run on the proper files (then can remove lines about the files not being error-proofed, and how only the right kind of files can be in the directory)  
    -  incorporated in WQ loop file, starting line 33
    -  incorporated in MET loop file, line 32
2. OK   -  See if there's a better way to interactively choose a directory nowadays  
    -  rstudioapi - see dev/pattern_matching.R. Incorporated in WQ and MET looping scripts.
3. OK   -  FILE PATHS - e.g. line 45 in WQ QC looping script - don't paste these; use a file path constructor function, because different operating systems work differently
    -  incorporated in WQ script, lines 45 & 51  (input and output files)  
    -  incorporated in MET looping script for both input and output files
4. Might be able to use lubridate to parse date-times, rather than the complex logic I developed way back when. See e.g. lines starting at 57 in WQ looping script.  
    -  see `parse_date_time()` - can specify multiple possible orders (in examples, look at **heterogeneous date-times**)  
    -  looks like I was originally worried about `mdY HM` vs. `Ymd HM`
5. Date-times are using America/Regina time zone! Do something about this?  
    -  .  
6. See if Jeremy or someone will give these a test run once they're updated  
7. Update the big README  
8. I really thought I made a version of this that used the here package and R projects - search for it??  
9. Incorporate PAR graphs in monthly MET stuff??  Might be worth making a github gist or something to source, for time zones/longTZ for PAR models. So it doesn't have to live on people's computers and can be updated as new reserves/stations get added.  
    -  or only include PAR stuff in a shiny app (easier that way)  
10. OK   -  `clifro` is no longer on CRAN. `SWMPr::plot_wind()` calls `{openair}`. Modify wind rose code.  