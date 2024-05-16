// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_interpolation_to_compose_strings, unused_field, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:mobile_development/generated/l10n.dart';
import 'package:mobile_development/main.dart';
import 'package:mobile_development/screens/home.dart';
import 'package:mobile_development/screens/onboarding.dart';
import 'package:mobile_development/screens/username.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeakPage extends StatefulWidget {
  const SpeakPage({super.key});

  @override
  State<SpeakPage> createState() => _SpeakPageState();
}

class _SpeakPageState extends State<SpeakPage> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _wordsSpoken = "";
  Color color = Color.fromARGB(255, 171, 174, 179);
  bool showButton = false;

  void showButtonAfterAction() {
    setState(() {
      showButton = true;
    });
  }

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  void initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {
    });
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(result) {
    setState(() {
      _wordsSpoken = "${result.recognizedWords}";
      if (_wordsSpoken == word) {
        color = Color.fromARGB(255,91,168,144);
        showButton = true;
      }
      else {
        color = Color.fromARGB(255,214,24,93);
        showButton = false;
      }
    });
  }
  String word = 'cucumber';
  String transcription = "[ˈkjuːkʌmbə]";
  void _checkIfNameExists(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString('userName');
    if (userName != null && userName.isNotEmpty) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(userName: userName)));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => show ? IntroScreenDemo() : NameSelectionScreen()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).listening, style: TextStyle(fontFamily: 'Fredoka',color: Color.fromARGB(255, 255, 255, 254), fontSize: 24)),
        backgroundColor: Color.fromARGB(255, 65, 15, 163),
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
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(word, style: TextStyle(fontFamily: 'Fredoka',color: Theme.of(context).colorScheme.primary, fontSize: 28, fontWeight: FontWeight.w600)),
            Text(transcription, style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 17)),
            const SizedBox(height: 60),
            Row (children: [const SizedBox(width: 20),
            Text(S.of(context).pleasePressThisButtonAndSayThis, style: TextStyle(fontFamily: 'Fredoka',color: Theme.of(context).colorScheme.primary, fontSize: 22, fontWeight: FontWeight.w600)),],),
            Row (children: [const SizedBox(width: 20),
            Text(S.of(context).wordOurServiceWillCheck, style: TextStyle(fontFamily: 'Fredoka',color: Theme.of(context).colorScheme.primary, fontSize: 22, fontWeight: FontWeight.w600)),],),
            Row (children: [const SizedBox(width: 20),
            Text(S.of(context).yourPronunciation, style: TextStyle(fontFamily: 'Fredoka',color: Theme.of(context).colorScheme.primary, fontSize: 22, fontWeight: FontWeight.w600)),],),
            const SizedBox(height: 30),
            Expanded(
              child:       SizedBox(
              width: 375,
              height: 60,
              child: 
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                filled: true,
                hintText: _wordsSpoken,
                hintStyle: TextStyle(fontFamily: 'Fredoka', color: color, fontSize: 16),
                enabledBorder: OutlineInputBorder (
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Color.fromARGB(255, 243, 243, 242))
                ),
                focusedBorder: OutlineInputBorder (
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Color.fromARGB(255, 243, 243, 242))
                ),
              ),
            ),
            ),
            ),
            if(showButton)
            Container( 
              height:56,
              width:327,
              child:
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255,91,123,254),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
                ),
                elevation: 0
              ),
              onPressed: () {
                _checkIfNameExists(context);
              },
              child: Text(S.of(context).correct, style: TextStyle(fontFamily: 'Fredoka', color: Color.fromARGB(255, 255, 255, 254), fontSize: 20)),
            ),
            ),
            const SizedBox(height: 120),
              Container(
              height:160,
              width:160,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255,91,168,144),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
                  ),
                  elevation: 0
                ),
                      onPressed: _speechToText.isListening ? _stopListening : _startListening,
                      child: Image(image: NetworkImage('https://cdn.discordapp.com/attachments/609740555160911923/1230165296011149432/b7cae9060a8cf786.png?ex=663253b5&is=661fdeb5&hm=08457d97f833f774f974cc48a25eb33db4007523dc28dd46338f5793cccef20d&'),
                      ),
                    ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}