# from Claude, to find wq or met files in a directory
# ignore.case should let it find wq or WQ, etc.
list.files(
    path = "/your/directory",
    pattern = "_(wq|met)[0-9]{6}_QC",
    ignore.case = TRUE
)


# or
list.files(
    path = "/your/directory",
    pattern = "_(wq|met)[0-9]{6}_QC",
    ignore.case = TRUE,
    full.names = TRUE,   # returns full file paths instead of just names
    recursive = TRUE     # search subdirectories too
)



# from claude about interactively choosing a working directory -
# recommends using rstudioapi
# but this in case someone's not using rstudio:
if (rstudioapi::isAvailable()) {
    my.dir <- rstudioapi::selectDirectory(
        caption = "Choose which folder you want to work in",
        path = getwd()
    )
} else {
    my.dir <- tcltk::tk_choose.dir(getwd(), caption = "Choose which folder you want to work in")
}

# claude says:
# rstudioapi is installed automatically with RStudio and doesn't need a separate install, just like tcltk.
