import 'address.dart';

class LocationIQ{
  String place_id;
  String osm_id;
  String osm_type;
  String licence;
  String lat;
  String lon;
  List<dynamic> boundingbox;
  String class_;
  String type;
  String display_name;
  String display_place;
  String display_address;
  address addres;

  LocationIQ({this.place_id,
    this.osm_id,
    this.osm_type,
    this.licence,
    this.lat,
    this.lon,
    this.boundingbox,
    this.class_,
    this.type,
    this.display_name,
    this.display_place,
    this.addres,
  });


  factory LocationIQ.fromJson(Map<String, dynamic> json) {
    return LocationIQ(
      place_id: json["place_id"],
      osm_id: json["osm_id"],
      osm_type: json["osm_type"],
      licence: json["licence"],
      lat: json["lat"],
      lon: json["lon"],
      boundingbox: json["boundingbox"],
      class_: json["class"],
      type: json["type"],
      display_name: json["display_name"],
      display_place: json["display_place"],
      addres: address.fromJson(json["address"]),
    );
  }
}