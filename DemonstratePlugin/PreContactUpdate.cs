using System;
using Microsoft.Xrm.Sdk;
using XrmCiFramework;

namespace DemonstratePlugin
{
    [XrmCiPluginRegistration("contact","pre contact update",PluginIsolationMode.Sandbox,PluginSourceType.Database,"",
        0,PluginStage.Preoperation,PluginExecutionMode.Synchronous, XrmCiPluginRegistration.Update,
        "PreImage","fullname,fax",PluginImageType.PreImage)]
    public class PreContactUpdate : IPlugin
    {
        public void Execute(IServiceProvider serviceProvider)
        {
            throw new InvalidPluginExecutionException("Entered PreContactUpdate Execute");
        }
    }
}
