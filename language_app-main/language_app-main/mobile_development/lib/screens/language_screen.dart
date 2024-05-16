// ignore_for_file: use_key_in_widget_constructors, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:mobile_development/generated/l10n.dart';
import 'package:mobile_development/screens/home.dart';
import 'package:mobile_development/controllers/lang_controller.dart';
import 'package:mobile_development/screens/username.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


void _checkIfNameExists(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userName = prefs.getString('userName');
  if (userName != null && userName.isNotEmpty) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(userName: userName)));
  } 
  else {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NameSelectionScreen()));
  }
}

enum Language {english, russian}

class LanguageScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: 
          IconButton(
            onPressed: () {
              _checkIfNameExists(context);
            },
            icon: Icon(Icons.chevron_left, color: Color.fromARGB(255, 255, 255, 254)),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(CircleBorder()),
              padding: MaterialStateProperty.all(EdgeInsets.all(10)),
              backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 65, 15, 163)), // <-- Button color
              overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                if (states.contains(MaterialState.pressed)) return Color.fromARGB(255, 65, 15, 163); // <-- Splash color
                }
              ),
            ),
          ),
        title: Text(S.of(context).languageSelect, style: TextStyle(fontFamily: 'Fredoka',color: Color.fromARGB(255, 255, 255, 254), fontSize: 24)),
        backgroundColor: Color.fromARGB(255, 65, 15, 163),
      ),
      body: Consumer<LanguageController> (builder: (context, provider, child) {
      return Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container( 
              height:56,
              width:327,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255,91,123,254),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                  elevation: 0
                ),
                onPressed: () {
                  provider.changeLanguage(Locale('en'));
                  _checkIfNameExists(context);
                },
              child: Text(S.of(context).english, style: TextStyle(fontFamily: 'Fredoka', color: Color.fromARGB(255, 255, 255, 254), fontSize: 20)),
            ),
            ),
            const SizedBox(height: 20),
            Container( 
              height:56,
              width:327,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255,91,123,254),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                  elevation: 0
                ),
                onPressed: () {
                  provider.changeLanguage(Locale('ru'));
                  _checkIfNameExists(context);
                },
              child: Text(S.of(context).russian, style: TextStyle(fontFamily: 'Fredoka', color: Color.fromARGB(255, 255, 255, 254), fontSize: 20)),
            ),
            ),
          ]
        )
      );
      }
      )
    );
  }
}