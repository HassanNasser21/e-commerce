import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failuer.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';
import 'package:ecommerce/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class GetCategories {
  final HomeRepository _homeRepository;

  const GetCategories(this._homeRepository);
  Future<Either<Failuer, List<Category>>> call() =>
      _homeRepository.getCategories();
}
