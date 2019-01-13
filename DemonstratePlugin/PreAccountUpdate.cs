using System;
using Microsoft.Xrm.Sdk;
using XrmCiFramework;

namespace DemonstratePlugin
{
    [XrmCiPluginRegistration("account", "account plugin", PluginIsolationMode.Sandbox, PluginSourceType.Database)]
    public class PreAccountUpdate : IPlugin
    {
        public void Execute(IServiceProvider serviceProvider)
        {
            throw new InvalidPluginExecutionException("In PreAccountUpdate");
        }
    }
}