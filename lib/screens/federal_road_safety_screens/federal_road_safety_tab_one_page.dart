import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/SecurityAgenciesModel.dart';

class FederalRoadSafetyTabOnePage extends StatefulWidget {
  final SecurityAgenciesModel items;

  FederalRoadSafetyTabOnePage({required this.items});

  @override
  State<FederalRoadSafetyTabOnePage> createState() => _FederalRoadSafetyTabOnePageState();
}
class _FederalRoadSafetyTabOnePageState extends State<FederalRoadSafetyTabOnePage> {
  late final Uri _urlCall;
  late final Uri _urlSMS;

  final ButtonStyle filledStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 14),
      minimumSize: const Size.fromHeight(50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))
  );
  final ButtonStyle outlineStyle = OutlinedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 14),
      minimumSize: const Size.fromHeight(50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      side: BorderSide(color: Color(0xFF55A3DA), width: 2)
  );

  @override
  void initState() {
    super.initState();
    _urlCall = Uri.parse('tel://${widget.items.phoneNumber1}');
     _urlSMS = Uri(
        scheme: 'sms',
        path: '${widget.items.phoneNumber1}',
        query: encodeQueryParameters(<String, String>{
          'body' : 'Help is required at: '
        })
    );
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
  Future<void> _launchCall() async{
    if(!await launchUrl(_urlCall)) {
      throw 'Could not launch $_urlCall';
    }
  }
  Future<void> _launchSMS() async{
    if(!await launchUrl(_urlSMS)) {
      throw 'Could not launch $_urlSMS';
    }
  }

  @override
  Widget build(BuildContext context) {
    // final mqHeight = MediaQuery.of(context).size.height + 60.3;
    final mqWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 795,
            width: mqWidth,
            child: Stack(
              children: [
                Positioned(
                    left: 10,
                    top: 20,
                    right: 10,
                    child: Container(
                      height: 246,
                      width: 566,
                      child: Card(
                        elevation: 1,
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: EdgeInsets.all(5),
                        child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/road_safety_header.png"),
                        ),
                      ),
                    )),
                Positioned(
                    left: 10,
                    top: 190,
                    right: 10,
                    child: Container(
                      height: 132,
                      width: 132,
                      child: Image(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/images/road_safety_body.png"),
                      ),
                    )
                ),
                Positioned(
                  left: 10,
                  top: 320,
                  right: 10,
                  child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                              "${widget.items.title}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF474747))),
                          SizedBox(height: 5),
                          Text(
                              "Emergency Number",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF55A3DA))),
                          SizedBox(height: 5),
                          Text(
                              "${widget.items.phoneNumber1}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF7A7E80))),
                          SizedBox(height: 16),
                          Divider(),
                          SizedBox(height: 20),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15,0,0,0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                    "Email Address",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF474747))),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15,5,0,0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                    "${widget.items.email}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF7A7E80))),
                              ),
                            ),
                          ),
                          SizedBox(height: 22),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15,0,0,0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                    "Address",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF474747))),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15,5,0,0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                    "${widget.items.address}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF7A7E80))),
                              ),
                            ),
                          ),
                          SizedBox(height: 19),
                          Divider(),
                          SizedBox(height: 28),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15,5,15,0),
                              child: Align(
                                  alignment: Alignment.center,
                                  child:  ElevatedButton(
                                    style: filledStyle,
                                    onPressed:() {
                                      _launchCall();
                                    },
                                    child: const Text(
                                        "Emergency Call",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            color: Color(0xFFFFFFFF))),
                                  )
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15,5,15,0),
                              child: Align(
                                  alignment: Alignment.center,
                                  child:  OutlinedButton(
                                    style: outlineStyle,
                                    onPressed:() {
                                      _launchSMS();
                                    },
                                    child: const Text(
                                        "Send SMS",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF55A3DA))),
                                  )
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      )
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}
