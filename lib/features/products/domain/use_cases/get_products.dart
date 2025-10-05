import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failuer.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/products/domain/repositories/products_repository.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class GetProducts {
  final ProductsRepository productsRepository;
  const GetProducts(this.productsRepository);
  Future<Either<Failuer, List<Product>>> call({String? categoryId}) =>
      productsRepository.getProducts(categoryId: categoryId);
}
