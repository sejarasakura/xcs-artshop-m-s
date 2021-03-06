﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProfileAddress.ascx.cs" Inherits="WebApplicationAssigment.pages.main.Authentication.Widget.ProfileAddress" %>

<%@ Import Namespace="WebApplicationAssigment.modal" %>
<%@ Import Namespace="WebApplicationAssigment.commons" %>
<style>
    .my-map .place-card .place-card-large .place-card-medium {
        display: none !important;
    }

    #map, ex-for-address {
        height: 500px;
        width: 100%;
    }

    .pac-input {
        text-overflow: ellipsis;
        position: relative;
        margin: 12px;
        width: 90%;
    }
</style>
<script
    src="https://maps.googleapis.com/maps/api/js?key=<%= MapApiConstant.API_KEY %>&callback=initMap&libraries=places&v=weekly&language=en&region=MY_en"
    defer></script>
<div id ="preview"></div>
<div class="row">
    <div class="col-sm-6">
        <div class="ex-for-address custom-scrollbar-css" style="height: 500px">
            <%
                using (ArtShopEntities db = new ArtShopEntities())
                {
                    UserAddress[] addresss = db.UserExtensions.Find(Functions.getLoginUser().ProviderUserKey).UserAddresses == null? new UserAddress[0]:
                        db.UserExtensions.Find(Functions.getLoginUser().ProviderUserKey).UserAddresses.ToArray();
                    for (int i = 0; i < addresss.Length; i++)
                    {
            %>
                <div class="card">
                  <div class="card-body">
                    <h3 class="">Address <%= 1 + i %></h3>
                    <p class="card-text">
                        ADDREASS ID
                        <span class="float-right"><%= addresss[i].Address.id %></span>
                    </p>
                      <p class="card-text text-uppercase">
                        <b>lat / long</b>
                        <span class="float-right"><%= addresss[i].Address.latitude + ", " + addresss[i].Address.longitude%></span>
                    </p>
                    <p class="">
                        <%= addresss[i].Address.details %>
                    </p>
                    <p class="mb-1 font-weight-light">Street: <span class="font-italic"> <%=addresss[i].Address.street %> </span></p>
                    <p class="mb-1 font-weight-light">City: <span class="font-italic"> <%=addresss[i].Address.city %> </span></p>
                    <p class="mb-1 font-weight-light">State: <span class="font-italic"> <%=addresss[i].Address.state %> </span></p>
                    <p class="mb-1 font-weight-light">Poscode: <span class="font-italic"> <%=addresss[i].Address.poscode %> </span></p>
                    <p class="mb-1 font-weight-light">Country: <span class="font-italic"> <%=addresss[i].Address.country %> </span></p>
                    <a href="MyAccount.aspx?<%= "type=remove&id=" + addresss[i].Address.id %>" class="btn btn-lg btn-danger">Remove</a>
                    <a href="MyAccount.aspx?<%= param_type == "show" && param_id == addresss[i].Address.id.ToString() ? "" : "type=show&id=" + addresss[i].Address.id %>" class="btn btn-success">
                        <%= param_type == "show" && param_id == addresss[i].Address.id.ToString()? "CANCEL" : "SHOW IN MAP" %></a>
                  </div>
                </div>
            <%
                    }
                }
            %>
            <asp:Button 
                style="margin-bottom: 20px;margin-top: 20px" 
                ID="procide_map" 
                runat="server" 
                Text="Add New Address"
                CssClass="btn btn-info"
                ValidationGroup="ProfileAddress"
                OnClick="procide_map_Click"/>
        </div>
    </div>
    <div class="col-sm-6">

        <div id="map"></div>
        <a id="logo-map" class="" href="#">
            <img style="margin: 12px" src="<%= Constant.COMPANY_LOGO_FRAME %>" alt="Rent Car" width="100" height="60">
        </a>
        <input
            id="pac-input-form"
            class="pac-input form-control"
            type="text"
            placeholder="Pick a locations" />
        <input type="hidden" id="form_latlng" name="form_latlng" value="" runat="server" />
        <input type="hidden" id="form_address" name="form_address" value="" runat="server" />
        
        <script>
            function initMap() {
                <% if (this.display_in_map)
            { %>
                const myLatLng = { lat: <%= address.latitude %>, lng: <%= address.longitude %> };
                <% }
            else
            { %>
                    const myLatLng = { lat: 3.140853, lng: 101.693207 };
                <% } %>
                const geocoder = new google.maps.Geocoder();

                const map = new google.maps.Map(document.getElementById("map"), {
                    zoom: 12,
                    center: myLatLng,
                    disableDefaultUI: true,
                });

                const marker_form = new google.maps.Marker({
                    position: myLatLng,
                    map,
                    animation: google.maps.Animation.DROP,
                    title: "Locations",
                    icon: { url: "<%= Constant.BLUE_PIN_URL %>" }
                });

                const input_form = document.getElementById("pac-input-form");
                const input_form_address = document.getElementById('<%= FindControl("form_address").ClientID %>');
                const input_form_lat = document.getElementById('<%= FindControl("form_latlng").ClientID %>');
                const procide_map = document.getElementById('<%= procide_map.ClientID %>');
                const logo_map = document.getElementById("logo-map");
                const searchBox_form = new google.maps.places.SearchBox(input_form);

                map.controls[google.maps.ControlPosition.LEFT_BOTTOM].push(logo_map);
                map.controls[google.maps.ControlPosition.TOP_LEFT].push(input_form);
                map.controls[google.maps.ControlPosition.BOTTOM_CENTER].push(procide_map);


                // Listen for the event fired when the user selects a prediction and retrieve
                // more details for that place.
                searchBox_form.addListener("places_changed", () => {
                    focus_form = true;
                    search(searchBox_form, marker_form, map);
                    fitCurrentBound(marker_form.getPosition(), map);
                    writeToInput(marker_form.getPosition(), input_form_lat);
                });


                map.addListener("click", (mapsMouseEvent) => {
                    marker_form.setPosition(mapsMouseEvent.latLng);
                    reverseLatLng(geocoder, input_form, marker_form, map, input_form_address);
                    fitCurrentBound(marker_form.getPosition(), map);
                    writeToInput(marker_form.getPosition(), input_form_lat);
                });
                <%if(!this.display_in_map){ %>
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(
                        (position) => {
                            const pos = {
                                lat: position.coords.latitude,
                                lng: position.coords.longitude
                            };
                            marker_form.setPosition(pos);
                            map.setCenter(pos);
                            reverseLatLng(geocoder, input_form, marker_form, map, input_form_address);
                            writeToInput(marker_form.getPosition(), input_form_lat);
                        },
                        () => {
                            handleLocationError(true, infoWindow, map.getCenter(), map);
                        }
                    );
                } else {
                    // Browser doesn't support Geolocation
                    handleLocationError(false, infoWindow, map.getCenter(), map);
                }
                <%}else{ %>
                marker_form.setPosition(myLatLng);
                <%} %>
                reverseLatLng(geocoder, input_form, marker_form, map, input_form_address);
                writeToInput(marker_form.getPosition(), input_form_lat);
                fitCurrentBound(myLatLng, map);
            }

            function reverseLatLng(geocoder, input, marker, map, input_address) {
                const position = marker.getPosition();
                geocoder.geocode({ location: position }, (results, status) => {
                    if (status === "OK") {
                        if (results[0]) {
                            input.value = results[0].formatted_address;
                            input_address.value = results[0].formatted_address;
                        } else {
                            window.alert("No results found");
                        }
                    } else {
                        window.alert("Geocoder failed due to: " + status);
                    }
                });
            }

            function writeToInput(position, input_latlng) {
                input_latlng.value = JSON.stringify(position.toJSON(), null, 2);
            }

            function fitCurrentBound(form, map) {
                var bounds = new google.maps.LatLngBounds();
                bounds.extend(form);
                var offset = 0.002;
                var center = bounds.getCenter();
                bounds.extend(new google.maps.LatLng(center.lat() + offset, center.lng() + offset));
                bounds.extend(new google.maps.LatLng(center.lat() - offset, center.lng() - offset));
                map.fitBounds(bounds);
            }

            function search(searchBox, marker, map) {
                const places = searchBox.getPlaces();

                if (places.length == 0) {
                    return;
                }
                // For each place, get the icon, name and location.
                const bounds = new google.maps.LatLngBounds();
                places.forEach((place) => {
                    if (!place.geometry) {
                        console.log("Returned place contains no geometry");
                        return;
                    }
                    marker.setPosition(place.geometry.location);

                    if (place.geometry.viewport) {
                        // Only geocodes have viewport.
                        bounds.union(place.geometry.viewport);
                    } else {
                        bounds.extend(place.geometry.location);
                    }
                });
                map.fitBounds(bounds);
            }

            function handleLocationError(browserHasGeolocation, infoWindow, pos, map) {
                infoWindow.setPosition(pos);
                infoWindow.setContent(
                    browserHasGeolocation
                        ? "Error: The Geolocation service failed."
                        : "Error: Your browser doesn't support geolocation."
                );
                infoWindow.open(map);
            }
        </script>
    </div>
</div>
