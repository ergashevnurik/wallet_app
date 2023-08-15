import 'package:flutter/material.dart';

class MyCategoryCard extends StatelessWidget {
  final String cardText;
  final imagePath;
  const MyCategoryCard({Key? key, required this.cardText, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.grey[300],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "${cardText}",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
                imagePath,
                fit: BoxFit.contain,
                colorBlendMode: BlendMode.screen,
            ),
          )
        ],
      ),
    );
  }
}
