import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failuer.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failuer, User>> register(RegisterRequest request);
  Future<Either<Failuer, User>> login(LoginRequest request);
}
