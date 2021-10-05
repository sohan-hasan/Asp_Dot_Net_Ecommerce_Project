using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace ProjectZupree
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Temporary;
            routes.EnableFriendlyUrls(settings);
            routes.MapPageRoute("Login", "login", "~/LoginPage.aspx");
            routes.MapPageRoute("Registration", "registrations", "~/UnauthorizedPages/UserRegistration.aspx");
            routes.MapPageRoute("SupplierInfo", "suppliers", "~/AuthorizedPages/AddSuppliers.aspx");
            routes.MapPageRoute("ProductInfo", "product", "~/AuthorizedPages/AddProduct.aspx");
            routes.MapPageRoute("Order", "order", "~/AuthorizedPages/AddOrder.aspx");
            routes.MapPageRoute("DefaultError", "default_error", "~/Error_Pages/DefaultErrorPage.aspx");
            routes.MapPageRoute("InternalServerError", "internal_server_error", "~/Error_Pages/InternalServerErrorPage.aspx");
            routes.MapPageRoute("PageNotFoundError", "page_not_found_error", "~/Error_Pages/PageNotFoundErrorPage.aspx");
            routes.MapPageRoute("UnauthorizedError", "unauthorized_error", "~/Error_Pages/UnauthorizedErrorPage.aspx");
            routes.MapPageRoute("ProductReport", "product_report", "~/AuthorizedPages/ProductReportPage.aspx");
            routes.MapPageRoute("ViewDetails", "product_details", "~/AuthorizedPages/ViewDetails.aspx");
        }
    }
}
