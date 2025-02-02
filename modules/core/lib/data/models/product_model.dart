import 'package:core/domain/entities/product.dart';

class ProductModel {
  final int id;
  final String name;
  final double price;
  final String category;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
  });

  // تبدیل از JSON به مدل
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      category: json['category'],
    );
  }

  // تبدیل مدل به JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'category': category,
    };
  }

  // تبدیل مدل به انتیتی
  Product toEntity() {
    return Product(
      id: id,
      name: name,
      price: price,
      category: category,
    );
  }

  // ساخت مدل از انتیتی
  factory ProductModel.fromEntity(Product product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      price: product.price,
      category: product.category,
    );
  }
}
