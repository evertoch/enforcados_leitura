import 'package:flutter/material.dart';
// utils
import '../../../shared/utils/textstyle.dart';

class Button extends StatelessWidget {
  final String letra;
  final bool isPressed;
  final void Function()? onPressed;
  final Color colorPressed; // Cor ao pressionar o botão

  Button({
    Key? key,
    required this.letra,
    required this.isPressed,
    required this.onPressed,
    this.colorPressed = Colors.grey, // Cor cinza como padrão
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
      child: SizedBox(
        height: 50,
        width: 50,
        child: TextButton(
          child: Text(
            letra,
            style: kButtonSecondary,
          ),
          style: TextButton.styleFrom(
            backgroundColor: isPressed ? colorPressed : Colors.white,
            elevation: isPressed ? 0 : 4,
            shadowColor: Color.fromARGB(255, 163, 163, 163),
            padding: const EdgeInsets.all(2.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
