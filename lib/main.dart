import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth/screens/signup_view.dart';
import 'home/screens/main_bounce_tab_bar.dart';
import 'home/service/item_service.dart';
import 'states/theme_state.dart';
import 'auth/screens/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FitsterApp());
}

class FitsterApp extends StatelessWidget {
  const FitsterApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ItemService()),
        ChangeNotifierProvider(
          create: (_) => ThemeState(),
        ),
      ],
      child: Consumer<ThemeState>(
        builder: (context, state, child) {
          return MaterialApp(
            initialRoute: 'signin',
            routes: {
              'signin': (_) => HomePage(),
              'signup': (_) => SignUpView(),
              'home': (_) => MainPage(),
            },

            title: 'Fitster',
            debugShowCheckedModeBanner: false,
            theme: state.currentTheme,
          );
        },
      ),
    );
  }
}
