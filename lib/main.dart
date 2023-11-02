import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth/screens/signup_view.dart';
import 'auth/services/auth_service.dart';
import 'home/screens/main_bounce_tab_bar.dart';
import 'home/service/item_service.dart';
import 'profile/screens/user_profile_view.dart';
import 'profile/services/user_service.dart';
import 'shopping/screens/confirmed_status_view.dart';
import 'shopping/screens/order_view.dart';
import 'states/theme_state.dart';
import 'auth/screens/signin_view.dart';

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
        ChangeNotifierProvider(create: (_) => UserService()),
        ChangeNotifierProvider(create: (_) => AuthService()),
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
              'signin': (_) => SignInView(),
              'signup': (_) => SignUpView(),
              'home': (_) => MainPage(),
              'order': (_) => OrderView(),
              'confirmed': (_) => ConfirmedStatusView(),
              'profile': (_) => UserProfileView(),
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
