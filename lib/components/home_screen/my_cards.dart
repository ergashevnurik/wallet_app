import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {

  final int balance;
  final String cardNumber;
  final String expiryMonth;
  final String expiryYear;
  final color;
  final String cashBackPercentage;

  // String to l10n
  final String balanceString;
  final String currencyString;
  final String textString;


  const MyCard({Key? key, required this.balance, required this.cardNumber, required this.expiryMonth, required this.expiryYear, this.color, required this.cashBackPercentage, required this.balanceString, required this.currencyString, required this.textString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        width: 300,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${balanceString}',
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                Icon(
                    Icons.card_giftcard,
                    size: 45,
                    color: Colors.white,
                )
              ],
            ),
            SizedBox(height: 0),
            Text(
              '${balance.toString()} ${currencyString}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${textString}',
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                Text(
                  '${cashBackPercentage.toString()}%',
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                // Text(
                //   '${cardNumber.toString()}',
                //   style: TextStyle(
                //       color: Colors.white
                //   ),
                // ),
                // Text(
                //   '${expiryMonth.toString()}/${expiryYear.toString()}',
                //   style: TextStyle(
                //       color: Colors.white
                //   ),
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}
