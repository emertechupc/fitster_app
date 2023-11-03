import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/order_items.dart';

class OrderItemService extends ChangeNotifier {
  final String _baseUrl = 'fitsterupcapi.azurewebsites.net';

  Future<dynamic> createOrderItem(OrderItem newItem) async {
    final url = Uri.https(_baseUrl, '/api/v1/orderitem');
    Map<String, dynamic> body = {
      'productId': newItem.productId,
      'quantity': newItem.quantity,
      'subtotal': newItem.subtotal,
      'orderId' : newItem.orderId,
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
