import 'package:flutter/material.dart';
import 'popup_model.dart';

class GameOver extends StatelessWidget {
  final String word;
  const GameOver({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopUpModel(
      frase: 'Game Over',
      word: 'A palavra era $word',
      color: Color.fromARGB(255, 247, 75, 75),
    );
  }
}
