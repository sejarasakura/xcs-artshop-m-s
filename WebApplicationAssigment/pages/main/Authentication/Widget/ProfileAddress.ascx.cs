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
using System.Data.Entity.Migrations;
using Microsoft.EntityFrameworkCore;

namespace WebApplicationAssigment.pages.main.Authentication.Widget
{
    public partial class ProfileAddress : System.Web.UI.UserControl
    {
        public string param_type;
        public string param_id;
        public bool display_in_map;
        public Address address;
        protected void Page_Load(object sender, EventArgs e)
        {
            param_id = Request.QueryString["id"];
            param_type = Request.QueryString["type"];
            display_in_map = (param_type == "show" || param_type == "edit");
            procide_map.Enabled = !display_in_map;
            if (display_in_map)
            {
                using (ArtShopEntities db = new ArtShopEntities())
                {
                    address = db.Addresses.Find(Guid.Parse(param_id));
                }
                procide_map.Text = "View Only";
            }
            if(param_type == "remove")
            {
                using (ArtShopEntities db = new ArtShopEntities())
                {
                    try
                    {
                        Address add = db.Addresses.Find(Guid.Parse(param_id));
                        db.UserExtensions.Find(Functions.getLoginUser().ProviderUserKey).Addresses.Remove(add);
                        db.SaveChanges();
                        Functions.EnqueueNewNotifications(new Notifications(
                            Notifications.SUCCESS_TYPE,
                            "Address removed !!",
                            "The reference address is removed form your prefrence list."));
                    }
                    catch (Exception ex)
                    {
                        Functions.EnqueueNewNotifications(new Notifications(
                            Notifications.ERROR_TYPE,
                            "Unknows error founds",
                            "Error : " + ex.Message));
                    }
                }
                Response.Redirect("MyAccount.aspx?");
            }
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

            bool created;
            float lat, lng;
            checkAddressExcite(latlng_text, out created, out lat, out lng);

            if (created)
                return;

            dynamic result = MapApiProvider.GetReverseGeocoding(lat, lng);
            JArray resultsDetails = result["results"];
            if (result["status"] == "OK" ? resultsDetails.Count > 0 : false)
            {
                Address address = decodeGeoAddress(resultsDetails);

                using (ArtShopEntities db = new ArtShopEntities())
                {
                    Address old_address = db.Addresses.Where(
                        q => q.street == address.street &&
                        q.city == address.city &&
                        q.state == address.state &&
                        q.poscode == address.poscode &&
                        q.country == address.country
                        ).FirstOrDefault();
                    if (db.UserExtensions.Find(Functions.getLoginUser().ProviderUserKey).Addresses.Contains(old_address))
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
                            address.id = Guid.NewGuid();
                            if (old_address != null)
                                db.UserExtensions.Find(Functions.getLoginUser().ProviderUserKey).Addresses.Add(old_address);
                            else
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
            }
            else
            {
                Functions.EnqueueNewNotifications(new Notifications(
                Notifications.ERROR_TYPE,
                "Google Map API Error!",
                result["status"] + ": " + result["error_message"] + " !!"));
            }
        }

        private static Address decodeGeoAddress(JArray resultsDetails)
        {
            Address address = new Address();
            JArray addressComponents = (JArray)resultsDetails[0]["address_components"];

            address.details = (string)resultsDetails[0]["formatted_address"];
            address.latitude = (double)resultsDetails[0]["geometry"]["location"]["lat"];
            address.longitude = (double)resultsDetails[0]["geometry"]["location"]["lng"];
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
            }

            if (address.street.Length > 2)
                address.street = address.street.Remove(Math.Max(-1, address.street.Length - 2));
            if (address.city.Length > 2)
                address.city = address.city.Remove(Math.Max(-1, address.city.Length - 2));
            if (address.state.Length > 2)
                address.state = address.state.Remove(Math.Max(-1, address.state.Length - 2));
            if (address.poscode.Length > 2)
                address.poscode = address.poscode.Remove(Math.Max(-1, address.poscode.Length - 2));
            if (address.country.Length > 2)
                address.country = address.country.Remove(Math.Max(-1, address.country.Length - 2));
            return address;
        }

        private static void checkAddressExcite(string latlng_text, out bool created, out float lat, out float lng)
        {
            created = false;
            dynamic latlng = JsonConvert.DeserializeObject(latlng_text);
            lat = latlng["lat"];
            lng = latlng["lng"];
            using (ArtShopEntities db = new ArtShopEntities())
            {
                Address[] addresss = db.Addresses.ToArray();
                for (int i = 0; i < addresss.Length; i++)
                {
                    if ((addresss[i].latitude == lat && addresss[i].longitude == lng))
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
        }
    }
}