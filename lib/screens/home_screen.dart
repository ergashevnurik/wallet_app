import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_app/components/home_screen/my_cards.dart';
import 'package:wallet_app/components/home_screen/my_list_tile.dart';
import 'package:wallet_app/components/home_screen/my_services.dart';
import 'package:wallet_app/models/card.dart';
import 'package:wallet_app/models/purchase.dart';
import 'package:wallet_app/parts/bottom_bar.dart';
import 'package:wallet_app/screens/cashbacks_screen.dart';
import 'package:wallet_app/screens/register_screen.dart';
import 'package:wallet_app/screens/settings_screen.dart';
import 'package:wallet_app/screens/shop_screen.dart';
import 'package:http/http.dart' as http;

import '../models/subscriber.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  final String contact;
  const HomeScreen({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeWidget(
        contact: contact,
      ),
    );
  }
}


class HomeWidget extends StatefulWidget {
  final String contact;
  const HomeWidget({Key? key, required this.contact}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool _isLoading = true;
  Subscriber? _subscriber;
  CardDetails? _cardDetails;
  int cardDetailsSum = 0;

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

    final purchaseResponse = await http.get(
      Uri.parse('http://10.0.2.2:82/api/subscribers/v1/count/${widget.contact}')
    );

    final responseData = jsonDecode(response.body);
    final purchaseResponseData = jsonDecode(purchaseResponse.body);
    cardDetailsSum = purchaseResponseData;
    print(cardDetailsSum);

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

    final responseCardDetails = await http.get(
        Uri.parse('http://10.0.2.2:82/api/subscribers/v1/card-details/${widget.contact}')
    );
    final responseCardDetailsData = jsonDecode(responseCardDetails.body);

    _cardDetails = CardDetails(
        holder: responseCardDetailsData['holder'] != null ? responseCardDetailsData['holder'] : 'N/A',
        assignedSubscriber: responseCardDetailsData['assignedSubscriber'] != null ? responseCardDetailsData['assignedSubscriber'] : 'N/A',
        issued: responseCardDetailsData['issued'] != null ? responseCardDetailsData['issued'] : 'N/A',
        name: responseCardDetailsData['name'] != null ? responseCardDetailsData['name'] : 'N/A'
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

  //page controller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomBar(contact: _subscriber!.contact),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //app bar
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${_subscriber!.first}',
                          style: TextStyle(
                              fontSize: 26
                          ),
                        ),
                        Text(
                          ' ${_subscriber!.last}',
                          style: TextStyle(
                              fontSize: 26
                          ),
                        ),
                        /*Image.network("https://rasulov.uz/thumb/2/0jPM6tsSJaNTDTWnHZlD7A/280r280/d/logo.svg")*/
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      /*decoration: BoxDecoration(
                          color: Colors.deepOrange[300],
                          shape: BoxShape.circle
                        ),*/
                      child: Icon(
                        Icons.menu,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 25),

              // cards
              Container(
                height: 200,
                child: PageView(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: [
                    MyCard(
                      balance: cardDetailsSum,
                      cardNumber: _cardDetails!.holder,
                      expiryMonth: '10',
                      expiryYear: '24',
                      color: Colors.deepPurple[400],
                      cashBackPercentage: _subscriber!.percentage,
                    ),
                    /*MyCard(
                      balance: 1250,
                      cardNumber: '123456789',
                      expiryMonth: '10',
                      expiryYear: '24',
                      color: Colors.green[400],
                    ),
                    MyCard(
                      balance: 250,
                      cardNumber: '123456789',
                      expiryMonth: '10',
                      expiryYear: '24',
                      color: Colors.yellow[400],
                    ),*/
                  ],
                ),
              ),
              // SizedBox(height: 25),
              // SmoothPageIndicator(
              //   controller: _controller,
              //   count: 3,
              //   effect: ExpandingDotsEffect(
              //       activeDotColor: Colors.grey.shade800
              //   ),
              // ),

              // 3 buttons -> send pay bills
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Personal xizmatlar',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios)
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyServices(
                      buttonText: "Magazin",
                      icon: Icons.shopping_bag,
                      pageRouter: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ShopScreen())
                        );
                      }
                  ),
                  MyServices(
                      buttonText: "Cash Backs",
                      icon: Icons.money,
                      pageRouter: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CashBackScreen(contact: _subscriber!.contact))
                        );
                      }
                  ),
                  MyServices(
                      buttonText: "Sozlamalar",
                      icon: Icons.settings,
                      pageRouter: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SettingScreen(contact: _subscriber!.contact))
                        );
                      }
                  )
                ],
              ),

              // column -> stats -> transactions
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(27.0),
                child: Column(
                  children: [
                    MyListTile(
                        icon: Icons.analytics,
                        tileName: 'Analytics',
                        description: 'Payment and Income'
                    ),
                    MyListTile(
                        icon: Icons.verified_user,
                        tileName: 'Users',
                        description: 'Users and subscribers'
                    ),
                  ],
                ),
              ),

              // Online shop


            ],
          ),
        ),
      ),
    );
  }
}

