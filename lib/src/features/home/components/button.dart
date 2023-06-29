import 'package:flutter/material.dart';
import 'package:jogo_da_forca/src/shared/utils/textstyle.dart';
//utils
//import '../../../shared/utils/textstyle.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  const CustomButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .4,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(44, 44, 44, 1),
            Color.fromRGBO(209, 209, 209, 1),
          ],
        ),
      ),
      child: TextButton(
        child: Text(
          'Jogar',
          style: kButtonPrincipal,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
