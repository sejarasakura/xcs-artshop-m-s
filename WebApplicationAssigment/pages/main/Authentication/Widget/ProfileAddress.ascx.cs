using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssigment.commons;
using WebApplicationAssigment.modal;
using Newtonsoft.Json.Linq;

namespace WebApplicationAssigment.pages.main.Authentication.Widget
{
    public partial class ProfileAddress : System.Web.UI.UserControl
    {
        protected string param_type;
        protected string param_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            string param_id = Request.QueryString["id"];
            string param_type = Request.QueryString["type"];
        }

        protected void procide_map_Click(object sender, EventArgs e)
        {
            addAddress();
        }

        public void addAddress()
        {
            string address_text = this.form_address.Value;
            string latlng_text = this.form_latlng.Value;
            Console.Out.WriteLine("procide_map_Click");
            if (latlng_text.Length <= 0)
            {
                Functions.EnqueueNewNotifications(new Notifications(
                    Notifications.ERROR_TYPE,
                    "No address selected",
                    "Please select a address to procide"));
                return;
            }

            bool created = false;
            dynamic latlng = JsonConvert.DeserializeObject(latlng_text);
            float lat = latlng["lat"];
            float lng = latlng["lng"];
            using (ArtShopEntities db = new ArtShopEntities())
            {
                Address[] addresss = db.Addresses.ToArray();
                for (int i = 0; i < addresss.Length; i++)
                {
                    if(addresss[i].latitude == lat && addresss[i].longitude == lng)
                    {
                        created = true;
                        if (db.UserExtensions.Find(Functions.getLoginUser().ProviderUserKey).Addresses.Contains(addresss[i]))
                        {
                            Functions.EnqueueNewNotifications(new Notifications(
                                Notifications.ERROR_TYPE,
                                "Address excites",
                                "This address is been added to yours preference"));
                        }
                        else
                        {
                            try
                            {
                                db.UserExtensions.Find(Functions.getLoginUser().ProviderUserKey).Addresses.Add(addresss[i]);
                                db.SaveChanges();
                                Functions.EnqueueNewNotifications(new Notifications(
                                    Notifications.SUCCESS_TYPE,
                                    "Adding successful",
                                    "Your new reference address is updates to your profiles"));
                            }
                            catch (Exception ex)
                            {
                                Functions.EnqueueNewNotifications(new Notifications(
                                    Notifications.ERROR_TYPE,
                                    "Unknows error founds",
                                    "Error : " + ex.Message));
                            }
                        }
                    }
                }
            }

            if (created)
                return;

            dynamic result = MapApiProvider.GetReverseGeocoding(lat, lng);
            JArray resultsDetails = result["results"];
            if (result["status"] == "OK" ? resultsDetails.Count > 0 : false)
            {
                Address address = new Address();
                JArray addressComponents = (JArray)resultsDetails[0]["address_components"];

                address.details = (string)resultsDetails[0]["formatted_address"];
                address.latitude = lat;
                address.longitude = lng;
                address.street = "";
                address.state = "";
                address.poscode = "";
                address.country = "";
                address.city = "";
                for (int i = 0; i < addressComponents.Count; i++)
                {
                    string[] types = ((JArray)addressComponents[i]["types"]).Values<string>().ToArray();
                    
                    if (types.Contains("floor"))
                    {
                        address.street += addressComponents[i]["long_name"] + ", ";
                    }
                    else if (types.Contains("street_number"))
                    {
                        address.street += addressComponents[i]["long_name"] + ", ";
                    }
                    else if (types.Contains("route"))
                    {
                        address.street += addressComponents[i]["long_name"] + ", ";
                    }
                    else if (types.Contains("locality"))
                    {
                        address.state += addressComponents[i]["long_name"] + ", ";
                    }
                    else if (types.Contains("sublocality"))
                    {
                        address.city += addressComponents[i]["long_name"] + ", ";
                    }
                    else if (types.Contains("administrative_area_level_1"))
                    {
                        address.state += addressComponents[i]["long_name"] + ", ";
                    }
                    else if (types.Contains("country"))
                    {
                        address.country += addressComponents[i]["long_name"] + ", ";
                    }
                    else if (types.Contains("postal_code"))
                    {
                        address.poscode += addressComponents[i]["long_name"] + ", ";
                    }
                    if(address.street.Length > 2)
                        address.street = address.street.Remove(Math.Max(-1, address.street.Length - 2));
                    if (address.city.Length > 2)
                        address.city = address.city.Remove(Math.Max(-1, address.city.Length - 2));
                    if (address.state.Length > 2)
                        address.state = address.state.Remove(Math.Max(-1, address.state.Length - 2));
                    if (address.poscode.Length > 2)
                        address.poscode = address.poscode.Remove(Math.Max(-1, address.poscode.Length - 2));
                    if (address.country.Length > 2)
                        address.country = address.country.Remove(Math.Max(-1, address.country.Length - 2));
                }
                using (ArtShopEntities db = new ArtShopEntities())
                {
                    try
                    {
                        address.id = Guid.NewGuid();
                        db.UserExtensions.Find(Functions.getLoginUser().ProviderUserKey).Addresses.Add(address);
                        db.SaveChanges();
                        Functions.EnqueueNewNotifications(new Notifications(
                            Notifications.SUCCESS_TYPE,
                            "Adding successfu",
                            "Your new reference address is updates to your profiles"));
                    }
                    catch (Exception ex)
                    {
                        Functions.EnqueueNewNotifications(new Notifications(
                            Notifications.ERROR_TYPE,
                            "Unknows error founds",
                            "Error : " + ex.Message));
                    }
                }
            }
            else
            {
                Functions.EnqueueNewNotifications(new Notifications(
                Notifications.ERROR_TYPE,
                "Google Map API Error!",
                result["status"] + ": " + result["error_message"] + " !!"));
            }
        }
    }
}