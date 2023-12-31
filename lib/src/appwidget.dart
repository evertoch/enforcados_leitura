import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/game/store/game_store.dart';

//screens
import 'features/game/game.dart';
import 'features/home/home_page.dart';

//routes
import 'shared/utils/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GameStore>(
          create: (_) => GameStore(),
        ),
      ],
      child: MaterialApp(
          title: 'Home Page',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: '',
          ), //theme
          routes: {
            AppRoutes.HOME: (ctx) => HomePage(),
            AppRoutes.GAME: (ctx) => const GamePage(),
          }),
    );
  }
}
