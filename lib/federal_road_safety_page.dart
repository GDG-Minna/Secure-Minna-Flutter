
import 'package:flutter/material.dart';

class FederalRoadSafetyPage extends StatelessWidget {
  static const String routeName = '/roadSafetyPage';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(
              "Federal Road Safety Corps",
              style: TextStyle(
                fontWeight: FontWeight.normal,  fontFamily: 'Poppins',)
          ),
        ),
        body: Center(child: Text("Federal Road Safety Corps")));
  }

}