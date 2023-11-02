import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../globals.dart' as globals;
import '../model/user.dart';

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'fitsterupcapi.azurewebsites.net';

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
    };

    final url = Uri.https(_baseUrl, '/api/v1/users/sign-in');

    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(authData));
    final Map<String, dynamic> decodedResp = json.decode(response.body);
    if (response.statusCode == 200) {
      globals.id = decodedResp['id'];
      return null;
    } else {
      const text = 'Incorrect email or password.';
      return text;
    }
  }

  Future<String> register(User user) async {
    final url = Uri.https(_baseUrl, '/api/v1/users/sign-up');
    final resp = await http.post(
      url,
      body: user.toJson(),
      headers: {
        'content-type': 'application/json',
      },
    );

    // ignore: unused_local_variable
    final decodedData = json.decode(resp.body);

    return user.firstName;
  }
}
