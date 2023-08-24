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
  // Personal Data Variables
  final String contact;
  final String firstName;
  final String lastName;
  // Credit Card Data Variables
  final String holder;
  final String expireDate;
  final String cardName;
  // Language Data Variables
  final String lang;
  const SettingScreen({Key? key, required this.contact, required this.firstName, required this.lastName, required this.holder, required this.expireDate, required this.cardName, required this.lang}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  // Personal Data Variables
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;

  // Credit Card Data Variables
  late TextEditingController _holderController;
  late TextEditingController _expireDateController;
  late TextEditingController _cardNameController;

  // Language Data Variables
  late TextEditingController _langController;

  // Language Data
  bool _isLoading = true;
  Subscriber? _subscriber;
  @override
  void initState() {
    super.initState();
    // Personal Data Variables
    _firstNameController = TextEditingController(text: widget.firstName);
    _lastNameController = TextEditingController(text: widget.lastName);

    // Credit Card Data Variables
    _holderController = TextEditingController(text: widget.holder);
    _expireDateController = TextEditingController(text: widget.expireDate);
    _cardNameController = TextEditingController(text: widget.cardName);

    // Language Data Variables
    _langController = TextEditingController(text: widget.lang);
  }

  void _updatePersonalDetails() async {
    // Personal Data Variables
    final updatedFirstName = _firstNameController.text;
    final updatedLastName = _lastNameController.text;

    final response = await http.put(
      Uri.parse('https://app.encode.uz/api/subscribers/v1/update-subscriber/${widget.contact}'),
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

  void _updateCardDetails() async {
    // Credit Card Data Variables
    final updatedHolder = _holderController.text;
    final updateExpireDate = _expireDateController.text;
    final updateCardName = _cardNameController.text;

    final creditCardResponse = await http.put(
      Uri.parse('https://app.encode.uz/api/subscribers/v1/update-card/${widget.contact}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'holder': updatedHolder,
        'issued': updateExpireDate,
        'name': updateCardName
      }),
    );
    if (creditCardResponse.statusCode == 200) {
      print('Card details updated successfully');
      Navigator.pop(context); // Navigate back after successful update
    } else {
      print('Failed to update card details');
    }
  }


  void _updateLanguageDetails() async {
    // Language Data Variables
    final updatedLang = _langController.text;

    final response = await http.put(
      Uri.parse('http://10.0.2.2:82/api/subscribers/v1/update-lang/${widget.contact}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'language': updatedLang,
      }),
    );

    if (response.statusCode == 200) {
      print('Lang details updated successfully');
      Navigator.pop(context); // Navigate back after successful update
    } else {
      print('Failed to update user details');
    }
  }


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    const List<String> list = <String>['Uzbek', 'Russian', 'English'];
    String dropdownValue = list.first;
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
                              backgroundColor: MaterialStatePropertyAll(Color(0xFFFF9021))
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
                        controller: _holderController,
                        decoration: InputDecoration(
                          labelText: 'Holder',
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _expireDateController,
                        // obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Expiry Date',
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _cardNameController,
                        // obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Card Name',
                        ),
                      ),
                      SizedBox(height: 24),

                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(

                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Color(0xFFFF9021))
                          ),
                          onPressed: _updateCardDetails,
                          child: Text('Save Card Data'),

                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    tilePadding: EdgeInsets.all(0),
                    title: Text('Language Data'),
                    expandedAlignment: Alignment.centerLeft,
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    subtitle: Text('Change your language data'),
                    children: <Widget>[
                      // Text(
                      //   'Personal Details',
                      //   style: TextStyle(
                      //       color: Colors.black,
                      //       fontSize: 18,
                      //       fontWeight: FontWeight.bold
                      //   ),
                      // ),
                      DropdownMenu<String>(
                        width: width,
                        controller: _langController,
                        enableFilter: true,
                        leadingIcon: const Icon(Icons.language),
                        label: Text('Choose Language'),
                        inputDecorationTheme: const InputDecorationTheme(
                          // filled: true,
                          // contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                        ),
                        // initialSelection: list.first,
                        // onSelected: (String? value) {
                        //   // This is called when the user selects an item.
                        //   setState(() {
                        //     dropdownValue = value!;
                        //   });
                        // },
                        // dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                        //   return DropdownMenuEntry<String>(value: value, label: value);
                        // }).toList(),
                        dropdownMenuEntries: [
                          DropdownMenuEntry(
                              value: 'en',
                              label: 'en'
                          ),
                          DropdownMenuEntry(
                              value: 'ru',
                              label: 'ru'
                          ),
                          DropdownMenuEntry(
                              value: 'uz',
                              label: 'uz'
                          ),
                        ],
                      ),
                      // TextField(
                      //   controller: _firstNameController,
                      //   decoration: InputDecoration(
                      //       labelText: 'Choose Language'
                      //   ),
                      // ),
                      SizedBox(height: 24),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Color(0xFFFF9021))
                          ),
                          onPressed: _updateLanguageDetails,
                          child: Text('Save Personal Data'),

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
