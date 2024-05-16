import 'package:flutter/material.dart';
import 'package:mobile_development/generated/l10n.dart';
import 'package:mobile_development/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NameSelectionScreen extends StatefulWidget {
  @override
  _NameSelectionPageState createState() => _NameSelectionPageState();
}

class _NameSelectionPageState extends State<NameSelectionScreen> {
  TextEditingController _nameController = TextEditingController();

  void _saveName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(S.of(context).nameSelection, style: TextStyle(fontFamily: 'Fredoka',color: Color.fromARGB(255, 255, 255, 254), fontSize: 20)),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 65, 15, 163),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('\n\n'),
            Image(image: NetworkImage('https://cdn.discordapp.com/attachments/609740555160911923/1229389297283633204/Image_5.png?ex=662f8101&is=661d0c01&hm=6d92031f402106d0ece1038a887319a921e5806c142dc5147f008c5ace35d83a&')),
            Text('\n'),
            Text(S.of(context).forFreeJoinNowAnd, style: TextStyle(fontFamily: 'Fredoka',color: Theme.of(context).colorScheme.primary, fontSize: 28, fontWeight: FontWeight.bold)),
            Text(S.of(context).startLearning, style: TextStyle(fontFamily: 'Fredoka',color: Theme.of(context).colorScheme.primary, fontSize: 28, fontWeight: FontWeight.bold)),
            Text('\n'),
            Text(S.of(context).username + '                                                                    ', style: TextStyle(fontFamily: 'Fredoka',color: Theme.of(context).colorScheme.primary, fontSize: 16)),
            Text('', style: TextStyle(fontFamily: 'Fredoka',color: Theme.of(context).colorScheme.primary, fontSize: 8)),
            SizedBox(
              width: 375,
              height: 60,
              child: 
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                filled: true,
                hintText: S.of(context).yourUsername,
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
            Text('\n\n\n\n\n\n\n\n\n\n\n'),
            Wrap(
              children: [
            Expanded(
              child: Container(
                height: 60,
                width: 375,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255,91,123,254),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    elevation: 0
                  ),
              onPressed: () {
                _saveName(_nameController.text);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(userName: _nameController.text)));
              },
              child: Text(S.of(context).save, style: TextStyle(fontFamily: 'Fredoka',color: Color.fromARGB(255, 255, 255, 254), fontSize: 24)),
            ),
              )
            )
              ]
            )
          ],
        ),
      ),
    );
  }
}