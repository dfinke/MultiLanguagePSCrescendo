Get-ChildItem -Directory | ForEach-Object {
    Write-Progress -Activity "Building" -Status $_
    Push-Location
    Set-Location $_
    if (Test-Path .\build.ps1) {
        .\build.ps1
        Import-Module *.psm1 -Force
    }  
    Pop-Location
}

Write-Progress -Activity "Running" 

Get-HelloRust Jane 20
Get-HelloGo -Age 21 -Name John 
Get-HelloPython Mary 22