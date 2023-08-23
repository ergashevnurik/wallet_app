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
  final String firstName;
  final String lastName;
  const SettingScreen({Key? key, required this.contact, required this.firstName, required this.lastName}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;

  bool _isLoading = true;
  Subscriber? _subscriber;
  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.firstName);
    _lastNameController = TextEditingController(text: widget.lastName);
  }

  void _updatePersonalDetails() async {
    final updatedFirstName = _firstNameController.text;
    final updatedLastName = _lastNameController.text;

    final response = await http.post(
      Uri.parse('http://10.0.2.2:82/api/subscribers/v1/update-subscriber/${widget.contact}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'first': updatedFirstName,
        'last': updatedLastName
      }),
    );

    if (response.statusCode == 200) {
      print('User details updated successfully');
      Navigator.pop(context); // Navigate back after successful update
    } else {
      print('Failed to update user details');
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
            "НАСТРОЙТЕ ДАННЫЕ",
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
                  // Personal Details Form
                  ExpansionTile(
                    tilePadding: EdgeInsets.all(0),
                    title: Text('Personal Data'),
                    expandedAlignment: Alignment.centerLeft,
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    subtitle: Text('Change your personal data'),
                    children: <Widget>[
                      // Text(
                      //   'Personal Details',
                      //   style: TextStyle(
                      //       color: Colors.black,
                      //       fontSize: 18,
                      //       fontWeight: FontWeight.bold
                      //   ),
                      // ),
                      TextField(
                        controller: _firstNameController,
                        decoration: InputDecoration(
                            labelText: 'First name'
                        ),
                      ),
                      TextField(
                        controller: _lastNameController,
                        decoration: InputDecoration(
                            labelText: 'Last name'
                        ),
                      ),
                      SizedBox(height: 24),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Colors.grey[600])
                          ),
                          onPressed: _updatePersonalDetails,
                          child: Text('Save Personal Data'),

                        ),
                      ),
                    ],
                  ),


                  // Card Details Form
                  ExpansionTile(
                    tilePadding: EdgeInsets.all(0),
                    title: Text('Credit Card Data'),
                    expandedAlignment: Alignment.centerLeft,
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    subtitle: Text('Change your credit card data'),
                    children: <Widget>[
                      // Text(
                      //   'Card Details',
                      //   style: TextStyle(
                      //       color: Colors.black,
                      //       fontSize: 18,
                      //       fontWeight: FontWeight.bold
                      //   ),
                      // ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Holder',
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Expiry Date',
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'CVV',
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Card Name',
                        ),
                      ),
                      SizedBox(height: 24),

                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Colors.grey[600])
                          ),
                          onPressed: () {
                            // Добавьте здесь логику для проверки введенных данных и входа.
                          },
                          child: Text('Save Card Data'),

                        ),
                      ),
                    ],
                  ),


                ],
              ),
            )
          )
        ),
      ),
    );
  }
}
