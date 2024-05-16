// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:mobile_development/generated/l10n.dart';
import 'package:mobile_development/screens/home.dart';
import 'package:mobile_development/screens/onboarding.dart';
import 'package:mobile_development/screens/username.dart';
import 'package:mobile_development/models/wp_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    Key? key,
  }) :super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionScreen> {
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
      appBar: AppBar(
        title: Text(S.of(context).wordPractice, style: TextStyle(fontFamily: 'Fredoka',color: Colors.white, fontSize: 24)),
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
            physics: NeverScrollableScrollPhysics(),
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
  Column buildQuestion(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 32),
        Text(question.word, style: TextStyle(fontFamily: 'Fredoka',color: Theme.of(context).colorScheme.primary, fontSize: 28, fontWeight: FontWeight.bold)),
        Text(question.transcription, style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 17)),
        const SizedBox(height: 32),
        Expanded(
          child: OptionsWidget(
            question: question,
            onClickedOption: (option) {
                setState(() {
                  question.selectedOption = option;
                  if (question.selectedOption!.isCorrect) {
                  score++;
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
      child: Text(questionNumber < questions.length ? S.of(context).next : S.of(context).finish, style: TextStyle(color: Colors.white, fontSize: 20)),
    );
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
}

class OptionsWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<Option> onClickedOption;

  const OptionsWidget({
    Key? key,
    required this.question, 
    required this.onClickedOption,
  }) :super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: question.options.map((option) => buildOption(context, option)).toList(),
    ),
  );
  Widget buildOption(BuildContext context, Option option) {
    final color = getColorForOption(option, question);
    return GestureDetector(
      onTap: () => onClickedOption(option),
    child: Container(
      height: 50,
      width: 375,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(option.word, style: TextStyle(fontFamily: 'Fredoka', color: Colors.black, fontSize: 20)),
      ],
    )
    )
    );
  }
  Color getColorForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
      if (isSelected) {
        return option.isCorrect ? Color.fromARGB(255,91,168,144) :  Color.fromARGB(255,247,100,0);
      }
      else if (option.isCorrect) {
        return Color.fromARGB(255,91,168,144);
      }
    
    return Color.fromARGB(255, 243, 243, 242);
    
  }
}

