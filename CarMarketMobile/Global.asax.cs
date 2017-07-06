using System.Web.Mvc;
using System.Web.Routing;
using TQQ.Data.Configuration;

namespace CarMarketMobile
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            DbSettingProviderManager.Current.Start();
            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
        }
    }
}
