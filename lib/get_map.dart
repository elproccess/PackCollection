import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:html';
import 'dart:ui' as ui;
import 'package:google_maps/google_maps.dart';
import 'package:js/js.dart';
import 'locationJs.dart';

double longitude;
double latitude;

Widget getMap() {
  _getCurrentLocation();
  //A unique id to name the div element
  String htmlId = "6";
  //creates a webview in dart
  ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
    final latLang = LatLng(51.46316686, -0.23683797);
    //class to create a div element

    final mapOptions = MapOptions()
      ..zoom = 11
      ..tilt = 90
      ..center = latLang;
    final elem = DivElement()
      ..id = htmlId
      ..style.width = "100%"
      ..style.height = "100%"
      ..style.border = "none";

    final map = GMap(elem, mapOptions);
    Marker(MarkerOptions()
      ..position = LatLng(longitude, latitude)
      ..map = map
      ..title = 'My position');
    return elem;
  });
  //creates a platform view for Flutter Web
  return HtmlElementView(
    viewType: htmlId,
  );
}

success(pos) {
  try {
    longitude = pos.coords.longitude;
    latitude = pos.coords.latitude;
    print(pos.coords.latitude);
    print(pos.coords.longitude);
  } catch (ex) {
    print("Exception thrown : " + ex.toString());
  }
}

_getCurrentLocation() {
  if (kIsWeb) {
    getCurrentPosition(allowInterop((pos) => success(pos)));
  }
}

