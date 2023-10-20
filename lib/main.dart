import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'states/theme_state.dart';
import 'views/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FitsterApp());
}

class FitsterApp extends StatelessWidget {
  const FitsterApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeState(),
        ),
      ],
      child: Consumer<ThemeState>(
        builder: (context, state, child) {
          return MaterialApp(
            title: 'Fitster',
            debugShowCheckedModeBanner: false,
            theme: state.currentTheme,
            home: HomePage(),
          );
        },
      ),
    );
  }
}
