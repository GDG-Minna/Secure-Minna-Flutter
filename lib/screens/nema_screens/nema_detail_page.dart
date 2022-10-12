import 'package:flutter/material.dart';
import 'package:secure_minna/models/security_agencies_model.dart';
import 'package:secure_minna/screens/nema_screens/nema_tab_two_page.dart';

import 'nema_tab_one_page.dart';

class NemaDetailPage extends StatelessWidget {
  final SecurityAgenciesModel items;

  const NemaDetailPage({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("${items.title}",
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
              )),
          bottom: const TabBar(
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
            NemaTabOnePage(
              items: items,
            ),
            NemaTabTwoPage(
              items: items,
            )
          ],
        ),
      ),
    );
  }
}
