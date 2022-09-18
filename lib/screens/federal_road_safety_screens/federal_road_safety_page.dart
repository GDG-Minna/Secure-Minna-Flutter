
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:secure_minna/screens/federal_road_safety_screens/federal_road_safety_detail_page.dart';
import 'package:secure_minna/repository/road_safety_repository.dart';

import '../../models/SecurityAgenciesModel.dart';

class FederalRoadSafetyPage extends StatefulWidget {
  static const String routeName = '/roadSafetyPage';

  @override
  _FederalRoadSafetyPageState createState() => _FederalRoadSafetyPageState();
}
class _FederalRoadSafetyPageState extends State<FederalRoadSafetyPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(
              "Federal Road Safety Corps",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',)
          ),
        ),
        body: FutureBuilder(
          future: RoadSafetyRepository().ReadJsonData(),
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
                          RoadSafetyList(
                              title: items[index].title.toString(),
                              subTitle: items[index].address.toString(),
                              icon: 'assets/images/road_safety.png',
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FederalRoadSafetyDetailPage(items: items[index])));
                              }
                          )
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          RoadSafetyList(
                              title: items[index].title.toString(),
                              subTitle: items[index].address.toString(),
                              icon: 'assets/images/road_safety.png',
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FederalRoadSafetyDetailPage(items: items[index])));
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

  Widget RoadSafetyList(
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
                            color: Color(0xFF000000)),
                      ),
                      subtitle: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/location.svg",
                            color: Color(0xFF55A3DA),
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
                                  color: Color(0xFF7A7E80)),
                            ),
                          )

                        ],
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