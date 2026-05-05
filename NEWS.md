## 2026-05 updates  

### Major  

-  removed MET single file script. Looping script can run on a single file  
-  **Error-proofing** - now the scripts only run on files that match the pattern (met or wq)mmddyy_QC. This means the script will no longer stop if you have multiple file types (met/wq) or other csv files in the directory.     
-  updated to use `rstudioapi`, meaning that if the user is in RStudio, the pop-up to select which folder to work out of will appear on top of other windows (like we expect things to).
-  MET script - wind rose updated to use `{openair}` because `{clifro}` is no longer on CRAN  
-  MET script - can use .csv or .dat files as input 


### Minor/not visible to user  

-  used `{styler}` to improve spacing in WQ and MET looping files
-  incorporated use of `file.path()` rather than pasting things together with forward slashes; should make the scripts more robust to the use of different operating systems  
-  in data import step, added `fileEncoding = "latin1"` to make more robust to special characters that may be in headers  