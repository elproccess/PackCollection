import 'package:flutter/material.dart';
import 'get_map.dart';

class mapScreen extends StatefulWidget {
  @override
  _mapScreenState createState() => _mapScreenState();
}

class _mapScreenState extends State<mapScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: getMap(),
    );
  }
}

