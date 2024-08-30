import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:secure_minna/routes/page_routes.dart';

import 'package:secure_minna/components/navigation_drawers.dart';

class SecurityAgenciesPage extends StatelessWidget {
  static const String routeName = '/securityAgenciesPage';

  const SecurityAgenciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Secure Minna'),
        ),
        drawer: const NavigationDrawers(),
        body: ListView(padding: EdgeInsets.zero, children: <Widget>[
          const SizedBox(height: 15),
          createHeader(),
          const SizedBox(height: 25),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 45),
            child: Text(
                'Contact and Report Cases of Crimes, Conflicts or Disasters to Emergency Centres around Minna Metropolis',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    color: Color(0xFF7A7E80))),
          ),
          const SizedBox(height: 34),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text('Emergency Contacts',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    color: Color(0xFF474747))),
          ),
          const SizedBox(height: 14),
          listItems(
              title: 'Nigeria Police Force',
              subTitle: 'Crime and Suspicious Activities',
              icon: 'assets/images/police.png',
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.police);
              }),
          const SizedBox(height: 8),
          listItems(
              title: 'Nigeria Security and Civil Defence Corps',
              subTitle: 'Crisis and Neighborhood Conflicts',
              icon: 'assets/images/civil_defence.png',
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.civilDefence);
              }),
          const SizedBox(height: 8),
          listItems(
              title: 'Federal Road Safety Corps',
              subTitle: 'Accidents and Highway Related Emergency',
              icon: 'assets/images/road_safety.png',
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.roadSafety);
              }),
          const SizedBox(height: 8),
          listItems(
              title: 'National Emergency Management Agency',
              subTitle: 'Disaster and Response Emergency',
              icon: 'assets/images/nema.png',
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.nema);
              }),
          const SizedBox(height: 8),
          listItems(
              title: 'Federal Fire Service',
              subTitle: 'Fire Accidents Emergency',
              icon: 'assets/images/fire_service.png',
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.fireService);
              }),
          const SizedBox(height: 8),
          listItems(
              title: 'Hospitals',
              subTitle: 'Health and Accidents Emergency',
              icon: 'assets/images/hospital.png',
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.hospital);
              }),
          const SizedBox(height: 15),
        ]));
  }

  Widget listItems(
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
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    color: Color(0xFF000000)),
              ),
              subtitle: Text(
                subTitle,
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 11,
                    fontFamily: 'Poppins',
                    color: Color(0xFF7A7E80)),
              ),
              leading: CircleAvatar(
                backgroundColor: const Color(0xFFFFFFFF),
                backgroundImage: AssetImage(icon),
              ),
              trailing: SvgPicture.asset(
                'assets/icons/arrow.svg',
                color: const Color(0xFF55A3DA),
                width: 16,
                height: 16,
              ),
              onTap: onTap)),
    );
  }

  Widget createHeader() {
    return Column(
      children: [buildImage('assets/images/header_security.png')],
    );
  }

  Widget buildImage(String path) => Center(child: Image.asset(path));
}
