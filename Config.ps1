#Anything I want can go right here and I can change it at any time since it is in the Cloud!!!!!
Write-Host  -ForegroundColor Cyan "Starting OSDCloud PostAction ..."
if ((Get-MyComputerManufacturer) -match 'Dell') {
    Write-Host  -ForegroundColor Cyan "Setting bootorder for Dell"
    D:\BIOS\Dell-scripts\Install-DellBiosProvider.ps1 -ModulePath D:\BIOS\DellBIOSProvider -DllPath D:\BIOS\DllFiles
    Import-Module DellBIOSProvider 
    Set-Item -Path DellSmbios:\Security\AdminPassword 6541779799
    Set-Item -Path DellSmbios:\BootSequence "hdd"
    Write-Host  -ForegroundColor Cyan "Bootorder set"
}

#Restart from WinPE
Write-Host  -ForegroundColor Cyan "Restarting in 20 seconds!"
Start-Sleep -Seconds 20
wpeutil reboot
