import 'dart:math';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../../shared/utils/constants.dart';
import 'package:flutter/material.dart';

abstract class IGameController {
  void novaPalavra() {}
  void _iniciarJogo() {}
  testarEntrada(String letra) {}
  replaceTiras({required String letra}) {}
  gameIsWinner() {}
  lostLife({required int vida}) {}
  String get tiras;
}

class GameController extends IGameController {
  late List<dynamic> banco; //palavra do banco do dados
  Random random = Random();
  late String palavraSorteada;
  late String categoria;
  late String _tiras;
  int _vidas = 0;
  List<String> _g = [];

  List<dynamic> tro = [];
  List<String> o = ['__ '];

  final List<String> entries = alfabeto;

  Future<void> initialize() async {
    // define a linguagem
    final String lang = Platform.localeName;
    // lê o conteúdo do arquivo
    var jsonContent = await rootBundle.loadString("assets/palavras_$lang.json");
    // converte em lista de palavras
    banco = json.decode(jsonContent);
    _iniciarJogo();
  }

  @override
  void _iniciarJogo() {
    // aqui pegou a palavra da lista
    // pra pegar a dica ou categoria pode fazer assim:
    // banco[random.nextInt(banco.length - 1)]["categoria"];
    // banco[random.nextInt(banco.length - 1)]["dica"];
    int pos = Random().nextInt(banco.length);
    palavraSorteada = banco[pos]["palavra"];
    categoria = banco[pos]["categoria"];
    //print(categoria);
    _tiras = novaPalavra();
    _vidas = 5;
    _g.clear();
  }

  String get tiras {
    return _tiras;
  }

  @override
  bool testarEntrada(String letra) {
    bool n = _g.contains(letra);
    debugPrint('print n ${n.toString()}');
    bool resultado = false;

    if (n == false) {
      // se g não tiver letra que o usuario digitou
      for (int k = 0; k < palavraSorteada.length; k++) {
        if (letra == palavraSorteada[k]) {
          _g.add(letra);

          debugPrint(_g.toString());
          resultado = true;
        } else if (letra.replaceAll('a', 'ã') == palavraSorteada[k]) {
          _g.add(letra.replaceAll('a', 'ã'));

          debugPrint(_g.toString());
          resultado = true;
        } else if (letra.replaceAll('a', 'á') == palavraSorteada[k]) {
          _g.add(letra.replaceAll('a', 'á'));

          debugPrint(_g.toString());
          resultado = true;
        } else if (letra.replaceAll('e', 'ê') == palavraSorteada[k]) {
          _g.add(letra.replaceAll('e', 'ê'));

          debugPrint(_g.toString());
          resultado = true;
        } else if (letra.replaceAll('e', 'é') == palavraSorteada[k]) {
          _g.add(letra.replaceAll('e', 'é'));

          debugPrint(_g.toString());
          resultado = true;
        } else if (letra.replaceAll('i', 'í') == palavraSorteada[k]) {
          _g.add(letra.replaceAll('i', 'í'));

          debugPrint(_g.toString());
          resultado = true;
        } else if (letra.replaceAll('o', 'ó') == palavraSorteada[k]) {
          _g.add(letra.replaceAll('o', 'ó'));

          debugPrint(_g.toString());
          resultado = true;
        } else if (letra.replaceAll('o', 'ô') == palavraSorteada[k]) {
          _g.add(letra.replaceAll('o', 'ô'));

          debugPrint(_g.toString());
          resultado = true;
        } else if (letra.replaceAll('o', 'õ') == palavraSorteada[k]) {
          _g.add(letra.replaceAll('o', 'õ'));

          debugPrint(_g.toString());
          resultado = true;
        } else if (letra.replaceAll('u', 'ú') == palavraSorteada[k]) {
          _g.add(letra.replaceAll('u', 'ú'));

          debugPrint(_g.toString());
          resultado = true;
        } else if (letra.replaceAll('c', 'ç') == palavraSorteada[k]) {
          _g.add(letra.replaceAll('c', 'ç'));

          debugPrint(_g.toString());
          resultado = true;
        }
        debugPrint(_g.toString());
        //resultado = false;
      } //for
    }

    return resultado;
  }

  @override
  String replaceTiras({required String letra}) {
    if (_g.isNotEmpty) {
      for (int x = 0; x < palavraSorteada.length; x++) {
        for (int m = 0; m < _g.length; m++) {
          if (_g[m] == palavraSorteada[x]) {
            tro[x] = tro[x].replaceAll(tro[x], palavraSorteada[x]);
          } // if
        } //for 2
      } //for 1
    }
    _tiras = tro.join('');
    return _tiras;
  } // _testando

  @override
  int lostLife({required int vida}) {
    _vidas--;
    return _vidas;
  }

  @override
  bool gameIsWinner() {
    if (_g.length == palavraSorteada.length) {
      return true;
    } else {
      return false;
    }
  }

  @override
  String novaPalavra() {
    for (int l = 0; l < palavraSorteada.length; l++) {
      tro += o;
    }
    String a = tro.join();
    return a;
  }
}
