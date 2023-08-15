import 'package:flutter/material.dart';

class MyServices extends StatelessWidget {
  final icon;
  final String buttonText;
  final pageRouter;

  const MyServices({Key? key, this.icon, required this.buttonText, this.pageRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 60,
                      spreadRadius: 2
                  )
                ]
            ),
            child: IconButton(
              onPressed: pageRouter,
              icon: Icon(
                icon,
              ),
            ),
          ),

          SizedBox(height: 12),

          Text(buttonText)
        ],
      );
  }
}
