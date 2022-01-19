#Get List of installed windows Features

Get-WindowsFeature |
    Where-Object Installed |
    #Chagne the Match for what you want to look for
    Where-Object Name -Match ^Web |
    Export-Csv C:\Temp\WebFeatures.csv

#Uninstall list of windows features
 
Import-Csv C:\Temp\WebFeatures.csv | ForEach-Object Name | Uninstall-WindowsFeature
 
#Install list of windows features - Likely requires reboot here
 
Import-Csv C:\Temp\WebFeatures.csv | ForEach-Object Name | Install-WindowsFeature
