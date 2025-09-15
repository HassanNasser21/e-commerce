import 'package:ecommerce/core/errors/exceptions.dart';
import 'package:ecommerce/core/errors/failuer.dart';
import 'package:ecommerce/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:ecommerce/features/auth/data/data_sources/local/auth_shard_pref_local_data_source.dart';
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@singleton
class AuthRepository {
  AuthRemoteDataSource remoteDataSource ;
  AuthLocalDataSource localDataSource ;

  AuthRepository(this.remoteDataSource, this.localDataSource);

  Future<Either<Failuer, UserModel>> register(RegisterRequest request) async {
    try {
      final response = await remoteDataSource.register(request);
      await localDataSource.saveToken(response.token);
      return Right(response.user);
    } on AppException catch (exception) {
      return left(Failuer(exception.message));
    }
  }

  Future<Either<Failuer, UserModel>> login(LoginRequest request) async {
    try {
      final response = await remoteDataSource.login(request);
      await localDataSource.saveToken(response.token);
      return Right(response.user);
    } on AppException catch (exception) {
      return left(Failuer(exception.message));
    }
  }
}
