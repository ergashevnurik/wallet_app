import 'package:flutter/material.dart';
import 'package:wallet_app/parts/bottom_bar.dart';

import '../components/settings_screen/my_config_card.dart';
import '../components/settings_screen/my_profile_card.dart';
import '../parts/app_bar.dart';
import 'carddetails_screen.dart';
import 'language_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CONFIGURE SETTINGS",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10),
                  MyProfileCard(),
                  SizedBox(height: 30),
                  MyConfigCard(
                    cardText: "Configure your \npersonal data",
                    icon: Icons.person,
                   /* onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LanguageConfiguration())
                      );
                    },*/
                  ),
                  SizedBox(height: 10),
                  MyConfigCard(
                    cardText: "Configure your \nlanguage",
                    icon: Icons.language,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LanguageConfiguration())
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  MyConfigCard(
                    cardText: "Configure your \ncredit card",
                    icon: Icons.credit_card,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CreditCardConfiguration())
                      );
                    },
                  )
                ],
              ),
            )
          )
        ),
      ),
    );
  }
}
