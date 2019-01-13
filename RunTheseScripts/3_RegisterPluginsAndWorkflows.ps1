function Get-ScriptDirectory 
{ 
    if ($script:MyInvocation.MyCommand.Path) { Split-Path $script:MyInvocation.MyCommand.Path } else { $pwd } 
}

$scriptDir =  Get-ScriptDirectory
Set-Location $scriptDir

##Connection string to delpoy demonstration plugins and workflow
[string]$TestModuleLocation = ""
[string]$connString = ""
[string]$solutionName = ""

if([string]::IsNullOrEmpty($TestModuleLocation))
{
	write-host "Set TestModuleLocation to point to the compiled local copy of your cmdlet"
    return
}
if([string]::IsNullOrEmpty($connString))
{
	write-host "Set a connection string to deploy the assmeblies"
    return
}
if([string]::IsNullOrEmpty($solutionName))
{
	write-host "Set which solution to deploy to"
    return
}
import-module $TestModuleLocation

 
Set-XrmPluginRegistration -AssemblyPath "C:\Users\crmadmin\source\repos\DemonstratePlugin\DemonstratePlugin\bin\Debug\DemonstratePlugin.dll" `
 -RegistrationType Upsert `
 -ConnectionString $connString `
 -MappingFile "..\DemonstratePlugin\pluginregistration.json" `
 -SolutionName $solutionName
  

Set-XrmPluginRegistration -AssemblyPath "C:\Users\crmadmin\source\repos\DemonstratePlugin\DemonstrateWorkflow\bin\Debug\DemonstrateWorkflow.dll" `
 -RegistrationType Upsert `
 -ConnectionString $connString `
 -MappingFile "..\DemonstrateWorkflow\workflowregistration.json" `
 -SolutionName $solutionName

 write-host "Check plugins, steps and images are registered as expected"