import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';
import 'package:wallet_app/screens/home_screen.dart';
import 'package:wallet_app/screens/login_screen.dart';

void main() {
  runApp(MainHandler());
}

class MainHandler extends StatelessWidget {
  const MainHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),/*(BuildContext context, Widget? widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return CustomError(errorDetails: errorDetails);
        };
        return widget!;
      },*/
    home: LoginScreen()
    );
  }
}
