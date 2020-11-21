import 'package:cloud_firestore/cloud_firestore.dart';

class shopAddress{

  String city;
  String house_number;
  String postcode;
  String road;

  shopAddress({this.city, this.house_number, this.road, this.postcode});

  factory shopAddress.fromDocumentSnapshot(DocumentSnapshot documentSnapshot){
    return shopAddress(
      city: documentSnapshot["city"],
      house_number: documentSnapshot["house_number"],
      postcode: documentSnapshot["postcode"],
      road: documentSnapshot["road"],
    );
  }
}