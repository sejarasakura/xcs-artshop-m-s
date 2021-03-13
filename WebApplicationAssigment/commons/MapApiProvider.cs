using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using WebApplicationAssigment.commons;


namespace WebApplicationAssigment.commons
{
    public class MapApiProvider
    {
        public static dynamic GetReverseGeocoding(float lag, float lng)
        {
            string result = HttpsLoad.instance.Get(MapApiConstant.GetReverseGeocodingUrl(lag, lng));

            return JsonConvert.DeserializeObject(result);
        }
    }
} 