import 'package:flutter/material.dart';

import '../../screens/language_screen.dart';

class MyConfigCard extends StatelessWidget {
  final String cardText;
  final icon;
  final onPressed;
  const MyConfigCard({Key? key, required this.cardText, this.icon, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(50)
            ),
            child: Icon(
              icon,
              size: 32,
            ),
          ),
          SizedBox(width: 15),
          Text(
            "${cardText}",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}
