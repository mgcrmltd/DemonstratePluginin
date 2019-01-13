This project will not initiall build as the XrmCiPluginRegistration.cs class file is empty. pluginregistration.json and workflowregistration.json are also initialy empty

The scripts assume you have downloaded the PR branch and built it. Set $TestModuleLocation in each script to the location of the built Xrm.Framework.CI.PowerShell.Cmdlets.dll

1) Run script 1. This demonstrates the Get-XrmPluginRegistrationClass command and writes the content to XrmCiPluginRegistration.cs. The project should now build 

2) Run script 2. This will use the custom attribites on the plugin and workflow classes to populate pluginregistration.json and workflowregistration.json

3) Run script 3. This will register the plugins and workflow.