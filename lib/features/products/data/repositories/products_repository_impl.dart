import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/exceptions.dart';
import 'package:ecommerce/core/errors/failuer.dart';
import 'package:ecommerce/features/products/data/data_sources/remote/products_remote_data_source.dart';
import 'package:ecommerce/features/products/data/mappers/product_mappers.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/products/domain/repositories/products_repository.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource _productsRemoteDataSource;
  const ProductsRepositoryImpl(this._productsRemoteDataSource);
  @override
  Future<Either<Failuer, List<Product>>> getProducts({
    String? categoryId,
  }) async {
    try {
      final response = await _productsRemoteDataSource.getProducts(
        categoryId: categoryId,
      );
      final products = response.products.map((productmodel) => productmodel.toEntity).toList();
      return Right(products);
    } on RemoteException catch (exception) {
      return Left(Failuer(exception.message));
    }
  }
}
