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
        public static async Task<dynamic> GetReverseGeocodingAsync(float lag, float lng)
        {
            string result = await HttpsLoad.instance
                .GetAsync(MapApiConstant.GetReverseGeocodingUrl(lag, lng));

            return JsonConvert.DeserializeObject(result);
        }
    }
} 