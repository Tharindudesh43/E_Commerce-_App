import 'dart:convert';
import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List> getCategories() async {
    var url = Uri.https('fakestoreapi.com', 'products/categories');
    var response = await http.get(url);

    List categoryList = jsonDecode(response.body);
    return categoryList;
  }

  static Future<List<Product>> getProsucts() async {
    var url = Uri.https('fakestoreapi.com', 'products');
    var response = await http.get(url);
    List<Map<String, dynamic>> jsonproducts = jsonDecode(response.body);
    List<Product>? products = [];

    for (var item in jsonproducts) {
      products!.add(Product.fromJson(item));
    }
    print(products);
    return products!;
  }

  static getProsuctsById({required String productId}) async {
    var url = Uri.https('fakestoreapi.com', 'products/$productId');
    http.Response response = await http.get(url);
    print(response.statusCode);
    print(response.body);
  }

  static Future<List> getProductsByCategory({required String category}) async {
    Uri url = Uri.https('fakestoreapi.com', 'products/category/$category');
    http.Response response = await http.get(url);
    List products = jsonDecode(response.body);
    print(response.body);
    return products;
  }
}
