
import 'package:flutter/material.dart';

class FederalFireServicePage extends StatelessWidget {
  static const String routeName = '/fireServicePage';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(
              "Federal Fire Service",
              style: TextStyle(
                fontWeight: FontWeight.normal,  fontFamily: 'Poppins',)
          ),
        ),
        body: Center(child: Text("Federal Fire Service")));
  }

}