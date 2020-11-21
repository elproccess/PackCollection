import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:js/js.dart';
import 'package:pack_collection/model/LocationIQ/LocationIQ.dart';
import 'package:pack_collection/widget/google_map.dart';
import 'services/locationJs.dart';
import 'widget/address_text_box.dart';

class mapScreen extends StatefulWidget {
  @override
  _mapScreenState createState() => _mapScreenState();
}

class _mapScreenState extends State<mapScreen> {

  List<LocationIQ> autoCompleteList;
  var selectedValue = 0;
  var isLargeScreen = false;

  @override
  void initState() {

//    Operations.autoCompleteApi().then((value) => {
//      autoCompleteList = value,
//    });
    super.initState();
  }

  getLatLong(String lat , String long){
    List<String> f = new List<String>();
    f.add(lat);
    f.add(long);
    print(f[0]);
    print(f[1]);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        addressBox(function: getLatLong,),
        Expanded(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              children: [
                Expanded(child: getMap(0.0, 0.0)),
              ],
            ),

          ),
        ),
      ],
    );
  }
}

//success(pos) {
//  try {
//    double longitude = pos.coords.longitude;
//    double latitude = pos.coords.latitude;
//    getLocation(longitude, latitude);
//    print(pos.coords.latitude);
//    print(pos.coords.longitude);
//  } catch (ex) {
//    print("Exception thrown : " + ex.toString());
//  }
//}
//void getLocation(double latitude, longitude){
//  _mapScreenState().longitude = latitude;
//  _mapScreenState().latitude = latitude;
//   new LatLng(latitude, longitude);
//}
//Future<LatLng> _getCurrentLocation()async {
//  if (kIsWeb) {
//    getCurrentPosition(allowInterop((pos) {
//      _mapScreenState().longitude =pos.coords.longitude;
//      _mapScreenState().latitude = pos.coords.latitude;
//      return success(pos);
//    }));
//  }
//  return await LatLng(_mapScreenState().latitude, _mapScreenState().longitude);
//}

