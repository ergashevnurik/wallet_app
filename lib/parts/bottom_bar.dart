import 'package:flutter/material.dart';
import 'package:wallet_app/screens/home_screen.dart';
import 'package:wallet_app/screens/settings_screen.dart';
import 'package:wallet_app/screens/shop_screen.dart';

import '../screens/cashbacks_screen.dart';
import '../screens/products_screen.dart';

class BottomBar extends StatelessWidget {
  final String contact;
  final String language;
  const BottomBar({Key? key, required this.contact, required this.language}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen(contact: contact)),
                );
              },
              icon: Icon(
                Icons.home,
                size: 32,
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ShopScreen()),
                  );
                },
                icon: Icon(
                  Icons.shopping_bag,
                  size: 32,
                )
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CashBackScreen(contact: contact))
                  );
                },
                icon: Icon(
                  Icons.checklist,
                  size: 32,
                )
            ),
            IconButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => SettingScreen(contact: contact)),
                  // );
                },
                icon: Icon(
                  Icons.settings,
                  size: 32,
                )
            )
          ],
        ),
      ),
    );
  }
}
