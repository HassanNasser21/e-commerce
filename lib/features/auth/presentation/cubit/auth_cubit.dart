import 'package:ecommerce/core/errors/failuer.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/data/repository/auth_repository.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthInitial());
  final AuthRepository authRepository ;
  Future<void> registr(RegisterRequest request) async {
    emit(RegisterLoading());

    final result = await authRepository.register(request);
    result.fold(
      (Failuer) => emit(RegisterError(Failuer.message)),
      (_) => emit(RegisterSuccess()),
    );
  }

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());

    final result = await authRepository.login(request);
    result.fold(
      (Failuer) => emit(LoginError(Failuer.message)),
      (_) => emit(LoginSuccess()),
    );
  }
}
