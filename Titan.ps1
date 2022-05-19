Param(
    [Parameter(Mandatory=$false)][switch]$SkipUploadingFiles #Skip Uploading
)

$hostkey = '81:f6:c8:85:a7:a7:23:9f:71:32:bc:dd:03:ff:10:8c'

if (-Not(Test-Path $PSScriptRoot\settings.ps1)) {
    Write-Host "Error: Failed to find settings.ps1 file."    
    exit 1
} else {
    . $PSScriptRoot\settings.ps1
}

& ..\CognosDownload.ps1 -report Titan -cognosfolder "_Shared Data File Reports" -TeamContent -TrimCSVWhiteSpace -savepath $PSScriptRoot

try {
    if (-Not($SkipUploadingFiles)) {
        Write-Host "Info: Uploading files to Clever..." -ForegroundColor YELLOW
        $exec = Start-Process -FilePath "$PSScriptRoot\bin\pscp.exe" -ArgumentList "-pw $password -hostkey $hostkey $PSScriptRoot\Titan.csv $($username)@sftp.titank12.com:" -PassThru -Wait -NoNewWindow
    
        if ($exec.ExitCode -ne 0) {
            Throw            
        }
        
    } else {
        Write-Host "Info: You have requested to skip uploading files."
    }
} catch {
    write-Host "ERROR: Failed to properly upload files to clever. Exit Code $($exec.ExitCode)" -ForegroundColor RED
    exit(1)
}