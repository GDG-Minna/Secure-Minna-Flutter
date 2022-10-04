import 'package:flutter/material.dart';
import 'package:secure_minna/models/SecurityAgenciesModel.dart';
import 'package:secure_minna/screens/nigeria_police_force_screens/nigeria_police_force_tab_one_page.dart';
import 'package:secure_minna/screens/nigeria_police_force_screens/nigeria_police_force_tab_two_page.dart';

class NigeriaPoliceForceDetailPage extends StatelessWidget {
  final SecurityAgenciesModel items;

  NigeriaPoliceForceDetailPage({required this.items});

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
              NigeriaPoliceForceTabOnePage(items: items,),
              NigeriaPoliceForceTabTwoPage(items: items,)
            ],
          ),
        ),
      );
  }
}
