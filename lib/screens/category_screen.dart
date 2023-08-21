import 'package:flutter/material.dart';
import 'package:wallet_app/parts/bottom_bar.dart';
import 'package:wallet_app/parts/app_bar.dart';

class categoryScreen extends StatefulWidget {
  const categoryScreen({Key? key}) : super(key: key);

  @override
  State<categoryScreen> createState() => _categoryScreenState();
}

class _categoryScreenState extends State<categoryScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        bottomNavigationBar: BottomBar(),
        appBar: AppBar(),
        body: SafeArea(
          child: SingleChildScrollView (
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Categories", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                child: Icon(
                                  Icons.star,
                                  size: 34,
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                                "Man",
                                style: TextStyle(fontSize: 15,)
                            ),
                          ],
                        ),
                        SizedBox(width: 20,),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                child: Icon(
                                  Icons.star,
                                  size: 34,
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                                "Man",
                                style: TextStyle(fontSize: 15,)
                            ),
                          ],
                        ),
                        SizedBox(width: 20,),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                child: Icon(
                                  Icons.star,
                                  size: 34,
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                                "Man",
                                style: TextStyle(fontSize: 15,)
                            ),
                          ],
                        ),
                        SizedBox(width: 20,),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                child: Icon(
                                  Icons.star,
                                  size: 34,
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                                "Man",
                                style: TextStyle(fontSize: 15,)
                            ),
                          ],
                        ),
                        SizedBox(width: 20,),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                child: Icon(
                                  Icons.star,
                                  size: 34,
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                                "Man",
                                style: TextStyle(fontSize: 15,)
                            ),
                          ],
                        ),
                        SizedBox(width: 20,),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                child: Icon(
                                  Icons.star,
                                  size: 34,
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                                "Man",
                                style: TextStyle(fontSize: 15,)
                            ),
                          ],
                        ),
                        SizedBox(width: 20,),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                child: Icon(
                                  Icons.star,
                                  size: 34,
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                                "Man",
                                style: TextStyle(fontSize: 15,)
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}
