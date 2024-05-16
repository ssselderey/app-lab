// ignore_for_file: unrelated_type_equality_checks, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mobile_development/generated/l10n.dart';
import 'package:mobile_development/main.dart';
import 'package:mobile_development/screens/home.dart';
import 'package:mobile_development/screens/onboarding.dart';
import 'package:mobile_development/screens/username.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InternetScreen extends StatefulWidget {

  @override
  State<InternetScreen> createState() => _InternetScreenState();
}

class _InternetScreenState extends State<InternetScreen> {
    void _checkIfNameExists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString('userName');
    if (userName != null && userName.isNotEmpty) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(userName: userName)));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => show ? IntroScreenDemo() : NameSelectionScreen()));
    }
  }

  String conn = 'Not Connected';
  Future<void> checkConnectivity() async {
    var connectivityRes = await Connectivity().checkConnectivity();
    if (connectivityRes == ConnectivityResult.none){
      conn = "Not Connected";
    }
    else {
      conn = "Connected";
    }
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 65, 15, 163),
      ),
      body: Center(
        child: Column (
          children: [
            Text('\n\n\n\n\n\n\n\n'),
            Image.network('https://cdn.discordapp.com/attachments/609740555160911923/1229097306352124147/227992211beff7ef.png?ex=662e7111&is=661bfc11&hm=74d2eb642031b4838d964d5dfdc5f712c402a2fc6980c9efcb7c16213483945f&'),
            Text(S.of(context).no, style: TextStyle(fontFamily: 'Fredoka',color: Theme.of(context).colorScheme.primary, fontSize: 30, fontWeight: FontWeight.bold)),
            Text(S.of(context).internetConnection, style: TextStyle(fontFamily: 'Fredoka',color: Theme.of(context).colorScheme.primary, fontSize: 30, fontWeight: FontWeight.bold)), 
            Text('\n\n\n\n\n\n\n\n\n\n\n'),
            Wrap(
              children: [
            Expanded(
              child: Container(
                
                height: 45,
                width: 350,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255,91,123,254),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    ),
                    elevation: 0
                  ),
                  onPressed: () {
                    setState(() {
                      checkConnectivity();
                      if (conn == 'Connected') {
                        _checkIfNameExists();
                      } 

                    });
                  },
                  child: Text(S.of(context).checkAgain, style: TextStyle(fontFamily: 'Fredoka',color: Colors.white, fontSize: 24)),
                ) 
              )
            )
          ])
          ],
        
        ),
      ),
    );
    }
    }