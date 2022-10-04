
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:secure_minna/components/secure_minna_colors.dart';
import 'package:secure_minna/screens/nema_screens/nema_detail_page.dart';
import 'package:secure_minna/repository/nema_repository.dart';

import '../../models/SecurityAgenciesModel.dart';

class NemaPage extends StatefulWidget {
  static const String routeName = '/nemaPage';
  @override
  _NemaPageState createState() => _NemaPageState();
}

class _NemaPageState extends State<NemaPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(
              "National Emergency Management Agency",
              style: TextStyle(
                fontWeight: FontWeight.normal,  fontFamily: 'Poppins',)
          ),
        ),
        body: FutureBuilder(
          future: NemaRepository().ReadJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              var items = data.data as List<SecurityAgenciesModel>;
              return ListView.builder(
                  itemCount: items == null ? 0 : items.length,
                  itemBuilder: (context, index) {
                    if(index == 0) {
                      return Column(
                        children: [
                          SizedBox(height: 25),
                          NemaList(
                              title: items[index].title.toString(),
                              subTitle: items[index].address.toString(),
                              icon: 'assets/images/nema.png',
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NemaDetailPage(items: items[index])));
                              }
                          )
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          NemaList(
                              title: items[index].title.toString(),
                              subTitle: items[index].address.toString(),
                              icon: 'assets/images/nema.png',
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NemaDetailPage(items: items[index])));
                              }
                          )
                        ],
                      );
                    }
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Widget NemaList(
      {required String title,
        required String subTitle,
        required String icon,
        required GestureTapCallback onTap}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  ListTile(
                      title: Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            color: SecureMinnaColors.black),
                      ),
                      subtitle: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/location.svg",
                            color: SecureMinnaColors.primary,
                            width: 12,
                            height: 12,
                          ),
                          SizedBox(width: 3),
                          Flexible(
                            child:  Text(
                              subTitle,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 11,
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF47A7E80)),
                            ),
                          )

                        ],
                      ),
                      leading: CircleAvatar(
                        backgroundColor: SecureMinnaColors.white,
                        backgroundImage: AssetImage(icon),
                      ),
                      trailing: SvgPicture.asset(
                        "assets/icons/arrow.svg",
                        color: SecureMinnaColors.primary,
                        width: 16,
                        height: 16,
                      ),
                      onTap: onTap
                  ),
                  SizedBox(height: 15),
                ],
              )
          ),
        )
      ],
    );
  }

}