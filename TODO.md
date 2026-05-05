1. Might be able to use lubridate to parse date-times, rather than the complex logic I developed way back when. See e.g. lines starting at 57 in WQ looping script.  
    -  see `parse_date_time()` - can specify multiple possible orders (in examples, look at **heterogeneous date-times**)  
    -  looks like I was originally worried about `mdY HM` vs. `Ymd HM`  
    -  is working currently though, so maybe don't mess with it
2. Date-times are using America/Regina time zone! Do something about this?  
    -  .  
3. See if Jeremy or someone will give these a test run once they're updated  
4. Consider incorporating PAR graphs - this will be most straightforward with a shiny app though
5. Find out if anyone is still using KOR v.1 - does that 'raw' script need to be updated, or can it be removed?  
