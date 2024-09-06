import 'dart:convert';

import 'package:flutter/services.dart' as root_bundle;
import 'package:secure_minna/models/security_agencies_model.dart';

class Repository {
  Future<List> civilDefenseJsonData() async {
    //read json file
    final jsonData = await root_bundle.rootBundle
        .loadString('assets/json/civil_defence_contact.json');
    //decode json data as list
    final list = json.decode(jsonData) as List<dynamic>;

    //map json and initialize using DataModel
    return list.map((e) => SecurityAgenciesModel.fromJson(e)).toList();
  }

  Future<List> governmentHospitalJsonData() async {
    //read json file
    final jsonData = await root_bundle.rootBundle
        .loadString('assets/json/hospitals_contact.json');
    //decode json data as list
    final list = json.decode(jsonData) as List<dynamic>;

    //map json and initialize using DataModel
    return list.map((e) => SecurityAgenciesModel.fromJson(e)).toList();
  }

  Future<List> federalFireServiceJsonData() async {
    //read json file
    final jsonData = await root_bundle.rootBundle
        .loadString('assets/json/fire_service_contact.json');
    //decode json data as list
    final list = json.decode(jsonData) as List<dynamic>;

    //map json and initialize using DataModel
    return list.map((e) => SecurityAgenciesModel.fromJson(e)).toList();
  }

  Future<List> nemaJsonData() async {
    //read json file
    final jsonData = await root_bundle.rootBundle
        .loadString('assets/json/nema_contact.json');
    //decode json data as list
    final list = json.decode(jsonData) as List<dynamic>;

    //map json and initialize using DataModel
    return list.map((e) => SecurityAgenciesModel.fromJson(e)).toList();
  }

  Future<List> policeJsonData() async {
    //read json file
    final jsonData = await root_bundle.rootBundle
        .loadString('assets/json/police_contact.json');
    //decode json data as list
    final list = json.decode(jsonData) as List<dynamic>;

    //map json and initialize using DataModel
    return list.map((e) => SecurityAgenciesModel.fromJson(e)).toList();
  }

  Future<List> federalRoadSafetyJsonData() async {
    //read json file
    final jsonData = await root_bundle.rootBundle
        .loadString('assets/json/road_safety_contact.json');
    //decode json data as list
    final list = json.decode(jsonData) as List<dynamic>;

    //map json and initialize using DataModel
    return list.map((e) => SecurityAgenciesModel.fromJson(e)).toList();
  }
}
