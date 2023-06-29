import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const List<String> alfabeto = [
  'a',
  'b',
  'c',
  'd',
  'e',
  'f',
  'g',
  'h',
  'i',
  'j',
  'k',
  'l',
  'm',
  'n',
  'o',
  'p',
  'q',
  'r',
  's',
  't',
  'u',
  'v',
  'w',
  'x',
  'y',
  'z'
];

class Constants {
  static Future<void> readJson() async {
    // define a linguagem
    final String lang = Platform.localeName;
    // lê o conteúdo do arquivo
    var jsonContent = await rootBundle.loadString("assets/palavras_$lang.json");
    // converte em lista de palavras
    List<dynamic> jsonWords = json.decode(jsonContent);
    // 0 - 44
    int pos = Random().nextInt(jsonWords.length);
    print(jsonWords[pos]["palavra"]);
    print(jsonWords[pos]["categoria"]);
    print(jsonWords[pos]["dica"]);
  }
}

const List<String> wordData = [
  'bicicleta',
  'sino',
  'passeio',
  'escritor',
  'bolo',
  'balão',
  'pé',
  'chuveiro',
  'vilão',
  'porco',
  'inglês',
  'coração'
];
