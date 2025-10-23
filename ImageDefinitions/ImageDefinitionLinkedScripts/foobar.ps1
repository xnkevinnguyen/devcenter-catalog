# foobar.ps1 - Test script for image definition
Write-Output "Starting foobar.ps1 execution..."

# Create verification directory
$verificationDir = 'C:\provisioning\temp'
if (-not (Test-Path $verificationDir)) { 
    New-Item -Path $verificationDir -ItemType Directory -Force | Out-Null 
}

# Write verification file with timestamp and execution details
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$computerName = $env:COMPUTERNAME
$userName = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$scriptPath = $MyInvocation.MyCommand.Path

$verificationContent = @"
FooBar Script Execution Verification
=====================================
Executed at: $timestamp
Computer: $computerName
User: $userName
Script Path: $scriptPath
Status: SUCCESS

This file confirms that foobar.ps1 was executed successfully
during the image definition provisioning process.
"@

$verificationFile = Join-Path $verificationDir 'foobar-execution-verification.txt'
Set-Content -Path $verificationFile -Value $verificationContent -Encoding UTF8

Write-Output "foobar.ps1 completed successfully"
Write-Output "Verification file created at: $verificationFile"