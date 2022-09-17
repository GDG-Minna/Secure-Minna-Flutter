import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:secure_minna/routes/page_routes.dart';

import '../../components/navigation_drawer.dart';

class SecurityAgenciesPage extends StatelessWidget {
  static const String routeName = '/securityAgenciesPage';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Secure Minna"),
        ),
        drawer: NavigationDrawer(),
        body: ListView(padding: EdgeInsets.zero, children: <Widget>[
          SizedBox(height: 15),
          createHeader(),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: Text(
                "Contact and Report Cases of Crimes, Conflicts or Disasters to Emergency Centres around Minna Metropolis",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    color: Color(0xFF7A7E80))),
          ),
          SizedBox(height: 34),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text("Emergency Contacts",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    color: Color(0xFF474747))),
          ),
          SizedBox(height: 14),
          ListItems(
              title: "Nigeria Police Force",
              subTitle: "Crime and Suspicious Activities",
              icon: 'assets/images/police.png',
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.police);
              }),
          SizedBox(height: 8),
          ListItems(
              title: "Nigeria Security and Civil Defence Corps",
              subTitle: "Crisis and Neighborhood Conflicts",
              icon: 'assets/images/civil_defence.png',
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.civilDefence);
              }),
          SizedBox(height: 8),
          ListItems(
              title: "Federal Road Safety Corps",
              subTitle: "Accidents and Highway Related Emergency",
              icon: 'assets/images/road_safety.png',
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.roadSafety);
              }),
          SizedBox(height: 8),
          ListItems(
              title: "National Emergency Management Agency",
              subTitle: "Disaster and Response Emergency",
              icon: 'assets/images/nema.png',
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.nema);
              }),
          SizedBox(height: 8),
          ListItems(
              title: "Federal Fire Service",
              subTitle: "Fire Accidents Emergency",
              icon: 'assets/images/fire_service.png',
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.fireService);
              }),
          SizedBox(height: 8),
          ListItems(
              title: "Hospitals",
              subTitle: "Health and Accidents Emergency",
              icon: 'assets/images/hospital.png',
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.hospital);
              }),
          SizedBox(height: 15),
        ]));
  }

  Widget ListItems(
      {required String title,
      required String subTitle,
      required String icon,
      required GestureTapCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
              title: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    color: Color(0xFF000000)),
              ),
              subtitle: Text(
                subTitle,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 11,
                    fontFamily: 'Poppins',
                    color: Color(0xFF7A7E80)),
              ),
              leading: CircleAvatar(
                backgroundColor: Color(0xFFFFFFFF),
                backgroundImage: AssetImage(icon),
              ),
              trailing: SvgPicture.asset(
                "assets/icons/arrow.svg",
                color: Color(0xFF55A3DA),
                width: 16,
                height: 16,
              ),
              onTap: onTap)),
    );
  }

  Widget createHeader() {
    return Container(
      child: Column(
        children: [buildImage('assets/images/header_security.png')],
      ),
    );
  }

  Widget buildImage(String path) => Center(child: Image.asset(path));
}
