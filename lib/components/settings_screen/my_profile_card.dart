import 'package:flutter/material.dart';

class MyProfileCard extends StatelessWidget {
  final String pic;
  final String firstName;
  final String lastName;
  const MyProfileCard({Key? key, required this.firstName, required this.lastName, required this.pic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          "https://www.newvisiontheatres.com/wp-content/uploads/2023/06/Dwayne-Johnson.jpg",
          width: 100,
        ),
        /*Image.asset(
          "D://PYTHON_PROJECTS//discount_bot//${pic}",
          width: 100,
        ),*/
        SizedBox(width: 25),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Last name goes here
            Text(
              "${lastName}",
              style: TextStyle(
                  fontSize: 18
              ),
            ),
            SizedBox(height: 5),
            // First name goes here
            Text(
              "${firstName}",
              style: TextStyle(
                  fontSize: 18
              ),
            ),
            SizedBox(height: 5),
            // First name goes here
            // Container(
            //   padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            //   decoration: BoxDecoration(
            //       color: Colors.grey[300]
            //   ),
            //   child: Text(
            //     "DEALER",
            //     style: TextStyle(
            //         fontSize: 18,
            //         fontWeight: FontWeight.bold
            //     ),
            //   ),
            // ),
          ],
        )
      ],
    );
  }
}
