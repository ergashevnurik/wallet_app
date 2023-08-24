import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/svg.dart';
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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  final String contact;
  const HomeScreen({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale('ru'),
      supportedLocales: [
        Locale('en'),
        Locale('ru'),
        Locale('uz'),
      ],
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
      Uri.parse('https://app.encode.uz/api/subscribers/v1/details/${widget.contact}'),
    );

    final purchaseResponse = await http.get(
      Uri.parse('https://app.encode.uz/api/subscribers/v1/count/${widget.contact}')
    );

    final responseData = jsonDecode(response.body);
    final purchaseResponseData = jsonDecode(purchaseResponse.body);
    cardDetailsSum = purchaseResponseData;
    print(cardDetailsSum);

    _subscriber = Subscriber(
        id: responseData['id'],
        first: responseData['first'] != null ? responseData['first'] : AppLocalizations.of(context)!.na,
        last: responseData['last'] != null ? responseData['last'] : AppLocalizations.of(context)!.na,
        birthday: responseData['birthday'] != null ? responseData['birthday'] : AppLocalizations.of(context)!.na,
        gender: responseData['gender'] != null ? responseData['gender'] : AppLocalizations.of(context)!.na,
        percentage: responseData['percentage'] != null ? responseData['percentage'] : AppLocalizations.of(context)!.na,
        uploaded: responseData['uploaded'] != null ? responseData['uploaded'] : AppLocalizations.of(context)!.na,
        username: responseData['username'] != null ? responseData['username'] : AppLocalizations.of(context)!.na,
        admin: responseData['admin'] != null ? responseData['admin'] : AppLocalizations.of(context)!.na,
        verified: responseData['verified'] != null ? responseData['verified'] : AppLocalizations.of(context)!.na,
        contact: responseData['contact'] != null ? responseData['contact'] : AppLocalizations.of(context)!.na
    );

    final responseCardDetails = await http.get(
        Uri.parse('https://app.encode.uz/api/subscribers/v1/card-details/${widget.contact}')
    );
    final responseCardDetailsData = jsonDecode(responseCardDetails.body);

    _cardDetails = CardDetails(
        holder: responseCardDetailsData['holder'] != null ? responseCardDetailsData['holder'] : AppLocalizations.of(context)!.na,
        assignedSubscriber: responseCardDetailsData['assignedSubscriber'] != null ? responseCardDetailsData['assignedSubscriber'] : AppLocalizations.of(context)!.na,
        issued: responseCardDetailsData['issued'] != null ? responseCardDetailsData['issued'] : AppLocalizations.of(context)!.na,
        name: responseCardDetailsData['name'] != null ? responseCardDetailsData['name'] : AppLocalizations.of(context)!.na
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
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
             DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)!.rasulovgi),
                  SizedBox(height: 15),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white
                          ),
                        ),
                        SizedBox(width: 8),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${_subscriber?.last ?? AppLocalizations.of(context)!.na}"),
                            Text("${_subscriber?.first ?? AppLocalizations.of(context)!.na}")
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home), // for Left
              // trailing: Icon(Icons.settings), // for Right
              title: Text(AppLocalizations.of(context)!.home),
              onTap: () {
                // Update the state of the app
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen(contact: _subscriber!.contact))
                );
                // Then close the drawer
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.shop), // for Left
              // trailing: Icon(Icons.settings), // for Right
              title: Text(AppLocalizations.of(context)!.shop),
              onTap: () {
                // Update the state of the app
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShopScreen())
                );
                // Then close the drawer
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings), // for Left
              // trailing: Icon(Icons.settings), // for Right
              title: Text(AppLocalizations.of(context)!.settings),
              onTap: () {
                // Update the state of the app
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingScreen(
                        contact: _subscriber?.contact ?? AppLocalizations.of(context)!.na,
                        firstName: _subscriber?.first ?? AppLocalizations.of(context)!.na,
                        lastName: _subscriber?.last ?? AppLocalizations.of(context)!.na,
                        holder: _cardDetails?.holder ?? AppLocalizations.of(context)!.na,
                        expireDate: _cardDetails?.issued ?? AppLocalizations.of(context)!.na,
                        cardName: _cardDetails?.name ?? AppLocalizations.of(context)!.na,
                    )
                  )
                );
                // Then close the drawer
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.bar_chart_sharp), // for Left
              // trailing: Icon(Icons.settings), // for Right
              title: Text(AppLocalizations.of(context)!.monitoring),
              onTap: () {
                // Update the state of the app
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CashBackScreen(contact: _subscriber!.contact))
                );
                // Then close the drawer
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout), // for Left
              // trailing: Icon(Icons.settings), // for Right
              title: Text(AppLocalizations.of(context)!.logout),
              onTap: () {
                // Update the state of the app
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen())
                );
                // Then close the drawer
                // Navigator.pop(context);
              },
            ),
            AboutListTile(
              icon: Icon(Icons.info), // for Left
              child: Text(AppLocalizations.of(context)!.about),
              applicationIcon: Icon(
                Icons.local_play,
              ),
              applicationName: 'My Cool App',
              applicationVersion: '1.0.25',
              applicationLegalese: '© 2019 Company',
              aboutBoxChildren: [
                ///Content goes here...
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomBar(contact: _subscriber!.contact),
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
                    SvgPicture.asset('assets/img/logo.svg'),
                    // Row(
                    //   children: [
                    //     Text(
                    //       'Rasulov',
                    //       style: TextStyle(
                    //           fontSize: 26
                    //       ),
                    //     ),
                    //     Text(
                    //       ' GI',
                    //       style: TextStyle(
                    //           fontSize: 26
                    //       ),
                    //     ),
                    //     /*Image.network("https://rasulov.uz/thumb/2/0jPM6tsSJaNTDTWnHZlD7A/280r280/d/logo.svg")*/
                    //   ],
                    // ),
                    Container(
                      padding: EdgeInsets.all(5),
                      /*decoration: BoxDecoration(
                          color: Colors.deepOrange[300],
                          shape: BoxShape.circle
                        ),*/
                      child: IconButton(
                        icon: Icon(
                          Icons.menu,
                          size: 30,
                        ),
                        onPressed: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
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
                      cardNumber: _cardDetails?.holder ?? AppLocalizations.of(context)!.na,
                      expiryMonth: '10',
                      expiryYear: '24',
                      color: Colors.grey[400],
                      cashBackPercentage: _subscriber?.percentage ?? AppLocalizations.of(context)!.na,
                      balanceString: AppLocalizations.of(context)!.balance,
                      currencyString: AppLocalizations.of(context)!.currency,
                      textString: AppLocalizations.of(context)!.card_string,
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyServices(
                        buttonText: AppLocalizations.of(context)!.shop,
                        icon: Icons.shopping_bag,
                        pageRouter: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ShopScreen())
                          );
                        }
                    ),
                    MyServices(
                        buttonText: AppLocalizations.of(context)!.monitoring,
                        icon: Icons.money,
                        pageRouter: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CashBackScreen(contact: _subscriber!.contact))
                          );
                        }
                    ),
                    MyServices(
                        buttonText: AppLocalizations.of(context)!.settings,
                        icon: Icons.settings,
                        pageRouter: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SettingScreen(
                                contact: _subscriber?.contact ?? AppLocalizations.of(context)!.na,
                                firstName: _subscriber?.first ?? AppLocalizations.of(context)!.na,
                                lastName: _subscriber?.last ?? AppLocalizations.of(context)!.na,
                                holder: _cardDetails?.holder ?? AppLocalizations.of(context)!.na,
                                expireDate: _cardDetails?.issued ?? AppLocalizations.of(context)!.na,
                                cardName: _cardDetails?.name ?? AppLocalizations.of(context)!.na,
                              )
                            )
                          );
                        }
                    )
                  ],
                ),
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

