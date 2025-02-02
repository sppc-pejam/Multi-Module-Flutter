import 'dart:convert';
import 'package:core/data/models/product_model.dart';
import 'package:flutter/services.dart';

class ProductLocalDataSource {
  Future<List<ProductModel>> getProducts() async {
    final String response = await rootBundle.loadString('json/products.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => ProductModel.fromJson(json)).toList();
  }
}
