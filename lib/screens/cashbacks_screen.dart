import 'dart:convert';

import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/models/purchase.dart';
import 'package:wallet_app/parts/bottom_bar.dart';
import 'package:http/http.dart' as http;


class CashBackScreen extends StatefulWidget {
  final String contact;
  const CashBackScreen({Key? key, required this.contact}) : super(key: key);

  @override
  State<CashBackScreen> createState() => _CashBackScreenState();
}

class _CashBackScreenState extends State<CashBackScreen> {
  bool _isLoading = true;
  List<PurchaseDetails> _purchaseDetails = [];

  @override
  void initState() {
    super.initState();
    _fetchPurchaseDetails();
  }

  Future<void> _fetchPurchaseDetails() async {
    // Make an HTTP GET request to your Spring Boot API to fetch user details
    final response = await http.get(
      Uri.parse('https://app.encode.uz/api/subscribers/v1/purchase-details/${widget.contact}'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      setState(() {
        _purchaseDetails = responseData.map((purchaseJson) => PurchaseDetails.fromJson(purchaseJson)).toList();
        _isLoading = false;
      });
    } else {
      print('Failed to fetch user details');
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
            "CASH BACKS PROFILE",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(17),
          child: _purchaseDetails.isEmpty ? // If no Cash Backs
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
          ) : ListView.builder(
            itemCount: _purchaseDetails.length,
            itemBuilder: (context, index) {
              final purchase = _purchaseDetails[index];
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(25),
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '🔢 Номер покупки: ${purchase.id}',
                          style: TextStyle(
                              fontSize: 16
                          ),
                        ),
                        Text(
                          '🎲 Количество: ${purchase.quantity}',
                          style: TextStyle(
                              fontSize: 16
                          ),
                        ),
                        Text(
                          '💰 Цена: ${purchase.totalSum}',
                          style: TextStyle(
                              fontSize: 16
                          ),
                        ),
                        Text(
                          '📆 Дата: ${purchase.date}',
                          style: TextStyle(
                              fontSize: 16
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18)
                ],
              );
            },
          ),
        )
      ),
    );
  }
}
