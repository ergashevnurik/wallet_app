import 'package:flutter/material.dart';
import 'package:wallet_app/components/shop_screen/my_category_card.dart';
import 'package:wallet_app/screens/category_screen.dart';

import '../components/settings_screen/my_config_card.dart';
import '../parts/bottom_bar.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
            "BUY OUR PRODUCTS",
            style: TextStyle(
            color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          ),
          centerTitle: true,
        ),
        // bottomNavigationBar: BottomBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // cards
                /*Text(
                    "BUY OUR PRODUCTS",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),*/
                // SizedBox(height: 10),
                // MyCategoryCard(
                //   cardText: 'НОВАЯ КОЛЛЕКЦИЯ',
                //   imagePath: "https://rasulov.uz/thumb/2/MD6AIIvSvLorsm9Yc_ah_Q/r/d/1_40.png",
                //   onPressed: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(builder: (context)=> categoryScreen())
                //     );
                //   },
                // ),
                // SizedBox(height: 10),
                // MyCategoryCard(
                //   cardText: 'ЭЛИТ КЛАСС',
                //   imagePath: "https://rasulov.uz/thumb/2/i2gtGXdBwPWd7fmvauvlrQ/r/d/4.png",
                // ),
                // SizedBox(height: 10),
                // MyCategoryCard(
                //   cardText: 'ЭКСКЛЮЗИВ КЛАСС',
                //   imagePath: "https://rasulov.uz/thumb/2/7uFmRdmes4mge7jcCKMIdw/r/d/3.png",
                // ),
                // SizedBox(height: 10),
                // MyCategoryCard(
                //   cardText: 'ЭКОШПОН',
                //   imagePath: "https://rasulov.uz/thumb/2/fas2rNy7IXhJ-erW0qQGOg/r/d/2.png",
                // ),
                // SizedBox(height: 10),
                // MyCategoryCard(
                //   cardText: 'ПРЕМИУМ КЛАСС',
                //   imagePath: "https://rasulov.uz/thumb/2/XGv6CBwc51yrAeK_6AP60w/r/d/5.png",
                // ),
                // SizedBox(height: 10),
                // MyCategoryCard(
                //   cardText: 'ПРЕСТИЖ КЛАСС',
                //   imagePath: "https://rasulov.uz/thumb/2/tcezXP5RHzfkbYfmSstwUw/r/d/6_4.png",
                // ),
                // SizedBox(height: 10),
                // MyCategoryCard(
                //   cardText: 'МЕЖКОМНАТНЫЕ ОКНА',
                //   imagePath: "https://rasulov.uz/thumb/2/B4ZaiiZIrAU8LBcplh4c1g/r/d/0909.png",
                // ),
                // SizedBox(height: 10),
                // MyCategoryCard(
                //   cardText: 'МЕБЕЛЬНЫЕ СТВОРКИ',
                //   imagePath: "https://rasulov.uz/thumb/2/znrksxHED1W3ApFKngsQ7A/r/d/8989.png",
                // ),
                Padding(
                  padding: const EdgeInsets.all(27.0),
                  child: Wrap(
                    spacing: 27,
                    runSpacing: 27,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width / 2.5,
                            height: 150,
                            decoration: BoxDecoration(
                                color: Colors.grey
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                              'Title'
                          ),
                          Text(
                              'Description'
                          ),
                          Text(
                              'Price'
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width / 2.5,
                            height: 150,
                            decoration: BoxDecoration(
                                color: Colors.grey
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                              'Title'
                          ),
                          Text(
                              'Description'
                          ),
                          Text(
                              'Price'
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width / 2.5,
                            height: 150,
                            decoration: BoxDecoration(
                                color: Colors.grey
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                              'Title'
                          ),
                          Text(
                              'Description'
                          ),
                          Text(
                              'Price'
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width / 2.5,
                            height: 150,
                            decoration: BoxDecoration(
                                color: Colors.grey
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                              'Title'
                          ),
                          Text(
                              'Description'
                          ),
                          Text(
                              'Price'
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width / 2.5,
                            height: 150,
                            decoration: BoxDecoration(
                                color: Colors.grey
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                              'Title'
                          ),
                          Text(
                              'Description'
                          ),
                          Text(
                              'Price'
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
