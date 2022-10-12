import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:secure_minna/repository/civil_defence_repository.dart';

import '../../models/security_agencies_model.dart';
import 'nigeria_civil_defence_detail_page.dart';

// ignore: use_key_in_widget_constructors
class NigeriaCivilDefencePage extends StatefulWidget {
  static const String routeName = '/civilDefencePage';

  @override
  State<NigeriaCivilDefencePage> createState() =>
      _NigerianCivilDefencePageState();
}

class _NigerianCivilDefencePageState extends State<NigeriaCivilDefencePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Nigeria Security and Civil Defence Corps",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
              )),
        ),
        body: FutureBuilder(
          future: CivilDefenceRepository().readJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              var items = data.data as List<SecurityAgenciesModel>;
              return ListView.builder(
                  itemCount: items.isEmpty ? 0 : items.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Column(
                        children: [
                          const SizedBox(height: 25),
                          civilDefenceList(
                              title: items[index].title.toString(),
                              subTitle: items[index].address.toString(),
                              icon: 'assets/images/civil_defence.png',
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NigerianCivilDefenceDetailPage(
                                                items: items[index])));
                              })
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          civilDefenceList(
                              title: items[index].title.toString(),
                              subTitle: items[index].address.toString(),
                              icon: 'assets/images/civil_defence.png',
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NigerianCivilDefenceDetailPage(
                                                items: items[index])));
                              })
                        ],
                      );
                    }
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Widget civilDefenceList(
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
                  const SizedBox(height: 15),
                  ListTile(
                      title: Text(
                        title,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            color: Color(0xFF000000)),
                      ),
                      subtitle: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/location.svg",
                            color: const Color(0xFF55A3DA),
                            width: 12,
                            height: 12,
                          ),
                          const SizedBox(width: 3),
                          Flexible(
                            child: Text(
                              subTitle,
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 11,
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF7A7E80)),
                            ),
                          )
                        ],
                      ),
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFFFFFFFF),
                        backgroundImage: AssetImage(icon),
                      ),
                      trailing: SvgPicture.asset(
                        "assets/icons/arrow.svg",
                        color: const Color(0xFF55A3DA),
                        width: 16,
                        height: 16,
                      ),
                      onTap: onTap),
                  const SizedBox(height: 15),
                ],
              )),
        )
      ],
    );
  }
}
