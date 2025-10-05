import 'package:ecommerce/core/errors/failuer.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/data/repository/auth_repository_impl.dart';
import 'package:ecommerce/features/auth/domain/use_cases/login.dart';
import 'package:ecommerce/features/auth/domain/use_cases/register.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._login, this._register) : super(AuthInitial());
  final Login _login;
  final Register _register;
  Future<void> registr(RegisterRequest request) async {
    emit(RegisterLoading());

    final result = await _register(request);
    result.fold(
      (Failuer) => emit(RegisterError(Failuer.message)),
      (_) => emit(RegisterSuccess()),
    );
  }

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());

    final result = await _login(request);
    result.fold(
      (Failuer) => emit(LoginError(Failuer.message)),
      (_) => emit(LoginSuccess()),
    );
  }
}
