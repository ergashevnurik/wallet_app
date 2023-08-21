import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  const MyCard({Key? key, required this.title, required this.description, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
        backgroundColor: MaterialStatePropertyAll(Colors.white),
        shadowColor: MaterialStatePropertyAll(Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width / 2.5,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.grey
              ),
            ),
            Text(title,
                style:TextStyle(
                  color:Colors.black
                )
            ),
            Text(description,
              style:TextStyle(
                  color:Colors.black
            ),
            ),
            Text("$price\$",
              style:TextStyle(
                  color:Colors.black
            ),
            ),
            SizedBox(height: 15)
          ],
        ),
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 200,
              color: Colors.amber,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Modal BottomSheet'),
                    ElevatedButton(
                      child: const Text('Close BottomSheet'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
