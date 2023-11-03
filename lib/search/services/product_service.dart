import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/product.dart';

class ProductService extends ChangeNotifier {
  final String _baseUrl = 'fitsterupcapi.azurewebsites.net';

  Future<List<dynamic>> getAllProducts() async {
    final Uri url = Uri.https(_baseUrl, '/api/v1/products');

    final resp = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
      },
    );

    if (resp.statusCode == 200) {
      final productJson = jsonDecode(resp.body);
      final products = convertList(productJson);

      return products;
    } else {
      return [];
    }
  }

  Future<Product> getProductById(int id) async {
    final Uri url = Uri.https(_baseUrl, '/api/v1/products/$id');

    final resp = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
      },
    );

    if (resp.statusCode == 200) {
      final productJson = jsonDecode(resp.body);
      final product = Product.fromMap(productJson);

      return product;
    } else {
      throw Exception('Error al obtener el usuario ${resp.statusCode}');
    }
  }

  static List<Product> convertList<T>(List<dynamic> json) {
    List<Product> objects = [];
    for (var item in json) {
      objects.add(Product.fromMap(item));
    }
    return objects;
  }
}
