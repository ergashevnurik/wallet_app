import 'package:flutter/material.dart';
import 'package:wallet_app/components/shop_screen/my_card.dart';

import '../parts/bottom_bar.dart';

class productsscreen extends StatefulWidget {
  const productsscreen({Key? key}) : super(key: key);

  @override
  State<productsscreen> createState() => _productsscreenState();
}

class _productsscreenState extends State<productsscreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios
                ,color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
              'Rasulov GI',
            style: TextStyle(
              color: Colors.black
            ),
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(25)
              ),
              child: IconButton(
                icon: Icon(Icons.search
                  ,color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        // bottomNavigationBar: BottomBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("All"
                        ,style: TextStyle(
                              fontSize: 24,
                            fontWeight: FontWeight.w800
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Headphones"
                          ,style: TextStyle(
                              fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[300]
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Speakers"
                          ,style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[300]
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Microphones"
                          ,style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[300]
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Microphones"
                          ,style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[300]
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Wrap(
                  children: [
                    MyCard(
                        title: "Desk Lamp",
                        description: "BeoPlay Speaker",
                        price: 200
                    ),
                    MyCard(
                        title: "BeoPlay Speaker",
                        description: "Desk Lamp",
                        price: 450
                    ),
                    MyCard(
                        title: "Desk Lamp",
                        description: "BeoPlay Speaker",
                        price: 300
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
