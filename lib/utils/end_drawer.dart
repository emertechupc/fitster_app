import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/theme_state.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ClipRRect(
      child: Drawer(
        width: MediaQuery.of(context).size.width / 1.5,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: theme.colorScheme.background,
              ),
              accountEmail: Text(''),
              accountName: Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      child: Icon(
                        Icons.account_circle_sharp,
                        size: 50.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text('name lastname'),
                        Text('email@gmail.com'),
                      ],
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_outline_outlined),
              title: Text(
                'User Profile',
                style: theme.textTheme.bodyMedium,
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, 'profile');
              },
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text(
                'Order History',
                style: theme.textTheme.bodyMedium,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text(
                'Dark Mode',
                style: theme.textTheme.bodyMedium,
              ),
              trailing: Consumer<ThemeState>(
                builder: (context, state, child) {
                  return Switch(
                    value: state.isDarkModeEnabled,
                    onChanged: (_) {
                      state.setDarkMode(!state.isDarkModeEnabled);
                    },
                  );
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text(
                'Log Out',
                style: theme.textTheme.bodyMedium,
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, 'signin');
              },
            ),
          ],
        ),
      ),
    );
  }
}
