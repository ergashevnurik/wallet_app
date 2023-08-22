import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallet_app/parts/bottom_bar.dart';

import '../components/settings_screen/my_config_card.dart';
import '../components/settings_screen/my_profile_card.dart';
import '../models/subscriber.dart';
import '../parts/app_bar.dart';
import 'carddetails_screen.dart';
import 'package:http/http.dart' as http;
import 'language_screen.dart';

class SettingScreen extends StatefulWidget {
  final String contact;
  const SettingScreen({Key? key, required this.contact}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  bool _isLoading = true;
  Subscriber? _subscriber;
  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  Future<void> _fetchUserDetails() async {
    // Make an HTTP GET request to your Spring Boot API to fetch user details
    final response = await http.get(
      Uri.parse('http://10.0.2.2:82/api/subscribers/v1/details/${widget.contact}'),
    );

    final responseData = jsonDecode(response.body);
    _subscriber = Subscriber(
        id: responseData['id'],
        first: responseData['first'] != null ? responseData['first'] : 'N/A',
        last: responseData['last'] != null ? responseData['last'] : 'N/A',
        birthday: responseData['birthday'] != null ? responseData['birthday'] : 'N/A',
        gender: responseData['gender'] != null ? responseData['gender'] : 'N/A',
        percentage: responseData['percentage'] != null ? responseData['percentage'] : 'N/A',
        uploaded: responseData['uploaded'] != null ? responseData['uploaded'] : 'N/A',
        username: responseData['username'] != null ? responseData['username'] : 'N/A',
        admin: responseData['admin'] != null ? responseData['admin'] : 'N/A',
        verified: responseData['verified'] != null ? responseData['verified'] : 'N/A',
        contact: responseData['contact'] != null ? responseData['contact'] : 'N/A'
    );

    print(response);

    if (response.statusCode == 200) {
      setState(() {

        _isLoading = false;
      });
    } else {
      print('Failed to fetch user details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // bottomNavigationBar: BottomBar(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "CONFIGURE SETTINGS",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  MyProfileCard(
                    pic: '${_subscriber!.uploaded}',
                    firstName: '${_subscriber!.first}',
                    lastName: '${_subscriber!.last}'
                  ),
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
