
import 'package:flutter/material.dart';
import 'package:secure_minna/models/SecurityAgenciesModel.dart';
import 'package:secure_minna/screens/federal_fire_service_screens/federal_fire_service_tab_one_page.dart';
import 'package:secure_minna/screens/federal_road_safety_screens/federal_road_safety_tab_two_page.dart';

class FederalFireServiceDetailPage extends StatelessWidget {

  final SecurityAgenciesModel items;

  FederalFireServiceDetailPage({required this.items});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("${items.title}",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
              )),
          bottom: TabBar(
            tabs: [
              Tab(
                /*icon: Icon(Icons.contacts),*/
                text: "Emergency Call",
              ),
              Tab(
                /*icon: Icon(Icons.contacts),*/
                text: "Map Location",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FederalFireServiceTabOnePage(items: items,),
            FederalRoadSafetyTabTwoPage(items: items,)
          ],
        ),
      ),
    );
  }

}