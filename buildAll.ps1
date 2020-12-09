Get-ChildItem -Directory | ForEach-Object {
    Push-Location
    Set-Location $_
    if (Test-Path .\build.ps1) {
        .\build.ps1
        Import-Module *.psm1 -Force
    }  
    Pop-Location
}

Get-HelloRust Jane 20
Get-HelloGo John 21
Get-HelloPython Mary 22