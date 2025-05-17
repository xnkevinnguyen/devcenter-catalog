# Get the directory of the current script
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Set the output file path to the system root (C:\)
$outputFile = "C:\location.txt"

# Write the directory location to the file
$scriptDir | Out-File -FilePath $outputFile -Encoding UTF8

# Write the directory location to the output
Write-Output $scriptDir