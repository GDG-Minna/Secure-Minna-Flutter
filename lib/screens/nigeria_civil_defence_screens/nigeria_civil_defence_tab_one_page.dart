import 'package:flutter/material.dart';
import 'package:secure_minna/components/secure_minna_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:secure_minna/models/security_agencies_model.dart';

class NigeriaCivilDefenceTabOnePage extends StatefulWidget {
  final SecurityAgenciesModel items;

  const NigeriaCivilDefenceTabOnePage({super.key, required this.items});

  @override
  State<NigeriaCivilDefenceTabOnePage> createState() =>
      _NigeriaCivilDefenceTabOnePageState();
}

class _NigeriaCivilDefenceTabOnePageState
    extends State<NigeriaCivilDefenceTabOnePage> {
  late final Uri _urlCall;
  late final Uri _urlSMS;

  final ButtonStyle filledStyle = ElevatedButton.styleFrom(
      backgroundColor: SecureMinnaColors.primary,
      textStyle: const TextStyle(fontSize: 14),
      minimumSize: const Size.fromHeight(50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)));
  final ButtonStyle outlineStyle = OutlinedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 14),
      minimumSize: const Size.fromHeight(50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      side: const BorderSide(color: Color(0xFF55A3DA), width: 2));

  @override
  void initState() {
    super.initState();
    _urlCall = Uri.parse('tel://${widget.items.phoneNumber1}');
    _urlSMS = Uri(
        scheme: 'sms',
        path: '${widget.items.phoneNumber1}',
        query: encodeQueryParameters(
            <String, String>{'body': 'Help is required at: '}));
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future<void> _launchCall() async {
    if (!await launchUrl(_urlCall)) {
      throw 'Could not launch $_urlCall';
    }
  }

  Future<void> _launchSMS() async {
    if (!await launchUrl(_urlSMS)) {
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
          SizedBox(
            height: 795,
            width: mqWidth,
            child: Stack(
              children: [
                Positioned(
                    left: 10,
                    top: 20,
                    right: 10,
                    child: SizedBox(
                      height: 246,
                      width: 566,
                      child: Card(
                        elevation: 1,
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: const EdgeInsets.all(5),
                        child: const Image(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              'assets/images/civil_defence_header.png'),
                        ),
                      ),
                    )),
                const Positioned(
                    left: 10,
                    top: 190,
                    right: 10,
                    child: SizedBox(
                      height: 132,
                      width: 132,
                      child: Image(
                        fit: BoxFit.contain,
                        image:
                            AssetImage('assets/images/civil_defence_body.png'),
                      ),
                    )),
                Positioned(
                  left: 10,
                  top: 320,
                  right: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${widget.items.title}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              color: Color(0xFF474747))),
                      const SizedBox(height: 5),
                      const Text('Emergency Number',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              color: Color(0xFF55A3DA))),
                      const SizedBox(height: 5),
                      Text('${widget.items.phoneNumber1}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              color: Color(0xFF7A7E80))),
                      const SizedBox(height: 16),
                      const Divider(),
                      const SizedBox(height: 20),
                      const Flexible(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('Email Address',
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
                          padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('${widget.items.email}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF7A7E80))),
                          ),
                        ),
                      ),
                      const SizedBox(height: 22),
                      const Flexible(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('Address',
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
                          padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('${widget.items.address}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF7A7E80))),
                          ),
                        ),
                      ),
                      const SizedBox(height: 19),
                      const Divider(),
                      const SizedBox(height: 28),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                          child: Align(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                style: filledStyle,
                                onPressed: () {
                                  _launchCall();
                                },
                                child: const Text('Emergency Call',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        color: Color(0xFFFFFFFF))),
                              )),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                          child: Align(
                              alignment: Alignment.center,
                              child: OutlinedButton(
                                style: outlineStyle,
                                onPressed: () {
                                  _launchSMS();
                                },
                                child: const Text('Send SMS',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF55A3DA))),
                              )),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
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
