using Microsoft.Owin;
using Owin;
using System;
using System.Threading.Tasks;

[assembly: OwinStartup(typeof(WebApplicationAssigment.Startup1))]

namespace WebApplicationAssigment
{
    public class Startup1
    {
        public void Configuration(IAppBuilder app)
        {
            Console.Out.WriteLine("Start up is configured");
            // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=316888
        }
    }
}
