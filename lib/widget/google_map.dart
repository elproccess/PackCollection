import 'package:flutter/material.dart';
import 'dart:html';
import 'dart:ui' as ui;
import 'package:google_maps/google_maps.dart';


Widget getMap(double latitude, double longitude) {
  //A unique id to name the div element
  String htmlId = "6";
  //creates a webview in dart
  ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
    final latLang = LatLng(51.461868, -0.230618);
    //class to create a div element

    final mapOptions = MapOptions()
      ..zoom = 15
      ..tilt = 90
      ..draggable = false
      ..clickableIcons = false
      ..disableDefaultUI = false
      ..zoomControl = true
      ..mapTypeControl = false
      ..fullscreenControl = false
      ..overviewMapControl = false
      ..center = latLang;
    final elem = DivElement()
      ..id = htmlId
      ..style.width = "100%"
      ..style.height = "100%"
      ..style.border = "none";

    final map = GMap(elem, mapOptions);
    Marker(MarkerOptions()
      ..position = latLang
      ..map = map
      ..title = 'My position',);
    return elem;
  });
  //creates a platform view for Flutter Web
  return HtmlElementView(
    viewType: htmlId,
  );
}