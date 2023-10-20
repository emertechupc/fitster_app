import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/theme_state.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Consumer<ThemeState>(
              builder: (context, state, child) {
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Enable dark mode?',
                      ),
                    ),
                    Switch(
                      value: state.isDarkModeEnabled,
                      onChanged: (_) {
                        state.setDarkMode(!state.isDarkModeEnabled);
                      },
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
