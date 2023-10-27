import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/item.dart';

class ItemService extends ChangeNotifier {
  ItemService() {
    getProduct();
  }

  Future<List<dynamic>> getProduct() async {
    var url = Uri.https('fakestoreapi.com', '/products');
    final response = await http.get(url, headers: {
      'content-type': 'application/json',
    });

    if (response.statusCode == 200) {
       final itemJson = jsonDecode(utf8.decode(response.bodyBytes));
       final data = convertList(itemJson);
       return data;
    }else {
      throw Exception('Error al obtener los datos ${response.statusCode}');
    }
  }

  static List<Item> convertList<T>(List<dynamic> json) {
    List<Item> objects = [];
    for (var item in json) {
      objects.add(Item.fromMap(item));
    }
    return objects;
  }
}
