import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:secure_minna/components/secure_minna_colors.dart';
import 'package:secure_minna/repository/repository.dart';
import 'package:secure_minna/screens/hospital_screens/hospital_detail_page.dart';

import 'package:secure_minna/models/security_agencies_model.dart';
import 'package:secure_minna/util/app_images.dart';
import 'package:secure_minna/util/app_vectors.dart';

class HospitalPage extends StatefulWidget {
  static const String routeName = '/hospitalPage';

  const HospitalPage({super.key});

  @override
  State<HospitalPage> createState() => _HospitalPageState();
}

class _HospitalPageState extends State<HospitalPage> {
  TextEditingController searchController = TextEditingController();
  List<SecurityAgenciesModel> _allItems = [];
  List<SecurityAgenciesModel> _filteredItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hospitals',
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
                future: Repository().governmentHospitalJsonData(),
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
                                  hospitalItem(
                                      title: _filteredItems[index]
                                          .title
                                          .toString(),
                                      subTitle: _filteredItems[index]
                                          .address
                                          .toString(),
                                      icon: AppImages.hospitalLogo,
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HospitalDetailPage(
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

  Widget hospitalItem(
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
