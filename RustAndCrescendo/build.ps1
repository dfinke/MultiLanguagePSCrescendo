Remove-Item .\hello.exe
rustc .\hello.rs

Export-CrescendoModule -ConfigurationFile .\rusthello.crescendo.json -ModuleName rusthello.psm1 -Force

Import-Module .\rusthello.psm1 -Force