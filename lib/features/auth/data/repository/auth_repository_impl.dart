import 'package:ecommerce/core/errors/exceptions.dart';
import 'package:ecommerce/core/errors/failuer.dart';
import 'package:ecommerce/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:ecommerce/features/auth/data/data_sources/local/auth_shard_pref_local_data_source.dart';
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/mappers/user_mapper.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource remoteDataSource;
  AuthLocalDataSource localDataSource;

  AuthRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failuer, User>> register(RegisterRequest request) async {
    try {
      final response = await remoteDataSource.register(request);
      await localDataSource.saveToken(response.token);
      return Right(response.user.toEntitiy);
    } on AppException catch (exception) {
      return left(Failuer(exception.message));
    }
  }

  @override
  Future<Either<Failuer, User>> login(LoginRequest request) async {
    try {
      final response = await remoteDataSource.login(request);
      await localDataSource.saveToken(response.token);
      return Right(response.user.toEntitiy);
    } on AppException catch (exception) {
      return left(Failuer(exception.message));
    }
  }
}
