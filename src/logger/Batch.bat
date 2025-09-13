@echo off

REM This script finds all .java files in the current directory and subdirectories
REM and concatenates their content into a single file named combined_code.txt.

set "output_file=combined_code.txt"

REM Clear the output file if it exists
if exist %output_file% del %output_file%

REM Find all .java files and process them
for /r %%f in (*.java) do (
echo // Class: %%~nf%%~xf >> %output_file%
type "%%f" >> %output_file%
echo. >> %output_file%
echo ==================================================== >> %output_file%
echo. >> %output_file%
)

echo.
echo Successfully concatenated Java files into "%output_file%".