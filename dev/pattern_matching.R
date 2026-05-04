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

