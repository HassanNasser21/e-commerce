import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failuer.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';

abstract class HomeRepository {
  Future<Either<Failuer, List<Category>>> getCategories();
}
