<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddressPicker.ascx.cs" Inherits="WebApplicationAssigment.pages.main.Authentication.Widget.AddressPicker" %>

<%@ Import namespace="WebApplicationAssigment.commons" %>

        <style>
            #map {
                height: 600px;
                /* The height is 600 pixels */
                width: 100%;
                /* The width is the width of the web page */
            }

            .pac-input {
                text-overflow: ellipsis;
                position:relative;
                width: 30%;
                margin-top: 12px;
                margin-right: 12px;
            }
            #form-to{
                margin-left: 12px;
            }
        </style>
        <div id="map"></div>
        <a id="logo-map" class="" href="#">
            <img style="margin:12px" src="<%= Constant.COMPANY_LOGO_FRAME %>" alt="Rent Car" width="180" height="100">
            </a>
        <input
            id="pac-input-form"
            class="pac-input form-control"
            type="text"
            placeholder="Form Location (Current)"
            />
        <input
            id="pac-input-to"
            class="pac-input form-control"
            type="text"
            placeholder="To "
            />
        <button disabled style="margin-bottom: 30px" id="procide-booking" type="button" id="submit" class="btn btn-lg btn-info" data-toggle="modal" data-target="#myModal">
            Confirm Location
        </button>

        <input type="hidden" id="form_latlng" name="form_latlng" value="" runat="server"/>
        <input type="hidden" id="to_latlng" name="to_latlng" value="" runat="server"/>
        <input type="hidden" id="form_address" name="form_address" value="" runat="server"/>
        <input type="hidden" id="to_address" name="to_address" value="" runat="server"/>

        <div class="btn-group" id="form-to">
            <button id="form-btn" type="button" class="btn btn-light">
                <img alt="Form" src="<%= Constant.BLUE_PIN_URL %>"/> Form
            </button>
            <button id="to-btn" type="button" class="btn btn-light">
                <img alt="Form" src="<%= Constant.RED_PIN_URL %>"/> To
            </button>
        </div>

        <script
            src="https://maps.googleapis.com/maps/api/js?key=<%= MapApiConstant.API_KEY %>&callback=initMap&libraries=places&v=weekly&language=en&region=MY_en"
            defer
        ></script>
        <script>

            var focus_form = false;
            function initMap() {


                const klLatLng = {lat: 4.2105, lng: 101.9758};
                const map = new google.maps.Map(document.getElementById("map"), {
                    zoom: 12,
                    center: klLatLng,
                    animation: google.maps.Animation.DROP,
                    mapTypeId: "roadmap"
                });
                const marker_form = new google.maps.Marker({
                    position: klLatLng,
                    map,
                    animation: google.maps.Animation.DROP,
                    title: "Form",
                    icon: {
                        url: "<%= Constant.BLUE_PIN_URL %>"
                    }
                });
                const marker_to = new google.maps.Marker({
                    position: klLatLng,
                    map,
                    title: "To Here",
                    icon: {
                        url: "<%= Constant.RED_PIN_URL %>"
                    }
                });


                // Create the search box and link it to the UI element.
                const geocoder = new google.maps.Geocoder();
                const malaysia = {componentRestrictions: {country: 'my'}};
                const booking = document.getElementById("procide-booking");
                const input_form = document.getElementById("pac-input-form");
                const input_to = document.getElementById("pac-input-to");
                const input_to_address = document.getElementById('<%= FindControl("to_address").ClientID %>');
                const input_form_address = document.getElementById('<%= FindControl("form_address").ClientID %>');
                const input_to_lat = document.getElementById('<%= FindControl("to_latlng").ClientID %>');
                const input_form_lat = document.getElementById('<%= FindControl("form_latlng").ClientID %>');
                const btn_ft = document.getElementById("form-to");
                const logo_map = document.getElementById("logo-map");
                const btn_form = document.getElementById("form-btn");
                const btn_to = document.getElementById("to-btn");
                const searchBox_form = new google.maps.places.SearchBox(input_form);
                const searchBox_to = new google.maps.places.SearchBox(input_to);
                const polylineOptionsActual = new google.maps.Polyline({
                    strokeColor: 'rgba(34,147,215,1)',
                    strokeOpacity: 0.8,
                    strokeWeight: 6
                });
                const directionsRenderer = new google.maps.DirectionsRenderer({
                    suppressMarkers: true,
                    polylineOptions: polylineOptionsActual
                });
                const directionsService = new google.maps.DirectionsService();
                const service = new google.maps.DistanceMatrixService();
                const outputDiv = document.getElementById("map-note");


                map.controls[google.maps.ControlPosition.BOTTOM_CENTER].push(booking);
                map.controls[google.maps.ControlPosition.LEFT_BOTTOM].push(btn_ft);
                map.controls[google.maps.ControlPosition.LEFT_BOTTOM].push(logo_map);
                map.controls[google.maps.ControlPosition.TOP_LEFT].push(input_form);
                map.controls[google.maps.ControlPosition.TOP_LEFT].push(input_to);
                directionsRenderer.setMap(map);


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


                map.addListener("click", (mapsMouseEvent) => {
                    if (focus_form) {
                        marker_form.setPosition(mapsMouseEvent.latLng);
                        reverseLatLng(geocoder, input_form, marker_form, map, input_form_address);
                        fitCurrentBound(marker_form.getPosition(), marker_to.getPosition(), map);
                        writeToInput(marker_form.getPosition(), input_form_lat);
                        calculateAndDisplayRoute(directionsService, directionsRenderer,
                                marker_form.getPosition(), marker_to.getPosition());
                    } else {
                        marker_to.setPosition(mapsMouseEvent.latLng);
                        reverseLatLng(geocoder, input_to, marker_to, map, input_to_address);
                        fitCurrentBound(marker_form.getPosition(), marker_to.getPosition(), map);
                        writeToInput(marker_to.getPosition(), input_to_lat);
                        calculateAndDisplayRoute(directionsService, directionsRenderer,
                                marker_form.getPosition(), marker_to.getPosition());
                    }
                });



                // Listen for the event fired when the user selects a prediction and retrieve
                // more details for that place.
                searchBox_form.addListener("places_changed", () => {
                    focus_form = true;
                    search(searchBox_form, marker_form, map);
                    fitCurrentBound(marker_form.getPosition(), marker_to.getPosition(), map);
                    writeToInput(marker_form.getPosition(), input_form_lat);
                    calculateAndDisplayRoute(directionsService, directionsRenderer,
                            marker_form.getPosition(), marker_to.getPosition());
                });

                searchBox_to.addListener("places_changed", () => {
                    focus_form = false;
                    booking.disabled = false;
                    search(searchBox_to, marker_to, map);
                    fitCurrentBound(marker_form.getPosition(), marker_to.getPosition(), map);
                    writeToInput(marker_to.getPosition(), input_to_lat);
                    calculateAndDisplayRoute(directionsService, directionsRenderer,
                            marker_form.getPosition(), marker_to.getPosition());
                });

                marker_form.addListener("click", (mapsMouseEvent) => {
                    focus_form = true;
                    setFocusBtn(focus_form);
                    fitCurrentBound(marker_form.getPosition(), marker_to.getPosition(), map);
                });

                marker_to.addListener("click", (mapsMouseEvent) => {
                    focus_form = false;
                    setFocusBtn(focus_form);
                    fitCurrentBound(marker_form.getPosition(), marker_to.getPosition(), map);
                });


                setFocusBtn(focus_form);
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

            function calculateAndDisplayRoute(directionsService, directionsRenderer, origin_p, destination_p) {
                directionsService.route(
                        {
                            origin: origin_p,
                            destination: destination_p,
                            travelMode: google.maps.TravelMode['DRIVING'],
                        },
                        (response, status) => {
                    if (status == "OK") {
                        directionsRenderer.setDirections(response);
                    } else {
                        window.alert("Directions request failed due to " + status);
                    }
                });
            }

            function setFocusBtn(focus_form) {
                const input_form_btn = document.getElementById("form-btn");
                const input_to_btn = document.getElementById("to-btn");
                if (focus_form) {
                    $("#form-btn").addClass("btn-success");
                    $("#form-btn").removeClass("btn-light");
                    $("#to-btn").removeClass("btn-success");
                    $("#to-btn").addClass("btn-light");
                } else {
                    $("#form-btn").removeClass("btn-success");
                    $("#form-btn").addClass("btn-light");
                    $("#to-btn").addClass("btn-success");
                    $("#to-btn").removeClass("btn-light");
                }
            }

            function writeToInput(position, input_latlng) {
                input_latlng.value = JSON.stringify(position.toJSON(), null, 2);
            }

            function reverseLatLng(geocoder, input, marker, map, input_address) {
                const position = marker.getPosition();
                geocoder.geocode({location: position}, (results, status) => {
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

            function fitCurrentBound(form, to, map) {
                var bounds = new google.maps.LatLngBounds();
                bounds.extend(form);
                bounds.extend(to);
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

            $(document).ready(function () {
                $("#pac-input-to").click(function () {
                    setFocusBtn(false);
                });
                $("#pac-input-form").click(function () {
                    setFocusBtn(true);
                });
                $("#form-btn").click(function () {
                    focus_form = true;
                    setFocusBtn(true);
                });
                $("#to-btn").click(function () {
                    focus_form = false;
                    setFocusBtn(false);
                });
            });
        </script>