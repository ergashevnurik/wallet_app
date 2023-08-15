import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_app/components/home_screen/my_cards.dart';
import 'package:wallet_app/components/home_screen/my_list_tile.dart';
import 'package:wallet_app/components/home_screen/my_services.dart';
import 'package:wallet_app/parts/bottom_bar.dart';

class CreditCardConfiguration extends StatefulWidget {
  const CreditCardConfiguration({super.key});

  @override
  State<CreditCardConfiguration> createState() => _CreditCardConfigurationState();
}

class _CreditCardConfigurationState extends State<CreditCardConfiguration> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.grey[300],
        bottomNavigationBar: BottomBar(),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Credit Card Configeration',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),

                TextField(
                  decoration: InputDecoration(
                    labelText: 'Holder',
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Expiry Date',
                  ),
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'CVV',
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Card Name',
                  ),
                ),
                SizedBox(height: 24),

                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      // Добавьте здесь логику для проверки введенных данных и входа.
                    },
                    child: Text('Save'),

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