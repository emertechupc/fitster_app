import 'package:flutter/material.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  bool _obscureText = true;
  bool _readOnly = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggleRead() {
    setState(() {
      _readOnly = !_readOnly;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, 'home');
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                    fontSize: 16,
                  ),
                  readOnly: _readOnly,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    hintText: 'Enter your first name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                    fontSize: 16,
                  ),
                  readOnly: _readOnly,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    hintText: 'Enter your last name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                    fontSize: 16,
                  ),
                  readOnly: _readOnly,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    hintText: 'Enter your email',
                  ),
                  validator: (value) {
                    String pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = RegExp(pattern);
        
                    return regExp.hasMatch(value ?? '')
                        ? null
                        : 'The value does not look like an email';
                  },
                ),
              ),
              if (!_readOnly)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                      fontSize: 16,
                    ),
                    autocorrect: false,
                    readOnly: _readOnly,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: _toggle,
                      ),
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      hintText: 'Enter your new password',
                    ),
                    validator: (value) {
                      return (value != null && value.length >= 6)
                          ? null
                          : 'Password must be 6 characters long';
                    },
                  ),
                ),
              if (_readOnly)
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: FilledButton(
                    onPressed: () {
                      _toggleRead();
                    },
                    child: Text('Edit Profile'),
                  ),
                ),
              if (!_readOnly)
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: FilledButton(
                    onPressed: () {
                      _toggleRead();
                    },
                    child: Text('Save Profile'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
