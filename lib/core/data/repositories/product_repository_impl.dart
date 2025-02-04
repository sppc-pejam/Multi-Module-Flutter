

import 'package:multi_module_flutter/core/data/datasources/product_local_data_source.dart';
import 'package:multi_module_flutter/core/data/models/product_model.dart';
import 'package:multi_module_flutter/core/domain/entities/product.dart';
import 'package:multi_module_flutter/core/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl(this.localDataSource);

  @override
  Future<List<Product>> getProducts() async {
    final List<ProductModel> models = await localDataSource.getProducts();
    return models.map((e) => e.toEntity()).toList();
  }
}
