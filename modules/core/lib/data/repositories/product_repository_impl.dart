import 'package:core/domain/entities/product.dart';
import 'package:core/domain/repositories/product_repository.dart';
import 'package:core/data/datasources/product_local_data_source.dart';
import 'package:core/data/models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl(this.localDataSource);

  @override
  Future<List<Product>> getProducts() async {
    final List<ProductModel> models = await localDataSource.getProducts();
    return models.map((e) => e.toEntity()).toList();
  }
}
