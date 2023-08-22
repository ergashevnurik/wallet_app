import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/parts/bottom_bar.dart';

class CashBackScreen extends StatefulWidget {
  const CashBackScreen({Key? key}) : super(key: key);

  @override
  State<CashBackScreen> createState() => _CashBackScreenState();
}

class _CashBackScreenState extends State<CashBackScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // bottomNavigationBar: BottomBar(),
        body: SafeArea(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CASH BACKS PROFILE",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      Container(
                        height: height,
                        width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AnimatedEmoji(
                              AnimatedEmojis.cryingCatFace,
                              size: 128,
                              repeat: true,
                            ),
                            Text(
                                "No cash backs\nin your wallet",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24
                                ),
                            ),
                          ],
                        ),
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
