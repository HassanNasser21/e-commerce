import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/exceptions.dart';
import 'package:ecommerce/core/errors/failuer.dart';
import 'package:ecommerce/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:ecommerce/features/home/data/mappers/category_mappers.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';
import 'package:ecommerce/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;
  const HomeRepositoryImpl(this._homeRemoteDataSource);
  @override
  Future<Either<Failuer, List<Category>>> getCategories() async {
    try {
      final response = await _homeRemoteDataSource.getcategories();
      final categories = response.categories
          .map((categoryModel) => categoryModel.toEntity)
          .toList();
      return Right(categories);
    } on RemoteException catch (exception) {
      return left(Failuer(exception.message));
    }
  }
}
