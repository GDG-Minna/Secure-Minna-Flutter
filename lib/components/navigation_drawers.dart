import 'package:flutter/material.dart';
import 'package:secure_minna/routes/page_routes.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationDrawers extends StatelessWidget {
  const NavigationDrawers({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          createDrawerBodyItem(
              icon: 'assets/icons/home.svg',
              text: 'Security Agencies',
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, PageRoutes.securityAgencies);
              }),
          const Divider(),
          createDrawerBodyItem(
              icon: 'assets/icons/info.svg',
              text: 'About',
              onTap: () {
                Navigator.pushReplacementNamed(context, PageRoutes.about);
              }),
          createDrawerBodyItem(
              icon: 'assets/icons/privacy.svg',
              text: 'Privacy Policy',
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, PageRoutes.privacyPolicy);
              }),
          /*ListTile(
              title: Text('version 1.0.0'),
              onTap: () {},
            ),*/
        ],
      ),
    );
  }

  Widget createDrawerHeader() {
    return const DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            color: Color(0xFF55A3DA),
            image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage('assets/images/header_image.png'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Column(
                children: [
                  Text('Secure Minna',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500)),
                  Text('version 1.0.0',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal)),
                ],
              )),
        ]));
  }

  Widget createDrawerBodyItem(
      {required String icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          SvgPicture.asset(
            icon,
            color: const Color(0xFF585858),
            width: 25,
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text,
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontFamily: 'Poppins')),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
