import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:pack_collection/model/LocationIQ.dart';
import 'package:pack_collection/services/autoCompleteApi.dart';

class addressBox extends StatefulWidget {
  @override
  _addressBoxState createState() => _addressBoxState();
}

class _addressBoxState extends State<addressBox> {
  TextEditingController addressController;
  List<LocationIQ> autoCompleteList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: new TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
              autofocus: true,
              style: DefaultTextStyle.of(context).style.copyWith(
                  fontStyle: FontStyle.italic
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
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text(autoCompleteList[1].display_name),
                  subtitle: Text(autoCompleteList[1].display_place),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text(autoCompleteList[2].display_name),
                  subtitle: Text(autoCompleteList[2].display_place),
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
