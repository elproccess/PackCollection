import 'package:cloud_firestore/cloud_firestore.dart';

import 'shopAddress.dart';

class shop{
  String name;
  shopAddress address;
  String email;
  int packages;

  shop({this.name, this.address, this.email, this.packages});

  factory shop.fromDocumentSnapshot(DocumentSnapshot documentSnapshot){
    return shop(
      name: documentSnapshot["name"],
      address: documentSnapshot["address"],
      email: documentSnapshot["email"],
      packages: documentSnapshot["packages"],
    );
  }

}