import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../globals.dart' as globals;
import '../profile/services/user_service.dart';
import '../states/theme_state.dart';

class NavDrawer extends StatelessWidget {
  final userService = UserService();
  NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final userFuture = userService.getUserById(globals.id);
    final theme = Theme.of(context);

    return FutureBuilder(
      future: userFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final user = snapshot.data!;
            final firstname = user.firstName;
            final lastname = user.lastName;
            final email = user.email;

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
                              children: <Widget>[
                                Text('$firstname $lastname'),
                                Text(
                                  email,
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
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
                      leading: Icon(Icons.favorite),
                      title: Text(
                        'Wish List',
                        style: theme.textTheme.bodyMedium,
                      ),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, 'wishlist');
                      },
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
          } else {
            return Text('No se pudo obtener la información');
          }
        } else {
          return ClipRRect(
            child: Drawer(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}
