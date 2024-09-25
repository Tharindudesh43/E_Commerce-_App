import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<Product>? _products;

  addProducts(List<Product> products) {
    _products = products;
    notifyListeners();
  }

  List<Product> get allproducts=> _products!;
}
