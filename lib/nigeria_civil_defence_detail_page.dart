
import 'package:flutter/material.dart';
import 'package:secure_minna/models/SecurityAgenciesModel.dart';

class NigerianCivilDefenceDetailPage extends StatelessWidget {

  final SecurityAgenciesModel items;

  NigerianCivilDefenceDetailPage({required this.items});

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