import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jogo_da_forca/src/features/game/store/game_store.dart';
import 'package:provider/provider.dart';

//utils
import '../../../shared/utils/textstyle.dart';

class Categoria extends StatelessWidget {
  const Categoria({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameStore = Provider.of<GameStore>(context);

    return Observer(
      builder: (_) => Container(
        padding: const EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: Text(
          gameStore.categoria,
          style: kHeadline1,
        ),
      ),
    );
  }
}
