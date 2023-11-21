import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/order.dart';

class OrderService extends ChangeNotifier {
  final String _baseUrl = 'fitsterupcapi.azurewebsites.net';

  Future<dynamic> createOrder(Order newOrder) async {
    final url = Uri.https(_baseUrl, '/api/v1/order');

    Map<String, dynamic> body = {
      'userId' : newOrder.userId,
      'total'  : newOrder.total,
      'orderDate' : newOrder.orderDate,
    };

    final resp = await http.post(
      url,
      body: jsonEncode(body),
      headers: {
        'content-type': 'application/json',
      },
    );

    final decodedData = json.decode(resp.body);

    return decodedData;
  }
}
