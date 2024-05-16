import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mobile_development/screens/home.dart';
import 'package:mobile_development/screens/internet.dart';
import 'package:mobile_development/screens/language_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class IntroScreenDemo extends StatefulWidget {
  @override
  State<IntroScreenDemo> createState() => _IntroScreenDemoState();
}

class _IntroScreenDemoState extends State<IntroScreenDemo>  {
  final _introKey = GlobalKey<IntroductionScreenState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
        child: IntroductionScreen(
          key: _introKey,
          pages: [
            PageViewModel(
      footer: SizedBox(
        height: 45,
        width: 300,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255,91,123,254),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              elevation: 8
          ),
          onPressed: () {

                      Future.delayed(const Duration(milliseconds: 100),
                          () => _introKey.currentState?.next());
          },
          child: const Text('Next', style: TextStyle(fontFamily: 'Fredoka',color: Color.fromARGB(255, 255, 255, 254), fontSize: 24)),
        ),
      ),
      title: 'Confidence in your words',
      body: "With conversation-based learning, you'll be talking from lesson one",
      image: Center(
        child: Image.network('https://cdn.discordapp.com/attachments/609740555160911923/1225812545332576326/illustrations.png?ex=66227de5&is=661008e5&hm=acaa0e8c950c4a9d3e70b790171b5a65c6967b3b129e48abedd149f3ee02bcbf&'),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontFamily: 'Fredoka',
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
        bodyTextStyle: TextStyle(
          fontFamily: 'Fredoka',
          fontSize: 18.0,
        )
      )
    ),
    PageViewModel(
        title: 'Take your time to learn',
        body: 'Develop a habit of learning and make it a part of your daily routine',
        footer: SizedBox(
          height: 45,
          width: 300,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255,91,123,254),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                elevation: 8
            ),
          onPressed: () {

                      Future.delayed(const Duration(milliseconds: 100),
                          () => _introKey.currentState?.next());
          },
            child: const Text('More', style: TextStyle(fontFamily: 'Fredoka',color: Color.fromARGB(255, 255, 255, 254), fontSize: 24)),
          ),
        ),
        image: Center(
          child: Image.network('https://cdn.discordapp.com/attachments/609740555160911923/1225812545072271400/illustrations_1.png?ex=66227de5&is=661008e5&hm=9a5b165c23d9f8e3e8375fc87379aa7d1e725154a3c76ee87f9089f80a68e891&'),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontFamily: 'Fredoka',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(
              fontFamily: 'Fredoka',
              fontSize: 18.0,
            )
        )
    ),
    PageViewModel(
        title: 'The lessons you need to learn',
        body: 'Using a variety of learning styles to learn and retain',
        footer: SizedBox(
          height: 45,
          width: 300,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255,91,123,254),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              elevation: 8
            ),
          onPressed: () => onDone(context), 
            child: const Text('Choose a language', style: TextStyle(fontFamily: 'Fredoka',color: Color.fromARGB(255, 255, 255, 254), fontSize: 24)),
          ),
        ),
        image: Center(
          child: Image.network('https://cdn.discordapp.com/attachments/609740555160911923/1225812544816677006/illustrations_2.png?ex=66227de5&is=661008e5&hm=52f0d3505acd6927683a8613aea46c4ceff9c31c737b9d71a792fdfbb8b92496&'),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontFamily: 'Fredoka',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(
              fontFamily: 'Fredoka',
              fontSize: 18.0,
            )
        )
    ),
          ],
          dotsDecorator: const DotsDecorator(
            size: Size(15,15),
            color: Color.fromARGB(255, 229, 229, 229),
            activeSize: Size(15,15),
            activeColor: Color.fromARGB(255, 247, 100, 0),
          ),
          showDoneButton: true,
          done: const Text('Done', style: TextStyle(fontSize: 20),),
          showSkipButton: true,
          skip: const Text('Skip', style: TextStyle(fontSize: 20),),
          showNextButton: true,
          next: const Icon(Icons.arrow_forward, size: 25,),
          onDone: () => onDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }
  String conn = '';
  Future<void> checkConnectivity() async {
    var connectivityRes = await Connectivity().checkConnectivity();
    if (connectivityRes == ConnectivityResult.none){
      conn = "Not Connected";
    }
    else {
      conn = "Connected";
    }
  }
  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    setState(() {
      checkConnectivity();
        if (conn == 'Not Connected') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => InternetScreen()));
        }
        else {
          _checkIfNameExists();
        }
    });
  }
  void _checkIfNameExists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString('userName');
    if (userName != null && userName.isNotEmpty) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(userName: userName)));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LanguageScreen()));
    }
  }

}