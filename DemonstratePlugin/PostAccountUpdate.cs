using System;
using Microsoft.Xrm.Sdk;
using XrmCiFramework;

namespace DemonstratePlugin
{
    [XrmCiPluginRegistration("account", "post account update", PluginIsolationMode.Sandbox, PluginSourceType.Database, "",
        0, PluginStage.Postoperation, PluginExecutionMode.Synchronous, XrmCiPluginRegistration.Update)]
    public class PostAccountUpdate : IPlugin
    {
        public void Execute(IServiceProvider serviceProvider)
        {
            throw new InvalidPluginExecutionException("In PostAccountUpdate");
        }
    }
}
