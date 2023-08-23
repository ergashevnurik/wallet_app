import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:wallet_app/screens/home_screen.dart';

import '../models/subscriber.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  List<Subscriber> subscribers = [];
  bool _isLoggedIn = false; // Track login status
  Subscriber? _subscriber;

  Future<void> _login() async {
    final phoneNumber = _phoneNumberController.text;

    if (phoneNumber.isNotEmpty) {
      final response = await http.post(
        Uri.parse('https://app.encode.uz/api/subscribers/v1/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            {'contact': phoneNumber}
        ),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData.containsKey('contact')) {
          setState(() {
            /*_subscriber = Subscriber.fromJson(responseData['contact']);*/

            print('Login successful for phone number: $phoneNumber');
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
            EasyLoading.showSuccess("Welcome, ${_subscriber!.first}");
            setState(() {
              _isLoggedIn = true; // Update login status
            });
            // Navigate to another screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen(contact: _subscriber!.contact)),
            );
          });
        } else {
          print('Login failed: ${responseData['message']}');
        }
        // Navigate to another screen or perform further actions
      } else {
        EasyLoading.showError('Failed with Error');
        print('Login failed for phone number: $phoneNumber');
      }
    } else {
      print('Please enter a phone number');
      EasyLoading.showInfo('Please enter a phone number');
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(25),
                    width: width,
                    /*decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://wallpaperaccess.com/full/333537.jpg"), *//* AssetImage(....) *//*
                        fit: BoxFit.cover
                      ),
                      color: Colors.grey[300]
                    ),*/
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                            Icons.lock,
                            size: 45,
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Для получения\nкэшбэка',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 34,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Пожалуйста, войдите на платформу',
                          style: TextStyle(
                            color: Colors.grey[900],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      children: [
                        TextField(
                          controller: _phoneNumberController,
                          decoration: InputDecoration(labelText: 'Номер телефона'),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: width,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Colors.black)
                            ),
                            onPressed: _isLoggedIn ? null : _login, // Disable button if already logged in
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                              child: Text('Авторизоваться'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                ],
              ),
          ),
        ),
    );
  }
}

class CustomError extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const CustomError({
    Key? key,
    required this.errorDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                'assets/images/error_illustration.png'),
            Text(
              kDebugMode
                  ? errorDetails.summary.toString()
                  : 'Oups! Something went wrong!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: kDebugMode ? Colors.red : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 21),
            ),
            const SizedBox(height: 12),
            const Text(
              kDebugMode
                  ? 'https://docs.flutter.dev/testing/errors'
                  : "We encountered an error and we've notified our engineering team about it. Sorry for the inconvenience caused.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}