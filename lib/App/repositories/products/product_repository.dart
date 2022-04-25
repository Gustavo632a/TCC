import 'package:Change/App/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> findAll();
}