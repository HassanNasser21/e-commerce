import 'package:ecommerce/core/errors/failuer.dart';
import 'package:ecommerce/features/products/domain/use_cases/get_products.dart';
import 'package:ecommerce/features/products/presentation/cubit/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._getProducts) : super(ProductsInitialState());
  final GetProducts _getProducts;
  Future<void> getProducts({String? categoryId}) async {
    emit(GetProductsLoading());
    final result = await _getProducts(categoryId: categoryId);
    result.fold(
      (faliuer) => emit(GetProductsError(faliuer.message)),
      (products) => emit(GetProductsSuccess(products)),
    );
  }

  int ProductQuantity = 1;
  void changeProductQuantity(int quantity) {
    ProductQuantity = quantity;
    emit(ProductChangeQuantity());
  }
}
