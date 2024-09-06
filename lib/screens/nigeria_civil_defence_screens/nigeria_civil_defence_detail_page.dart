import 'package:flutter/material.dart';
import 'package:secure_minna/models/security_agencies_model.dart';
import 'package:secure_minna/screens/nigeria_civil_defence_screens/nigeria_civil_defence_tab_one_page.dart';
import 'package:secure_minna/screens/nigeria_civil_defence_screens/nigeria_civil_defence_tab_two_page.dart';

class NigerianCivilDefenceDetailPage extends StatelessWidget {
  final SecurityAgenciesModel items;

  const NigerianCivilDefenceDetailPage({super.key, required this.items});

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
            NigeriaCivilDefenceTabOnePage(
              items: items,
            ),
            NigeriaCivilDefenceTabTwoPage(
              items: items,
            )
          ],
        ),
      ),
    );
  }
}
