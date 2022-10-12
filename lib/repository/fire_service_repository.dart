import 'dart:convert';

import 'package:flutter/services.dart' as root_bundle;
import 'package:secure_minna/models/security_agencies_model.dart';

class FireServiceRepository {
  Future<List> readJsonData() async {
    //read json file
    final jsondata = await root_bundle.rootBundle
        .loadString('assets/json/fire_service_contact.json');
    //decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;

    //map json and initialize using DataModel
    return list.map((e) => SecurityAgenciesModel.fromJson(e)).toList();
  }
}
