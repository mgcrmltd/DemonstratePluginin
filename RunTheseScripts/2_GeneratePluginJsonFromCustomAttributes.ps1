function Get-ScriptDirectory 
{ 
    if ($script:MyInvocation.MyCommand.Path) { Split-Path $script:MyInvocation.MyCommand.Path } else { $pwd } 
}

$scriptDir =  Get-ScriptDirectory
Set-Location $scriptDir

##Launch with -NoProfile so it does not lock the assembly. Otherwise you must close PowerShell before you can rebuild the plugin and workflow assemblies
PowerShell -NoProfile -Command  {

    function Get-ScriptDirectory 
    { 
        if ($script:MyInvocation.MyCommand.Path) { Split-Path $script:MyInvocation.MyCommand.Path } else { $pwd } 
    }

    $scriptDir =  Get-ScriptDirectory

	[string]$TestModuleLocation = ""

	if([string]::IsNullOrEmpty($TestModuleLocation))
	{
		write-host "Set TestModuleLocation to point to the compiled local copy of your cmdlet"
		return
	}
	import-module $TestModuleLocation

    Get-XrmPluginRegistrationFromAssembly -AssemblyPath "..\DemonstratePlugin\bin\Debug\DemonstratePlugin.dll"`
     -MappingFile "..\DemonstratePlugin\pluginregistration.json"

     Get-XrmPluginRegistrationFromAssembly -AssemblyPath "..\DemonstrateWorkflow\bin\Debug\DemonstrateWorkflow.dll"`
     -MappingFile "..\DemonstrateWorkflow\workflowregistration.json"
} 

write-host "Check that pluginregistration.json and workflowregistration.json are now populated"