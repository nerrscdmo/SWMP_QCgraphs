# v2.0.0  

-  Transferred ownership of repository to nerrscdmo  
-  Tagged as official release. Using v2.0.0 because I consider prior versions to be 1.0, even if they weren't officially tagged that way.

## 2026-05 updates  

### Major  

-  MET single file script was removed; looping script can run on a single file.  
-  **Error-proofing** - now the scripts only run on files that match the pattern (met or wq)mmddyy_QC. This means the script will no longer stop if you have multiple file types (met/wq) or other csv files in the directory.     
-  `{rstudioapi}` incorporated so if the user is in RStudio, the pop-up to select the working directory (which folder to work out of) will appear on top of other windows (like we expect things to). If user is not in RStudio IDE, the `{tcltk}` package (base R; original script versions) will be used.
-  MET script - wind rose now uses `{openair}` because `{clifro}` is no longer on CRAN  
-  MET script now accepts either .csv or .dat files as input 


### Minor/not visible to user  

-  used `{styler}` to improve spacing in WQ and MET looping files
-  incorporated use of `file.path()` rather than pasting things together with forward slashes; should make the scripts more robust to the use of different operating systems  
-  in data import step, added `fileEncoding = "latin1"` to make more robust to special characters that may be in headers  