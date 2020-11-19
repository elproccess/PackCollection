
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pack_collection/model/LocationIQ.dart';


class Operations{
  static Future<List<LocationIQ>> autoCompleteApi() async{
    //List<LocationIQ> ak= new List<LocationIQ>();
    var res = await http.get(Uri.encodeFull("https://api.locationiq.com/v1/autocomplete.php?key=pk.268a6d3f5d038fcd2426c3f3b628a69a&q=Empire"),headers: {"Accept":"application/json"});

    print(res.body);
    var v = json.decode(res.body);
   // var rest = v["response"] as List;
    return v.map<LocationIQ>((json) => LocationIQ.fromJson(json)).toList();
  }
}