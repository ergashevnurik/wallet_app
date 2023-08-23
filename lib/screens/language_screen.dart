import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:language_picker/language_picker_dropdown.dart';
import 'package:language_picker/languages.dart';
import 'package:language_picker/languages.g.dart';
import 'package:wallet_app/parts/bottom_bar.dart';

class LanguageConfiguration extends StatefulWidget {
  const LanguageConfiguration({Key? key}) : super(key: key);

  @override
  State<LanguageConfiguration> createState() => _LanguageConfigurationState();
}

class _LanguageConfigurationState extends State<LanguageConfiguration> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "CONFIGURE PERSONAL SETTINGS",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          ),
          centerTitle: true,
        ),
        // bottomNavigationBar: BottomBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LanguagePickerDropdown(
                    initialValue: Languages.korean,
                    onValuePicked: (Language language) {
                      print(language.name);
                    }
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: (){
                  },
                  child: Text("Save"),
                ),
              )

            ],
          ),
        ),
      ),
      ),
      
    );
  }
}
