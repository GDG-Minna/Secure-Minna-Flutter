import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:secure_minna/components/secure_minna_colors.dart';
import 'package:secure_minna/repository/repository.dart';
import 'package:secure_minna/screens/nema_screens/nema_detail_page.dart';

import 'package:secure_minna/models/security_agencies_model.dart';
import 'package:secure_minna/util/app_images.dart';
import 'package:secure_minna/util/app_vectors.dart';

class NemaPage extends StatefulWidget {
  static const String routeName = '/nemaPage';

  const NemaPage({super.key});
  @override
  State<NemaPage> createState() => _NemaPageState();
}

class _NemaPageState extends State<NemaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('National Emergency Management Agency',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
              )),
        ),
        body: FutureBuilder(
          future: Repository().nemaJsonData(),
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
                        nemaItem(
                            title: items[index].title.toString(),
                            subTitle: items[index].address.toString(),
                            icon: AppImages.nemaLogo,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          NemaDetailPage(items: items[index])));
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

  Widget nemaItem(
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
                            color: SecureMinnaColors.black),
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
                        backgroundColor: SecureMinnaColors.white,
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
