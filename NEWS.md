## 2026-05 updates  

-  removed MET single file script. Looping script can run on a single file
-  updated README 
-  used `{styler}` to improve spacing in WQ and MET looping files

### MET looping script  

-  wind rose updated to use `{openair}` because `{clifro}` is no longer on CRAN  
-  can use .csv or .dat files as input  


### MET and WQ looping scripts
-  now only runs on files that match the pattern (met|wq)000000_QC  
-  updated to use `rstudioapi`, meaning that if the user is in RStudio, the pop-up to select which folder to work out of will appear on top of other windows (like we expect things to)  
-  incorporated use of `file.path()` rather than pasting things together with forward slashes; should make the scripts more robust to the use of different operating systems  
-  in data import step, added `fileEncoding = "latin1"` to make more robust to special characters that may be in headers  