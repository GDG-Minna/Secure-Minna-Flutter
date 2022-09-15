
import 'package:flutter/material.dart';
import 'package:secure_minna/models/SecurityAgenciesModel.dart';

class NigeriaPoliceForceDetailPage extends StatelessWidget {

  final SecurityAgenciesModel items;

  NigeriaPoliceForceDetailPage({required this.items});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(
              "${items.title}",
              style: TextStyle(
                fontWeight: FontWeight.normal,  fontFamily: 'Poppins',)
          ),
        ),
        body: Center(child: Text("${items.email}")));
  }

}