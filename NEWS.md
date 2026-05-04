## 2026-05-04 updates  

### WQ looping script  

-  now only runs on files that match the pattern wq000000_QC  
-  updated to use `rstudioapi`, meaning that if the user is in RStudio, the pop-up to select which folder to work out of will appear on top of other windows (like we expect things to)  
-  incorporated use of `file.path()` rather than pasting things together with forward slashes; should make the scripts more robust to the use of different operating systems  
-  in data import step, added `fileEncoding = "latin1"` to make more robust to special characters that may be in headers  
