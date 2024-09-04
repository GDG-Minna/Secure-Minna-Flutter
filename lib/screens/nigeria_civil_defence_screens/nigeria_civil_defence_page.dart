import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:secure_minna/repository/repository.dart';

import 'package:secure_minna/models/security_agencies_model.dart';
import 'package:secure_minna/screens/nigeria_civil_defence_screens/nigeria_civil_defence_detail_page.dart';

import 'package:secure_minna/components/secure_minna_colors.dart';
import 'package:secure_minna/util/app_images.dart';
import 'package:secure_minna/util/app_vectors.dart';

class NigeriaCivilDefencePage extends StatefulWidget {
  static const String routeName = '/civilDefencePage';

  const NigeriaCivilDefencePage({super.key});

  @override
  State<NigeriaCivilDefencePage> createState() =>
      _NigerianCivilDefencePageState();
}

class _NigerianCivilDefencePageState extends State<NigeriaCivilDefencePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nigeria Security and Civil Defence Corps',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
              )),
        ),
        body: FutureBuilder(
          future: Repository().civilDefenseJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text('${data.error}'));
            } else if (data.hasData) {
              var items = data.data as List<SecurityAgenciesModel>;
              return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        civilDefenceItem(
                            title: items[index].title.toString(),
                            subTitle: items[index].address.toString(),
                            icon: AppImages.civilDefenceLogo,
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
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Widget civilDefenceItem(
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
                            AppVectors.locationIcon,
                            colorFilter: const ColorFilter.mode(
                                SecureMinnaColors.primary, BlendMode.srcIn),
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
                                  color: SecureMinnaColors.lightWhite),
                            ),
                          )
                        ],
                      ),
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFFFFFFFF),
                        backgroundImage: AssetImage(icon),
                      ),
                      trailing: SvgPicture.asset(
                        AppVectors.arrowRightIcon,
                        colorFilter: const ColorFilter.mode(
                            SecureMinnaColors.primary, BlendMode.srcIn),
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
