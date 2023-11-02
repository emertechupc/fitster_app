import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../auth/model/user.dart';

class UserService extends ChangeNotifier {
  final String _baseUrl = 'fitsterupcapi.azurewebsites.net';
  bool isSaving = false;
  late User selectedUser;
  
  Future<User> getUserById(int id) async {
    final Uri url = Uri.https(_baseUrl, '/api/v1/users/$id');

    final resp = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
      },
    );

    if (resp.statusCode == 200) {
      final userJson = jsonDecode(utf8.decode(resp.bodyBytes));
      final user = User.fromMap(userJson);

      return user;
    } else {
      throw Exception('Error al obtener el usuario ${resp.statusCode}');
    }
  }

  Future<String> updateUser(User user) async {
    final Uri url = Uri.https(_baseUrl, '/api/v1/users/${user.id}');
    final resp = await http.put(
      url,
      headers: {
        'content-type': 'application/json',
      },
      body: user.toJson(),
    );
    if (resp.statusCode == 200) {
      return user.firstName;
    } else {
      throw Exception('Error al obtener el usuario');
    }
  }
}
