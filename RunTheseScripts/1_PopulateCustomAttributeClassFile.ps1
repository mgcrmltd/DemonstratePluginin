function Get-ScriptDirectory 
{ 
    if ($script:MyInvocation.MyCommand.Path) { Split-Path $script:MyInvocation.MyCommand.Path } else { $pwd } 
}

$scriptDir =  Get-ScriptDirectory
Set-Location $scriptDir

[string]$TestModuleLocation = ""

if([string]::IsNullOrEmpty($TestModuleLocation))
{
	write-host "Set TestModuleLocation to point to the compiled local copy of your cmdlet"
    return
}
import-module $TestModuleLocation

#Write output of command to the class file
Get-XrmPluginRegistrationClass > ..\DemonstratePlugin\XrmCiPluginRegistration.cs

write-host "Check XrmCiPluginRegistration.cs is populated and build the project before running script 2"
