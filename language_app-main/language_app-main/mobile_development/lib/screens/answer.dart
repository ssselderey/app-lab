// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:mobile_development/generated/l10n.dart';
import 'package:mobile_development/main.dart';
import 'package:mobile_development/screens/home.dart';
import 'package:mobile_development/screens/onboarding.dart';
import 'package:mobile_development/screens/username.dart';
import 'package:mobile_development/models/answer_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


TextEditingController _answerController = TextEditingController();
    void _saveName(String answer) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('answer', answer);
  }

class AnswerScreen extends StatefulWidget {
  const AnswerScreen({
    Key? key,
  }) :super(key: key);

  @override
  State<AnswerScreen> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerScreen> {
  late PageController _controller;
  int questionNumber = 1;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(S.of(context).guessTheAnimal, style: TextStyle(fontFamily: 'Fredoka',color: Color.fromARGB(255, 255, 255, 254), fontSize: 24)),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: PageView.builder(
            itemCount: questions.length,
            controller: _controller,
            itemBuilder: (context, index) {
              final _question = questions[index];
              return buildQuestion(_question);
            },
          )),
          Center(child:
          Container( 
            width: 327,
            height: 56,
            child: buildElevatedButton(),
          ),
          ),
          const SizedBox(height: 20),
        ],
      ),
      );
  }
  Column buildQuestion(Animal question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 32),
        question.image,
        const SizedBox(height: 10),
        Text(S.of(context).writeWhoIsOnTheImage, style: TextStyle(fontFamily: 'Fredoka', color: Theme.of(context).colorScheme.primary, fontSize: 15)),
        const SizedBox(height: 10),
        Expanded(
          child: OptionsWidget(
            question: question,
            onClickedOption: (option) {
                setState(() {
                  if (_answerController.text == question.word) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => IncorrectAnswerScreen()));

                }
                });
              }
          ),
        ),
      ],
    );
  }

    ElevatedButton buildElevatedButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
       backgroundColor: Color.fromARGB(255,91,123,254),
       shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
       ),
       elevation: 0
      ),
      onPressed: () {
        _saveName(_answerController.text);
        if (_answerController.text.toLowerCase() == 'racoon') {
          _answerController.text = '';
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CorrectAnswerScreen()));  }
        else {
          _answerController.text = '';
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => IncorrectAnswerScreen())); 
        }
        if (questionNumber < questions.length) {
          _controller.nextPage(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInExpo,
          );
          setState(() {
            questionNumber++;
          });
        }
        else {
          _checkIfNameExists(context);
        }
      }, 
      child: Text(questionNumber < questions.length ? S.of(context).next : S.of(context).finish, style: TextStyle(color: Color.fromARGB(255, 255, 255, 254), fontSize: 20)),
    );
  }
}
    void _checkIfNameExists(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString('userName');
    if (userName != null && userName.isNotEmpty) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(userName: userName)));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => show ? IntroScreenDemo() : NameSelectionScreen()));
    }
  }
class OptionsWidget extends StatelessWidget {
  final Animal question;
  final ValueChanged<Option> onClickedOption;

  OptionsWidget({
    Key? key,
    required this.question, 
    required this.onClickedOption,
  }) :super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: 
      SizedBox(
              width: 375,
              height: 60,
              child: 
            TextField(
              controller: _answerController,
              decoration: InputDecoration(
                filled: true,
                hintText: S.of(context).yourAnswer,
                hintStyle: TextStyle(fontFamily: 'Fredoka',color: Color.fromARGB(255, 171, 174, 179), fontSize: 16),
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
  );
}

class IncorrectAnswerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).guessTheAnimal, style: TextStyle(fontFamily: 'Fredoka',color: Color.fromARGB(255, 255, 255, 254), fontSize: 24)),
        backgroundColor: Color.fromARGB(255,214,24,93),
                leading: 
          IconButton(
            onPressed: () {
              _checkIfNameExists(context);
            },
            icon: Icon(Icons.chevron_left, color: Color.fromARGB(255, 255, 255, 254)),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(CircleBorder()),
              padding: MaterialStateProperty.all(EdgeInsets.all(10)),
              backgroundColor: MaterialStateProperty.all(Color.fromARGB(255,214,24,93)), // <-- Button color
              overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                if (states.contains(MaterialState.pressed)) return Color.fromARGB(255,214,24,93); // <-- Splash color
                }
              ),
            ),
          ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 100),
            Image(image: NetworkImage('https://cdn.discordapp.com/attachments/609740555160911923/1230103261747609662/5dcbb4c942848758.png?ex=663219ef&is=661fa4ef&hm=92befd9faca4e3cd3a9bea5e6ec96b0309dce7101c88a943d45653260a0d9327&')),
            Text(S.of(context).ehWrongAnswer, style: TextStyle(fontFamily: 'Fredoka',color: Theme.of(context).colorScheme.primary, fontSize: 24)),
            Text(S.of(context).thatIsRacoon, style: TextStyle(fontFamily: 'Fredoka',color: Theme.of(context).colorScheme.primary, fontSize: 24)),
            SizedBox(height: 220),
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
              child: Text(S.of(context).finish, style: TextStyle(color: Color.fromARGB(255, 255, 255, 254), fontSize: 20)),
            ),
            ),
            SizedBox(height: 20),
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AnswerScreen())); 
              },
              child: Text(S.of(context).tryAgain, style: TextStyle(color: Color.fromARGB(255, 255, 255, 254), fontSize: 20)),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
class CorrectAnswerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).guessTheAnimal, style: TextStyle(fontFamily: 'Fredoka',color: Color.fromARGB(255, 255, 255, 254), fontSize: 24)),
        backgroundColor: Color.fromARGB(255,91,168,144),
                leading: 
          IconButton(
            onPressed: () {
              _checkIfNameExists(context);
            },
            icon: Icon(Icons.chevron_left, color: Color.fromARGB(255, 255, 255, 254)),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(CircleBorder()),
              padding: MaterialStateProperty.all(EdgeInsets.all(10)),
              backgroundColor: MaterialStateProperty.all(Color.fromARGB(255,91,168,144)), // <-- Button color
              overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                if (states.contains(MaterialState.pressed)) return Color.fromARGB(255,91,168,144); // <-- Splash color
                }
              ),
            ),
          ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 100),
            Image(image: NetworkImage('https://cdn.discordapp.com/attachments/609740555160911923/1230103262208987136/8eb8dc1f4039386c.png?ex=663219ef&is=661fa4ef&hm=ba4865e67a21a98409e7fe77550d713ee9be0902b16e53c49f9e00acdd6e06a6&')),
            Text(S.of(context).holyMollyThatIsCorrect, style: TextStyle(fontFamily: 'Fredoka',color: Theme.of(context).colorScheme.primary, fontSize: 24)),
            SizedBox(height: 280),
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
              child: Text(S.of(context).finish, style: TextStyle(color: Color.fromARGB(255, 255, 255, 254), fontSize: 20)),
            ),
            ),
          ],
        ),
      ),
    );
  }
}