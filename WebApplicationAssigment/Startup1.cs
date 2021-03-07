using Microsoft.Owin;
using Owin;
using System;
using System.Threading.Tasks;
using WebApplicationAssigment.commons;

[assembly: OwinStartup(typeof(WebApplicationAssigment.Startup1))]

namespace WebApplicationAssigment
{
    public class Startup1
    {
        public void Configuration(IAppBuilder app)
        {
        }
    }
}
