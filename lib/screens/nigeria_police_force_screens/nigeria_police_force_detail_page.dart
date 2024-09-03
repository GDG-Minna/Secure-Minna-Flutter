import 'package:flutter/material.dart';
import 'package:secure_minna/models/security_agencies_model.dart';
import 'package:secure_minna/screens/nigeria_police_force_screens/nigeria_police_force_tab_one_page.dart';
import 'package:secure_minna/screens/nigeria_police_force_screens/nigeria_police_force_tab_two_page.dart';

class NigeriaPoliceForceDetailPage extends StatelessWidget {
  final SecurityAgenciesModel items;

  const NigeriaPoliceForceDetailPage({super.key, required this.items});

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
            NigeriaPoliceForceTabOnePage(
              items: items,
            ),
            NigeriaPoliceForceTabTwoPage(
              items: items,
            )
          ],
        ),
      ),
    );
  }
}
