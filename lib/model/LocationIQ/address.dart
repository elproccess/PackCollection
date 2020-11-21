
class address{
  String name;
  String house_number;
  String road;
  String city;
  String state;
  String postcode;
  String country;

  address({this.name, this.house_number, this.road, this.city, this.state, this.postcode, this.country});

  factory address.fromJson(Map<String, dynamic> json) {
    return address(
      name: json["name"] as String,
      house_number: json["house_number"] as String,
      road: json["road"] as String,
      city: json["city"] as String,
      state: json["state"] as String,
      postcode: json["postcode"] as String,
      country: json["country"] as String,
    );
  }

}