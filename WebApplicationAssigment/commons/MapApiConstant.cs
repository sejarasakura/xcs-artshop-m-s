using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplicationAssigment.commons
{
    public class MapApiConstant
    {
        public static string API_KEY = "";
        public static string ENDPOINT_URL = "https://maps.googleapis.com/maps/api";
        public static string GEOCODE_URL = "https://maps.googleapis.com/maps/api/geocode";


        public static string GetReverseGeocodingUrl(float lag, float lng)
        {
            return GEOCODE_URL + "/json?latlng="+ lag + "," + lng + "&key=" + API_KEY;
        }

    }
}