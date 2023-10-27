import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/card_container.dart';
import '../../utils/input_decoration.dart';
import '../provider/signup_form_provider.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
                        'Sign up',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: 10),
                      ChangeNotifierProvider(
                        create: (_) => SignUpFormProvider(),
                        child: _SignUpForm(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'signin');
                  },
                  style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                          Colors.indigo.withOpacity(0.1)),
                      shape: MaterialStateProperty.all(StadiumBorder())),
                  child: Text(
                    'Already have an account? Sign in',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<SignUpFormProvider>(context);

    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            style: TextStyle(color: Colors.black),
            autocorrect: false,
            decoration: InputDecorations.authInputDecoration(
                hintText: 'John',
                labelText: 'First Name',
                prefixIcon: Icons.person),
            onChanged: (value) => loginForm.name = value,
            validator: (value) {
              return (value != null && value.isNotEmpty)
                  ? null
                  : 'This field is required';
            },
          ),
          TextFormField(
            style: TextStyle(color: Colors.black),
            autocorrect: false,
            decoration: InputDecorations.authInputDecoration(
                hintText: 'Doe',
                labelText: 'Last Name',
                prefixIcon: Icons.person),
            onChanged: (value) => loginForm.lastname = value,
            validator: (value) {
              return (value != null && value.isNotEmpty)
                  ? null
                  : 'This field is required';
            },
          ),
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
          TextFormField(
            style: TextStyle(color: Colors.black),
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Confirm Password',
                prefixIcon: Icons.lock_outline),
            onChanged: (value) => loginForm.confirmPassword = value,
            validator: (value) {
              return (value != null && value == loginForm.password)
                  ? null
                  : 'Password does not match';
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
                      Navigator.pushReplacementNamed(context, 'signin');
                    },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  child: Text(
                    //loginForm.isLoading ? 'Esperando...' : 'Continuar',
                    'Sign up',
                    style: TextStyle(color: Colors.white),
                  )))
        ],
      ),
    );
  }
}
