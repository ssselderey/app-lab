import 'package:flutter/material.dart';

class Animal {
  final String word;
  final Image image;

  Animal ( {
    required this.word,
    required this.image,
  });
}
class Option {
  final String word;

  const Option({
    required this.word,
  });
}

final questions = [
  Animal(
    word: 'racoon', 
    image: Image.network('https://cdn.discordapp.com/attachments/609740555160911923/1230063235571515403/PAY-main_1.png?ex=6631f4a8&is=661f7fa8&hm=7d064f37bf78c3bbef00b415204972f4c699b6fd681dab2bae39e6ace1869202&'),
  ),
    Animal(
    word: 'racoon', 
    image: Image.network('https://cdn.discordapp.com/attachments/609740555160911923/1230063235571515403/PAY-main_1.png?ex=6631f4a8&is=661f7fa8&hm=7d064f37bf78c3bbef00b415204972f4c699b6fd681dab2bae39e6ace1869202&'),
  ),
    Animal(
    word: 'racoon', 
    image: Image.network('https://cdn.discordapp.com/attachments/609740555160911923/1230063235571515403/PAY-main_1.png?ex=6631f4a8&is=661f7fa8&hm=7d064f37bf78c3bbef00b415204972f4c699b6fd681dab2bae39e6ace1869202&'),
  ),
];