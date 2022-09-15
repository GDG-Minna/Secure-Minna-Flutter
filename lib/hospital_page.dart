
import 'package:flutter/material.dart';

class HospitalPage extends StatelessWidget {
  static const String routeName = '/hospitalPage';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(
              "Hospitals",
              style: TextStyle(
                fontWeight: FontWeight.normal,  fontFamily: 'Poppins',)
          ),
        ),
        body: Center(child: Text("Hospitals")));
  }

}