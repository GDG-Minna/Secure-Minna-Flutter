import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;
import 'package:secure_minna/models/SecurityAgenciesModel.dart';
class FireServiceRepository {
  Future<List> ReadJsonData() async {
    //read json file
    final jsondata = await rootBundle.rootBundle.loadString('assets/json/fire_service_contact.json');
    //decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;

    //map json and initialize using DataModel
    return list.map((e) => SecurityAgenciesModel.fromJson(e)).toList();
  }
}