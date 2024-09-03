import 'package:flutter/material.dart';
import 'package:secure_minna/models/security_agencies_model.dart';
import 'package:secure_minna/screens/federal_road_safety_screens/federal_road_safety_tab_one_page.dart';
import 'package:secure_minna/screens/federal_road_safety_screens/federal_road_safety_tab_two_page.dart';

class FederalRoadSafetyDetailPage extends StatelessWidget {
  final SecurityAgenciesModel items;

  const FederalRoadSafetyDetailPage({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('${items.title}',
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
              )),
          bottom: const TabBar(
            dividerColor: Colors.transparent,
            tabs: [
              Tab(
                text: 'Emergency Call',
              ),
              Tab(
                text: 'Map Location',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FederalRoadSafetyTabOnePage(
              items: items,
            ),
            FederalRoadSafetyTabTwoPage(
              items: items,
            )
          ],
        ),
      ),
    );
  }
}
