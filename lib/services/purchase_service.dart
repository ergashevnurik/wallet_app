import 'dart:convert';

import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/models/purchase.dart';
import 'package:wallet_app/parts/bottom_bar.dart';
import 'package:http/http.dart' as http;

class PurchaseService {
  bool _isLoading = true;
  List<PurchaseDetails> _purchaseDetails = [];

  Future<void> _fetchPurchaseDetails(widget) async {
    // Make an HTTP GET request to your Spring Boot API to fetch user details
    final response = await http.get(
      Uri.parse('http://10.0.2.2:82/api/subscribers/v1/purchase-details/${widget.contact}'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      // setState(() {
        _purchaseDetails = responseData.map((purchaseJson) => PurchaseDetails.fromJson(purchaseJson)).toList();
        _isLoading = false;
      // });
    } else {
      print('Failed to fetch user details');
    }
  }
}