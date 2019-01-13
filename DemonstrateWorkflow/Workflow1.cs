using System.Activities;
using Microsoft.Xrm.Sdk;
using XrmCiFramework;

namespace DemonstrateWorkflow
{
    [XrmCiPluginRegistration("Pointless workflow", PluginIsolationMode.Sandbox, PluginSourceType.Database,"WfFriendly","MGXRMWorkflows")]
    public class Workflow1 : CodeActivity
    {
        protected override void Execute(CodeActivityContext context)
        {
            throw new InvalidPluginExecutionException("In Workflow1");
        }
    }
}