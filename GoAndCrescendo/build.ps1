Remove-Item .\hello.exe
go build .\hello.go

Export-CrescendoModule -ConfigurationFile .\gohello.crescendo.json -ModuleName gohello.psm1 -Force

Import-Module .\gohello.psm1 -Force