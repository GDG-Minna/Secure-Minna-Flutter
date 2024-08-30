import 'package:flutter/material.dart';
import 'package:secure_minna/models/SecurityAgenciesModel.dart';
import 'package:secure_minna/screens/federal_fire_service_screens/federal_fire_service_tab_one_page.dart';
import 'package:secure_minna/screens/federal_road_safety_screens/federal_road_safety_tab_two_page.dart';

class FederalFireServiceDetailPage extends StatefulWidget {
  final SecurityAgenciesModel items;

  const FederalFireServiceDetailPage({super.key, required this.items});

  @override
  State<FederalFireServiceDetailPage> createState() =>
      _FederalFireServiceDetailPageState();
}

class _FederalFireServiceDetailPageState
    extends State<FederalFireServiceDetailPage>
    with AutomaticKeepAliveClientMixin<FederalFireServiceDetailPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('${widget.items.title}',
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
              )),
          bottom: const TabBar(
            tabs: [
              Tab(
                /*icon: Icon(Icons.contacts),*/
                text: 'Emergency Call',
              ),
              Tab(
                /*icon: Icon(Icons.contacts),*/
                text: 'Map Location',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FederalFireServiceTabOnePage(
              items: widget.items,
            ),
            FederalRoadSafetyTabTwoPage(
              items: widget.items,
            )
          ],
        ),
      ),
    );
  }
}
