import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final icon;
  final String tileName;
  final String description;
  const MyListTile({Key? key, required this.icon, required this.tileName, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 80,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Icon(
                  icon,
                  color: Color(0xFFFF9021),
                  size: 50,
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${tileName}',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('${description}')
                ],
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
