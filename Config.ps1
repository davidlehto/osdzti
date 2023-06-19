Write-Host  -ForegroundColor Cyan "Starting OSDCloud for Windows 10 22h2 sv-se (Transtema)..."
Start-Sleep -Seconds 5

#Make sure I have the latest OSD Content
Write-Host  -ForegroundColor Cyan "Updating OSDCloud PowerShell Module"
Install-Module OSD -Force

Write-Host  -ForegroundColor Cyan "Importing OSDCloud PowerShell Module"
Import-Module OSD -Force

#Start OSDCloud ZTI the RIGHT way
Write-Host  -ForegroundColor Cyan "Starting OSDCloud with Windows 10 22h2 sv-se"
Start-OSDCloud -OSVersion 'Windows 10' -OSLanguage sv-se -OSBuild 22H2 -OSEdition Enterprise -ZTI

#Anything I want can go right here and I can change it at any time since it is in the Cloud!!!!!
Write-Host  -ForegroundColor Cyan "Starting OSDCloud PostAction ..."
#if ((Get-MyComputerManufacturer) -match 'Dell') {
    #Write-Host  -ForegroundColor Cyan "Setting bootorder and BIOS password for Dell"
    #D:\BIOS\Dell-scripts\Install-DellBiosProvider.ps1 -ModulePath D:\BIOS\DellBIOSProvider -DllPath D:\BIOS\DllFiles

    #Write-Host  -ForegroundColor Cyan "Importing DellBIOSProvider PowerShell Module"
    #Import-Module DellBIOSProvider 
    
    #D:\BIOS\Dell-scripts\Manage-DellBiosPasswords-PSModule.ps1 -AdminSet -AdminPassword 6541779799 -OldAdminPassword 6541779799
    #Start-Sleep -Seconds 10
    #D:\BIOS\Dell-scripts\Manage-DellBiosSettings-WMI.ps1 -SetBootOrder "Windows Boot Manager","Onboard NIC(IPV4)","Onboard NIC(IPV6)" -BootMode UEFI -AdminPassword ExamplePassword
    #Start-Sleep -Seconds 10

    #Write-Host  -ForegroundColor Cyan "Bootorder and BIOS Password set"
#}
#Restart from WinPE
Write-Host  -ForegroundColor Cyan "Restarting in 20 seconds!"
Start-Sleep -Seconds 20
wpeutil reboot

