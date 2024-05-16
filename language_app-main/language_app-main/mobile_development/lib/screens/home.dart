// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:mobile_development/generated/l10n.dart';
import 'package:mobile_development/screens/answer.dart';
import 'package:mobile_development/screens/settings.dart';
import 'package:mobile_development/screens/speech.dart';
import 'package:mobile_development/screens/wp_result.dart';

class HomeScreen extends StatelessWidget {
  final String userName;

  HomeScreen({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(S.of(context).hello + ' $userName!', style: TextStyle(fontFamily: 'Fredoka',color: Color.fromARGB(255, 255, 255, 254), fontSize: 30)),
        backgroundColor: Color.fromARGB(255, 65, 15, 163),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: Row(
            children: [
              const SizedBox(width:16),
              Text(S.of(context).areYouReadyForLearningToday, style: TextStyle(fontFamily: 'Fredoka',color: Color.fromARGB(255, 182, 182, 182), fontSize: 20)),
              const SizedBox(width:26),
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
                },
                icon: Icon(Icons.menu, color: Color.fromARGB(255, 255, 255, 254)),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(CircleBorder()),
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 65, 15, 163)), // <-- Button color
                  overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                    if (states.contains(MaterialState.pressed)) return Color.fromARGB(255, 65, 15, 163); // <-- Splash color
                  }
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body:  SingleChildScrollView( child:
      Column(
        children: [
          Container(
        width: double.infinity,
        height: 16,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 65, 15, 163),
          ),
      ),
      Text(''),
          Row(
            children: [
              Text(S.of(context).topUsers, style: TextStyle(fontFamily: 'Fredoka',color: Theme.of(context).colorScheme.primary, fontSize: 24, fontWeight: FontWeight.w600)),
          ]),
          Column(
            children: [
              Text('         '),
              Container(
                height: 64,
                width: 327,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255,229,229,229),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    elevation: 0
                  ),
                  onPressed: () {

                  },
                  child: Row (
                    children: [
                      Image(image: NetworkImage('https://cdn.discordapp.com/attachments/609740555160911923/1229524469437956237/31c3fd136c43c40c.png?ex=662ffee4&is=661d89e4&hm=50e9dc3f63482e36eeed584d33a3c31e71f668fe4824d5c1672f717068559502&')),
                      Text('   Vincent van Gogh', style: TextStyle(fontFamily: 'Fredoka',color: Color.fromARGB(255, 0, 0, 1), fontSize: 17)),
                      Text('    12 ' + S.of(context).points, style: TextStyle(fontFamily: 'Fredoka',color: Color.fromARGB(255, 0, 0, 1), fontSize: 17)),
                    ],
                  )
                ) 
              ),
              Text('          '),
              Container(
                height: 64,
                width: 327,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255,229,229,229),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    elevation: 0
                  ),
                  onPressed: () {

                  },
                  child: Row (
                    children: [
                      Text('', style: TextStyle(fontSize: 9)),
                      Image(image: NetworkImage('https://cdn.discordapp.com/attachments/609740555160911923/1229524469173719060/1.png?ex=662ffee4&is=661d89e4&hm=0b0cd5400f52e93ab74bca48aa8ebf264e0f74ecd07427479a20104a26e73f98&')),
                      Text('   Dmitri Ivanovich\n   Mendeleev', style: TextStyle(fontFamily: 'Fredoka',color: Color.fromARGB(255, 0, 0, 1), fontSize: 17)),
                      Text('        10 ' + S.of(context).points, style: TextStyle(fontFamily: 'Fredoka',color: Color.fromARGB(255, 0, 0, 1), fontSize: 17)),
                    ],
                  )
                ) 
              ),
              Text('          '),
              Container(
                height: 64,
                width: 327,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255,229,229,229),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    elevation: 0
                  ),
                  onPressed: () {

                  },
                  child: Row (
                    children: [
                      Image(image: NetworkImage('https://cdn.discordapp.com/attachments/609740555160911923/1229524468888502363/2.png?ex=662ffee4&is=661d89e4&hm=d7cc442fbb62c06d5b3d9fa8b3e9b068c70f9300ac293dba490faee4ac25fe52&')),
                      Text('    Vlad Tepes', style: TextStyle(fontFamily: 'Fredoka',color: Color.fromARGB(255, 0, 0, 1), fontSize: 17)),
                      Text('                  8 ' + S.of(context).points, style: TextStyle(fontFamily: 'Fredoka',color: Color.fromARGB(255, 0, 0, 1), fontSize: 17)),
                    ],
                  )
                ) 
              )
        ]),
        Text(''),
          Row(
            children: [
              Text(S.of(context).availibleExercises, style: TextStyle(fontFamily: 'Fredoka',color: Theme.of(context).colorScheme.primary, fontSize: 24, fontWeight: FontWeight.w600)),
          ]),
          Text(''),
          Row(
            children: [
              Text('         '),
              Container(
                height: 117,
                width: 153,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255,91,123,254),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    elevation: 0
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AnswerScreen()));
                  },
                  child: Column (
                    children: [
                      Image(image: NetworkImage('https://cdn.discordapp.com/attachments/609740555160911923/1229490509148328098/cba397e799ad2b08.png?ex=662fdf44&is=661d6a44&hm=89ad8285e5ec39536815834ab15eaa6c6d406df33d6e3450b8edc9c09299209d&')),
                      Text(S.of(context).guessTheAnimal, style: TextStyle(fontFamily: 'Fredoka',color: Color.fromARGB(255, 255, 255, 254), fontSize: 11)),
                    ],
                  )
                ) 
              ),
              Text('          '),
              Container(
                height: 117,
                width: 153,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255,214,24,93),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    elevation: 0
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuestionScreen(key: UniqueKey())));
                  },
                  child: Column (
                    children: [
                      Text('', style: TextStyle(fontSize: 9)),
                      Image(image: NetworkImage('https://cdn.discordapp.com/attachments/609740555160911923/1229490508884213820/1.png?ex=662fdf44&is=661d6a44&hm=6621a1b9463d251bfbabe6be1c4d75a80ab01b9e93e9fb5fcd6a19b21f85ceff&')),
                      Text('', style: TextStyle(fontSize: 4)),
                      Text(S.of(context).wordPractice, style: TextStyle(fontFamily: 'Fredoka',color: Color.fromARGB(255, 255, 255, 254), fontSize: 11)),
                    ],
                  )
                ) 
              )
        ]),
        Text(''),
          Row(
            children: [
              Text('         '),
              Container(
                height: 117,
                width: 153,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255,247,100,0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    elevation: 0
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SpeakPage()));
                  },
                  child: Column (
                    children: [
                      Image(image: NetworkImage('https://cdn.discordapp.com/attachments/609740555160911923/1229490508615647303/2.png?ex=662fdf44&is=661d6a44&hm=e713583e15ba434994ff832626825bb6c1ca22a52eb76ce441c79a41a1c4654c&')),
                      Text('', style: TextStyle(fontSize: 4)),
                      Text(S.of(context).audition, style: TextStyle(fontFamily: 'Fredoka',color: Color.fromARGB(255, 255, 255, 254), fontSize: 11)),
                    ],
                  )
                ) 
              ),
              Text('          '),
              Container(
                height: 117,
                width: 153,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255,91,168,144),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    elevation: 0
                  ),
                  onPressed: () {

                  },
                  child: Column (
                    children: [
                      Image(image: NetworkImage('https://cdn.discordapp.com/attachments/609740555160911923/1229518470820008018/3.png?ex=662ff94e&is=661d844e&hm=3385f79cc5b8e347f15e00178e92260f1cdda387cb52da06dd2b5fd0d7e82b2e&')),
                      Text('', style: TextStyle(fontSize: 4)),
                      Text(S.of(context).game, style: TextStyle(fontFamily: 'Fredoka',color: Color.fromARGB(255, 255, 255, 254), fontSize: 11)),
                    ],
                  )
                ) 
              )
        ])
        ],
      )
      )
      );
  }
}