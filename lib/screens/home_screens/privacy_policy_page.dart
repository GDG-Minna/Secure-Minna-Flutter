import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:markdown_widget/widget/markdown.dart';
import 'package:secure_minna/components/navigation_drawers.dart';
import 'package:secure_minna/util/utils.dart';

class PrivacyPolicyPage extends StatelessWidget {
  static const String routeName = '/privacyPolicyPage';

  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Privacy Policy',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
              )),
        ),
        drawer: const NavigationDrawers(),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future:
                    rootBundle.loadString('assets/markdown/privacy_policy.md'),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  try {
                    if (snapshot.hasData) {
                      return MarkdownWidget(
                        data: snapshot.data!,
                      );
                    } else if (snapshot.hasError) {
                      logDebug('Error loading file: ${snapshot.error}');
                      return Text(snapshot.error.toString());
                    }

                    return const Center(child: CircularProgressIndicator());
                  } catch (e) {
                    logDebug(e.toString());
                    return Text(e.toString());
                  }
                },
              ),
            ),
          ),
        ));
  }
}
