import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_development/main.dart';
import 'package:mobile_development/screens/home.dart';
import 'package:mobile_development/screens/internet.dart';
import 'package:mobile_development/screens/onboarding.dart';
import 'package:mobile_development/screens/username.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  String conn = "Not Connected";
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
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
      checkConnectivity();
        if (conn == 'Connected') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => InternetScreen()));
        }
        else {
          _checkIfNameExists();
        }
    });
    });
  }
  void _checkIfNameExists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString('userName');
    if (userName != null && userName.isNotEmpty) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(userName: userName)));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => show ? IntroScreenDemo() : NameSelectionScreen()));
    }
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 65, 15, 163),
          image: DecorationImage(image: NetworkImage('https://cdn.discordapp.com/attachments/609740555160911923/1230322540124311594/illustrations_3.png?ex=6632e627&is=66207127&hm=f97729dabc7ce6995b2ddcdd5c8f4ecc46d9f848ddc35eb33c20d37520c95883&')),
        ),
        child: const Column(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: [
            Text(''),
            Text('Language App', style: TextStyle(
              fontFamily: 'Fredoka',
              color: Colors.white,
              fontSize: 32)),
          ],
        )
      ),
    );
  }
}