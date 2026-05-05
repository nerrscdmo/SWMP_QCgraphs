# script to loop through all QC-MET files in a folder (csv or dat) and
# make line graphs (8 per page) of data plus a second page with a wind rose
# by Kim Cressman
# latest update 2026-05-05

################################################################################

### IMPORTANT
# you need to have some packages installed
# only need to uncomment and run these once; you can ignore them in future script runs
# install.packages('openair')
# install.packages('ggplot2')

### IMPORTANT 2
# If you are not using RStudio, the folder-choice pop-up MAY NOT show up on top of other programs
# You MUST minimize everything else to make the pop-up visible

### INSTRUCTIONS
# 1 - Put your cursor somewhere in this window
# 2 - Push 'Ctrl' + 'A' to select the whole script
# 3 - Push 'Ctrl' + 'R' to run the script
# 4 - Minimize RStudio to get to the pop-up and choose the folder your QC files are in
# 5 - Magic happens
# 6 - Look in the folder you selected and pdf files should be there

################################################################################
################################################################################


library(openair)

# interactively choose which folder you want to work in
# if using rstudio, the pop-up will come up on top of other windows
# otherwise, other programs might have to be minimized to find the tcltk window
# both rstudio and tcltk are installed automatically
if (rstudioapi::isAvailable()) {
    my.dir <- rstudioapi::selectDirectory(
        caption = "Choose which folder you want to work in",
        path = getwd()
    )
} else {
    my.dir <- tcltk::tk_choose.dir(getwd(), caption = "Choose which folder you want to work in")
}

# get the list of files in the directory that you want to graph
names.dir <- list.files(path = my.dir,
                        pattern = "met[0-9]{6}_QC\\.(csv|dat)",
                        ignore.case = TRUE)
n <- length(names.dir)

for (i in 1:n)
{
    # find the next file in the loop
    myFile <- names.dir[i]
    
    # make the full path to the file, first for reading, then for pdf output
    full_file_path <- file.path(my.dir, myFile)
    
    
    # read in the file and generate names for output
    met.data <- read.csv(full_file_path,
                         fileEncoding = "latin1") # deals with special characters in column names
    x <- nchar(myFile) # counting the characters in the file name
    Title = substr(myFile, 1, x - 4) # this should return the full name of the file (minus '.csv')
    Titlepdf <- file.path(my.dir, paste0(Title, ".pdf"))
    
    
    # format DateTime as POSIXct, which will turn it into a number that can be graphed
    # we are retaining the format of mm/dd/yyyy hh:mm
    met.data$DateTime <- as.POSIXct(met.data$TIMESTAMP, format = "%m/%d/%Y %H:%M", tz = 'America/Regina')
    
    # open up a pdf file to print to
    pdf(file = Titlepdf,
        paper = "letter",
        width = 7.5,
        height = 9,
        pagecentre = TRUE,
        family = "sans")
    
    # make the graph page layout 4 rows and 2 columns so all graphs will fit on a page
    par(mfcol = c(4, 2),
        mar = c(2.1, 4.1, 1.1, 1.1),
        oma = c(1, 1, 1, 1))
    
    
    # make line graphs
    
    # air temp
    plot(ATemp ~ DateTime, data = met.data,
         type = "l",
         xlab = "", xaxt = 'n',
         col = "darkred")
    axis.POSIXct(1, at = seq(min(met.data$DateTime, na.rm = TRUE),
                             max(met.data$DateTime, na.rm = TRUE), length.out = 5),
                 format = "%m/%d", cex.axis = 0.9)
    
    # relative humidity
    plot(RH ~ DateTime, data = met.data,
         type = "l",
         xlab = "", xaxt = 'n',
         col = "darkblue")
    axis.POSIXct(1, at = seq(min(met.data$DateTime, na.rm = TRUE),
                             max(met.data$DateTime, na.rm = TRUE), length.out = 5),
                 format = "%m/%d", cex.axis = 0.9)
    
    # baro pressure
    plot(BP ~ DateTime, data = met.data,
         type = "l",
         xlab = "",
         xaxt = 'n',
         col = "darkgreen")
    axis.POSIXct(1, at = seq(min(met.data$DateTime, na.rm = TRUE),
                             max(met.data$DateTime, na.rm = TRUE), length.out = 5),
                 format = "%m/%d", cex.axis = 0.9)
    
    # wind speed
    plot(WSpd ~ DateTime, data = met.data,
         type = "l",
         xlab = "", xaxt = 'n',
         col = "darkslategray")
    axis.POSIXct(1, at = seq(min(met.data$DateTime, na.rm = TRUE),
                             max(met.data$DateTime, na.rm = TRUE), length.out = 5),
                 format = "%m/%d", cex.axis = 0.9)
    
    # max wind speed
    plot(MaxWSpd ~ DateTime, data = met.data,
         type = "l",
         xlab = "", xaxt = 'n',
         col = "darkorange")
    axis.POSIXct(1, at = seq(min(met.data$DateTime, na.rm = TRUE),
                             max(met.data$DateTime, na.rm = TRUE), length.out = 5),
                 format = "%m/%d", cex.axis = 0.9)
    
    # cumulative precip
    plot(CumPrcp ~ DateTime, data = met.data,
         type = "l",
         xlab = "", xaxt = 'n',
         col = "darkmagenta")
    axis.POSIXct(1, at = seq(min(met.data$DateTime, na.rm = TRUE),
                             max(met.data$DateTime, na.rm = TRUE), length.out = 5),
                 format = "%m/%d", cex.axis = 0.9)
    
    # PAR
    plot(TotPAR ~ DateTime, data = met.data,
         type = "l",
         xlab = "", xaxt = 'n',
         col = "darkturquoise")
    axis.POSIXct(1, at = seq(min(met.data$DateTime, na.rm = TRUE),
                             max(met.data$DateTime, na.rm = TRUE), length.out = 5),
                 format = "%m/%d", cex.axis = 0.9)
    
    # battery
    plot(AvgVolt ~ DateTime, data = met.data,
         type = "l",
         xlab = "", xaxt = 'n',
         col = "darkkhaki")
    axis.POSIXct(1, at = seq(min(met.data$DateTime, na.rm = TRUE),
                             max(met.data$DateTime, na.rm = TRUE), length.out = 5),
                 format = "%m/%d", cex.axis = 0.9)
    
    # put the title of the file above all the plots on the page
    mtext(Title, outer = TRUE, side = 3, cex = 0.9, font = 2)
    
    # reset to one graph per page
    par(mfcol = c(1, 1))

    # make the wind rose
    par.settings <- list(axis.line = list(col = 'darkgray'),
                         par.main.text = list(cex = 1.1),
                         strip.border = list(col = 'darkgray'),
                         layout.widths = list(right.padding = 3),
                         layout.heights = list(top.padding = 3))
    
    met.data$WSpd <- round(met.data$WSpd, 2)
    
    p <- windRose(met.data,
                  ws = "WSpd",
                  wd = "Wdir",
                  width = 1.5,
                  angle = 45,
                  breaks = 5,
                  offset = 7,
                  paddle = FALSE,
                  grid.line = 10,
                  # max.freq = 30,
                  cols = 'GnBu',
                  key.position = "right",
                  key.title = "Wind Speed (m/s)",
                  dig.lab = 2,
                  main = Title,
                  between = list(x = 1, y = 1),
                  par.settings = par.settings,
                  plot = FALSE)
    
    print(p)
    
    # turn off pdf printer
    dev.off()
}

print('Finished!')
