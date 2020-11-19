import 'package:flutter/material.dart';

class addressBox extends StatefulWidget {
  @override
  _addressBoxState createState() => _addressBoxState();
}

class _addressBoxState extends State<addressBox> {
  TextEditingController addressController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: new TextFormField(
          decoration: new InputDecoration(
            labelText: " Enter Address",
            fillColor: Colors.white,
            //fillColor: Colors.green
          ),
          validator: (val) {
            if(val.length==0) {
              return "Email cannot be empty";
            }else{
              return null;
            }
          },
          keyboardType: TextInputType.emailAddress,
          style: new TextStyle(
            fontFamily: "Poppins",
          ),
        ),
      ),
    );
  }
}
