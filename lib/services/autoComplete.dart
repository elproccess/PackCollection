
import 'dart:convert';
import 'package:http/http.dart' as http;


class Operations{
  static Future<List<ShopObj>> loly() async{
    List<ShopObj> ak= new List<ShopObj>();
    var res = await http.get(Uri.encodeFull("https://mrmatjar.com/kaka/dataaza"),headers: {"Accept":"application/json"});

    print(res);
    var v = json.decode(res.body);
    for(var h in v){
      ak.add(new ShopObj(h['title'], h['cost'], h['earn'], h['image']));
    }
    return ak;
  }
}