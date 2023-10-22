import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Legal%20Documents/privacy.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Legal%20Documents/terms.dart';

class MySettings extends StatefulWidget {
  const MySettings({super.key});

  static const String routeName = "mysettings";

  @override
  State<MySettings> createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  final String number = "9819892453";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Settings",
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 25, right: 5, left: 5, bottom: 0),
            child: SettingsList(
              backgroundColor: Colors.transparent,
              sections: [
                SettingsSection(
                  title: 'Common',
                  tiles: [
                    SettingsTile(
                      title: 'Language',
                      titleTextStyle: GoogleFonts.montserrat(fontSize: 16),
                      subtitle: 'English',
                      leading: const FaIcon(
                        FontAwesomeIcons.language,
                        color: Colors.deepPurpleAccent,
                      ),
                      onPressed: (BuildContext context) {},
                    ),
                    SettingsTile(
                      title: 'Rate Us',
                      titleTextStyle: GoogleFonts.montserrat(fontSize: 16),
                      subtitle: 'Rate us on Google Play Store',
                      leading: const FaIcon(
                        FontAwesomeIcons.star,
                        color: Colors.deepPurpleAccent,
                      ),
                      onPressed: (BuildContext context) async {
                        // await LaunchApp.openApp(
                        //   androidPackageName:
                        //       "com.mdksdcollege.mdksdcollege",
                        //   openStore: true,
                        // );
                      },
                    ),
                  ],
                ),
                SettingsSection(
                  title: 'Services',
                  tiles: [
                    SettingsTile(
                      title: 'Share Us',
                      titleTextStyle: GoogleFonts.montserrat(fontSize: 16),
                      subtitle: 'Share your experience with friends',
                      leading: const FaIcon(
                        FontAwesomeIcons.share,
                        color: Colors.deepPurpleAccent,
                      ),
                      onPressed: (BuildContext context) {
                        _sharefeatures(context);
                      },
                    ),
                    SettingsTile(
                      title: 'Contact us',
                      titleTextStyle: GoogleFonts.montserrat(fontSize: 16),
                      subtitle: 'Lets Shop (Welcome Store)',
                      leading: const FaIcon(
                        FontAwesomeIcons.phone,
                        color: Colors.deepPurpleAccent,
                      ),
                      onPressed: (BuildContext context) async {
                        FlutterPhoneDirectCaller.callNumber("9819892453");
                        launchUrlString("tel://$number");
                      },
                    ),
                  ],
                ),
                SettingsSection(
                  title: 'About us',
                  tiles: [
                    SettingsTile(
                      title: 'Inside Engineers Services',
                      titleTextStyle: GoogleFonts.montserrat(fontSize: 16),
                      subtitle: 'Android Version - 3.0.0',
                      leading: const FaIcon(
                        FontAwesomeIcons.android,
                        color: Colors.deepPurpleAccent,
                      ),
                      onPressed: (BuildContext context) {},
                    ),
                    SettingsTile(
                      title: 'Privacy and Policies',
                      titleTextStyle: GoogleFonts.montserrat(fontSize: 16),
                      subtitle: '',
                      leading: const FaIcon(
                        FontAwesomeIcons.book,
                        color: Colors.deepPurpleAccent,
                      ),
                      onPressed: (BuildContext context) {
                        Navigator.pushNamed(context, Privacy.routeName);
                      },
                    ),
                    SettingsTile(
                      title: 'Terms and Conditions',
                      titleTextStyle: GoogleFonts.montserrat(fontSize: 16),
                      subtitle: '',
                      leading: const FaIcon(
                        FontAwesomeIcons.book,
                        color: Colors.deepPurpleAccent,
                      ),
                      onPressed: (BuildContext context) {
                        Navigator.pushNamed(context, Terms.routeName);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _sharefeatures(BuildContext context) async {
  final box = context.findRenderObject() as RenderBox?;

  await Share.share("Thanks for Supporting us",
      subject: "Team Inside Engineers",
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
}
