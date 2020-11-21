import 'package:flutter/material.dart';
import 'package:pack_collection/widget/address_text_box.dart';
import 'package:pack_collection/widget/google_map.dart';
import 'package:pack_collection/widget/responsiveBuilder.dart';
import 'package:responsive_scaffold/responsive_scaffold.dart';
import 'map_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          body: responsiveBuilder(
            drawer: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings Page'),
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text('Info Page'),
                ),
                ListTile(
                  leading: Icon(Icons.library_books),
                  title: Text('Library Page'),
                ),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Help Page'),
                ),
              ],
            ),
            body: mapScreen(),
          ),
      ),
    );
  }
}

