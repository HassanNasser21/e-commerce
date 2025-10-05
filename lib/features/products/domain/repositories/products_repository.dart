import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failuer.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';

abstract class ProductsRepository {
  Future<Either<Failuer,List<Product>>> getProducts({String? categoryId});
}