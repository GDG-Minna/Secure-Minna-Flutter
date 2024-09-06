import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:secure_minna/components/secure_minna_colors.dart';
import 'package:secure_minna/repository/repository.dart';
import 'package:secure_minna/screens/federal_road_safety_screens/federal_road_safety_detail_page.dart';

import 'package:secure_minna/models/security_agencies_model.dart';
import 'package:secure_minna/util/app_images.dart';
import 'package:secure_minna/util/app_vectors.dart';

class FederalRoadSafetyPage extends StatefulWidget {
  static const String routeName = '/roadSafetyPage';

  const FederalRoadSafetyPage({super.key});

  @override
  State<FederalRoadSafetyPage> createState() => _FederalRoadSafetyPageState();
}

class _FederalRoadSafetyPageState extends State<FederalRoadSafetyPage> {
  TextEditingController searchController = TextEditingController();
  List<SecurityAgenciesModel> _allItems = [];
  List<SecurityAgenciesModel> _filteredItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Federal Road Safety Corps',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
              )),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Start your search here',
                  hintStyle: const TextStyle(fontSize: 13),
                  prefixIcon: const Icon(Icons.search,
                      color: SecureMinnaColors.lightBlack),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onChanged: (query) {
                  _filterItems(query);
                },
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: Repository().federalRoadSafetyJsonData(),
                builder: (context, data) {
                  if (data.hasError) {
                    return Center(
                        child: Text('${data.error}',
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Poppins',
                            )));
                  } else if (data.hasData) {
                    _allItems = data.data as List<SecurityAgenciesModel>;
                    if (_filteredItems.isEmpty &&
                        searchController.text.isEmpty) {
                      _filteredItems = _allItems;
                    }
                    return _filteredItems.isEmpty
                        ? const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.policy_outlined,
                                    color: SecureMinnaColors.lightBlack,
                                    size: 50),
                                SizedBox(height: 10),
                                Text(
                                  'We apologize, but we couldn\'t locate the information you\'re looking for.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: SecureMinnaColors.lightBlack,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemCount: _filteredItems.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  federalRoadSafetyItem(
                                      title: _filteredItems[index]
                                          .title
                                          .toString(),
                                      subTitle: _filteredItems[index]
                                          .address
                                          .toString(),
                                      icon: AppImages.roadSafetyLogo,
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FederalRoadSafetyDetailPage(
                                                        items: _filteredItems[
                                                            index])));
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
              ),
            ),
          ],
        ));
  }

  void _filterItems(String query) {
    setState(() {
      _filteredItems = _allItems
          .where((item) =>
              item.title
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              item.phoneNumber1
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              item.address
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
    });
  }

  Widget federalRoadSafetyItem(
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
