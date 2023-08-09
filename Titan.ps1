<#

Titan Automation Script
Author: Craig Millsap, https://www.camtechcs.com/automated-students/

#>

Param(
    [Parameter(Mandatory=$false)][switch]$SkipUploadingFiles, #Skip Uploading
    [Parameter(Mandatory=$false)][switch]$LockerCode #Pulls Titan_Locker_Serving_number
)

$hostkey = '81:f6:c8:85:a7:a7:23:9f:71:32:bc:dd:03:ff:10:8c'

if (-Not(Test-Path $PSScriptRoot\settings.ps1)) {
    Write-Host "Error: Failed to find settings.ps1 file."    
    exit 1
} else {
    . $PSScriptRoot\settings.ps1
}
if ($LockerCode){
Save-CognosReport -report "Titan_Locker_serving_number" -cognosfolder "_Shared Data File Reports" -TeamContent -savepath $PSScriptRoot
}else{
Save-CognosReport -report "Titan" -cognosfolder "_Shared Data File Reports" -TeamContent -savepath $PSScriptRoot
}
try {
    if (-Not($SkipUploadingFiles)) {
        Write-Host "Info: Uploading files to Titan..." -ForegroundColor YELLOW
        $exec = Start-Process -FilePath "$PSScriptRoot\bin\pscp.exe" -ArgumentList "-pw $password -hostkey $hostkey $PSScriptRoot\Titan.csv $($username)@sftp.titank12.com:" -PassThru -Wait -NoNewWindow
    
        if ($exec.ExitCode -ne 0) {
            Throw            
        }
        
    } else {
        Write-Host "Info: You have requested to skip uploading files."
    }
} catch {
    write-Host "ERROR: Failed to properly upload files to Titan. Exit Code $($exec.ExitCode)" -ForegroundColor RED
    exit(1)
}
