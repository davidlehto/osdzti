Write-Host  -ForegroundColor Cyan "Starting OSDCloud for Windows 10 21h2 sv-se..."
Start-Sleep -Seconds 5

#Make sure I have the latest OSD Content
Write-Host  -ForegroundColor Cyan "Updating OSDCloud PowerShell Module"
Install-Module OSD -Force

Write-Host  -ForegroundColor Cyan "Importing OSDCloud PowerShell Module"
Import-Module OSD -Force

#Start OSDCloud ZTI the RIGHT way
Write-Host  -ForegroundColor Cyan "Starting OSDCloud with Windows 10 21h2 sv-se"
Start-OSDCloud -OSVersion 'Windows 10' -OSLanguage sv-se -OSBuild 21H2 -OSEdition Enterprise -ZTI

#Anything I want can go right here and I can change it at any time since it is in the Cloud!!!!!
Write-Host  -ForegroundColor Cyan "Starting OSDCloud PostAction ..."
if ((Get-MyComputerManufacturer) -match 'Dell') {
    Write-Host  -ForegroundColor Cyan "Setting bootorder and BIOS password for Dell"
    D:\BIOS\Dell-scripts\Install-DellBiosProvider.ps1 -ModulePath D:\BIOS\DellBIOSProvider -DllPath D:\BIOS\DllFiles
    Import-Module DellBIOSProvider 
    Set-Dell1stBootdevice "uefi rst"
    Set-Item -Path DellSmbios:\Security\AdminPassword 6541779799
    Write-Host  -ForegroundColor Cyan "Bootorder and BIOS Password set"
}

#Restart from WinPE
Write-Host  -ForegroundColor Cyan "Restarting in 20 seconds!"
Start-Sleep -Seconds 20
wpeutil reboot
