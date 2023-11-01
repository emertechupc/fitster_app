import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/card_container.dart';
import '../../utils/input_decoration.dart';
import '../provider/login_form_provider.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: theme.canvasColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/logo-2.png'),
                  height: MediaQuery.of(context).size.width / 1.3,
                ),
                SizedBox(height: 20),
                CardContainer(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text(
                        'Sign in',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: 10),
                      ChangeNotifierProvider(
                        create: (_) => LoginFormProvider(),
                        child: _LoginForm(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'signup');
                    },
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                            Colors.indigo.withOpacity(0.1)),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: Text(
                      'Don\'t have an account? Sign up',
                      style: theme.textTheme.bodyMedium,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            style: TextStyle(color: Colors.black),
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hintText: 'john.doe@gmail.com',
                labelText: 'Email',
                prefixIcon: Icons.alternate_email_rounded),
            onChanged: (value) => loginForm.email = value,
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);

              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'The value does not look like an email';
            },
          ),
          SizedBox(height: 30),
          TextFormField(
            style: TextStyle(color: Colors.black),
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Password',
                prefixIcon: Icons.lock_outline),
            onChanged: (value) => loginForm.password = value,
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : 'Password must be 6 characters long';
            },
          ),
          SizedBox(height: 30),
          ElevatedButton(
              onPressed: loginForm.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      //final authService = Provider.of<AuthService>(context, listen: false);

                      if (!loginForm.isValidForm()) return;

                      //loginForm.isLoading = true;

                      //final String? errorMessage = await authService.login(loginForm.email, loginForm.password);

                      /*if (errorMessage == null) {
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacementNamed(context, 'home');
                      } else {
                        // print( errorMessage );
                        NotificationsService.showSnackbar(errorMessage);
                        loginForm.isLoading = false;
                      }*/
                      Navigator.pushReplacementNamed(context, 'home');
                    },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  child: Text(
                    //loginForm.isLoading ? 'Esperando...' : 'Continuar',
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  )))
        ],
      ),
    );
  }
}
