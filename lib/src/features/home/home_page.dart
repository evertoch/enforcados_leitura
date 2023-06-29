import 'package:flutter/material.dart';

//routes

//ads Mobile

import '../../shared/utils/app_routes.dart';
//components
import 'components/button.dart';
import 'components/imagem.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x00000),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Center(child: Imagem()),
          Center(
            child: CustomButton(onPressed: () {
              Navigator.pushNamed(
                //adiciona essa tela a pilha de navegação
                context,
                AppRoutes.GAME,
              );
            }),
          ),
        ],
      ),
    );
  }
}
