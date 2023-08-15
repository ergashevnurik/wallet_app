import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:wallet_app/screens/home_screen.dart';

class User {
  final int id;
  final String name;

  User({required this.id, required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  List<User> users = [];

  Future<void> _login() async {
    final response = await http.get(
      Uri.parse('YOUR_BACKEND_API_URL/api/users'),
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      setState(() {
        users = jsonResponse.map((user) => User.fromJson(user)).toList();
      });
    } else {
      throw Exception('Failed to load users');
    }

    // Simulate a basic login check (replace with actual authentication logic)
    final enteredPhoneNumber = _phoneNumberController.text;
    final matchedUser = users.firstWhere(
          (user) => user.name == enteredPhoneNumber,
    );

    if (matchedUser != null) {
      // User found, navigate to another screen or perform further actions
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen()
          )
      );
      print('Logged in as ${matchedUser.name}');
    } else {
      // User not found, show an error message
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen()
          )
      );
      print('Login failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                            onPressed: _login,
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
        ),

    );
  }
}
