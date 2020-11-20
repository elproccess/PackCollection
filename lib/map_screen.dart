import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:html';
import 'dart:ui' as ui;
import 'package:google_maps/google_maps.dart';
import 'package:js/js.dart';
import 'package:pack_collection/model/LocationIQ.dart';
import 'services/locationJs.dart';
import 'services/autoCompleteApi.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'widget/address_text_box.dart';

class mapScreen extends StatefulWidget {
  @override
  _mapScreenState createState() => _mapScreenState();
}

class _mapScreenState extends State<mapScreen> {

  double latitude;
  double longitude;
  List<LocationIQ> autoCompleteList;

  @override
  void initState() {
    _getCurrentLocation().then((value) => {
      longitude = value.lng,
      latitude = value.lat,
    });

//    Operations.autoCompleteApi().then((value) => {
//      autoCompleteList = value,
//    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _getCurrentLocation(),
        builder: (context, snapshot){
          return Column(
            children: [
              addressBox(),
              Expanded(child: getMap(latitude, longitude)),
            ],
          );
        },
      ),
    );
  }
}

Widget getMap(double latitude, double longitude) {
  _getCurrentLocation();
  //A unique id to name the div element
  String htmlId = "6";
  //creates a webview in dart
  ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
    final latLang = LatLng(latitude, longitude);
    //class to create a div element

    final mapOptions = MapOptions()
      ..zoom = 11
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

success(pos) {
  try {
    double longitude = pos.coords.longitude;
    double latitude = pos.coords.latitude;
    getLocation(longitude, latitude);
    print(pos.coords.latitude);
    print(pos.coords.longitude);
  } catch (ex) {
    print("Exception thrown : " + ex.toString());
  }
}
void getLocation(double latitude, longitude){
  _mapScreenState().longitude = latitude;
  _mapScreenState().latitude = latitude;
   new LatLng(latitude, longitude);
}
Future<LatLng> _getCurrentLocation()async {
  if (kIsWeb) {
    getCurrentPosition(allowInterop((pos) {
      _mapScreenState().longitude =pos.coords.longitude;
      _mapScreenState().latitude = pos.coords.latitude;
      return success(pos);
    }));
  }
  return await LatLng(_mapScreenState().latitude, _mapScreenState().longitude);
}

