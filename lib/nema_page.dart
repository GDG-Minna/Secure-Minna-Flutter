
import 'package:flutter/material.dart';

class NemaPage extends StatelessWidget {
  static const String routeName = '/nemaPage';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(
              "National Emergency Management Agency",
              style: TextStyle(
                fontWeight: FontWeight.normal,  fontFamily: 'Poppins',)
          ),
        ),
        body: Center(child: Text("National Emergency Management Agency")));
  }

}