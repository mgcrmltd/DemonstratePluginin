using System;
using Microsoft.Xrm.Sdk;
using XrmCiFramework;

namespace DemonstratePlugin
{
    [XrmCiPluginRegistration("contact","post contact update", PluginIsolationMode.Sandbox,PluginSourceType.Database, "firstname,lastname", 
        0,PluginStage.Postoperation, PluginExecutionMode.Synchronous, XrmCiPluginRegistration.Update,
        "PreImage", "fullname,fax", PluginImageType.PreImage, "PostImage","fullname",PluginImageType.PostImage)]
    public class PostContactUpdate : IPlugin
    {
        public void Execute(IServiceProvider serviceProvider)
        {
            throw new InvalidPluginExecutionException("Entered PostContactUpdate Execute");
        }
    }
}
