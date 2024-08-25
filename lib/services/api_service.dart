import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List> getCategories() async {
    var url = Uri.https('fakestoreapi.com', 'products/categories');
    var response = await http.get(url);

    List categoryList = jsonDecode(response.body);
    return categoryList;
  }

  static getProsucts() async {
    var url = Uri.https('fakestoreapi.com', 'products');
    var response = await http.get(url);
    print(response.body);
  }

  static getProsuctsById({required String productId}) async {
    var url = Uri.https('fakestoreapi.com', 'products/$productId');
    http.Response response = await http.get(url);
    print(response.statusCode);
    print(response.body);
  }
}
