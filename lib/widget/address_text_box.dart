import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:pack_collection/model/LocationIQ/LocationIQ.dart';
import 'package:pack_collection/services/autoCompleteApi.dart';

class addressBox extends StatefulWidget {
  Function(String, String) function;
  addressBox({this.function});
  @override
  _addressBoxState createState() => _addressBoxState();
}

class _addressBoxState extends State<addressBox> {
  TextEditingController addressController;
  List<LocationIQ> autoCompleteList;
  double latidude;
  double longitude;
  @override
  void initState() {
    addressController = new TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: new TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
            controller: addressController,
              autofocus: true,
              style: DefaultTextStyle.of(context).style.copyWith(
                  fontStyle: FontStyle.normal
              ),
              decoration: InputDecoration(
                  border: OutlineInputBorder()
              )
          ),
          suggestionsCallback: (pattern) async {
            if(pattern == ""){

            }else {
              return await Operations.autoCompleteApi(pattern).then((value) =>
              {
                autoCompleteList = value,
              });
            }
          },
          itemBuilder: (context, suggestion) {
            return Column(
              children: [
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text(autoCompleteList[0].display_name),
                  subtitle: Text(autoCompleteList[0].display_place),
                  onTap: (){
                    setState(() {
                      addressController.text = autoCompleteList[0].display_name;
                      widget.function(autoCompleteList[0].lat, autoCompleteList[0].lon);
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text(autoCompleteList[1].display_name),
                  subtitle: Text(autoCompleteList[1].display_place),
                  onTap: (){
                    addressController.text = autoCompleteList[1].display_name;
                    widget.function(autoCompleteList[1].lat, autoCompleteList[1].lon);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text(autoCompleteList[2].display_name),
                  subtitle: Text(autoCompleteList[2].display_place),
                  onTap: (){
                    addressController.text = autoCompleteList[2].display_name;
                    widget.function(autoCompleteList[2].lat, autoCompleteList[2].lon);
                  },
                ),
              ],
            );
          },
          onSuggestionSelected: (suggestion) {
//            Navigator.of(context).push(MaterialPageRoute(
//                builder: (context) => ProductPage(product: suggestion)
//            ));
          },
        )
      ),
    );
  }
}
