# Overview
This is the folder where the data exported from Amazon and Draft2Digital should be saved. The automatic data parsing relies on specific file names to identify the files and read the export date. Note that the names are case sensitive.

## How to download and name files
### Amazon
Use the **Royalties Estimator** tool to export files for one month at a time, selecting the first and last date of the month as the report range. If you try to select multiple months at once, the KDP system will roll up the data and lose the per-date granularity. 

The downloaded report will be an .xlsx file with multiple tabs. Don't worry about that, the script will automatically parse out the correct tabs.

#### Amazon file name:
long template:

`kdp_<report month in YYYY-MM format>_<export date in YYYY-MM-DD format>.xlsx`

short template:

`kdp_YYYY-MM_YYYY-MM-DD.xlsx`

For example, if you exported July 2025 on December 20th 2025, the file name would be:
`kdp_2025-07_2025-12-20.xlsx`

### Draft 2 Digital
Under "Reports" go to "Downloads". Download the Full Year Sales Report for both eBook and Print for each year. The yearly data is easier to work with and has all the same information as the monthly data.

#### D2D file name:

long template:

`d2d_<report month in YYYY>_<ebook|print>_<export date in YYYY-MM-DD format>.csv`

short template:

`d2d_YYYY_<format>_YYYY-MM-DD.csv`

For example, if you exported 2025 on December 20th 2025, the file name would be:

`kdp_2025-07_2025-12-20.csv`

## Notes and troubleshooting
The file names are case sensitive.

**Be sure you don't have any duplicate data.** Consider creating an "archive" subdirectory in "raw" so that you can easily move old versions of files out of the way. The script won't search a sub-directory.
