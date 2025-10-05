import 'package:ecommerce/features/products/domain/entities/product.dart';

abstract class ProductsState {}

class ProductsInitialState extends ProductsState {}

class GetProductsLoading extends ProductsState {}

class GetProductsSuccess extends ProductsState {
  final List<Product> products;
  GetProductsSuccess(this.products);
}

class GetProductsError extends ProductsState {
  final String message;
  GetProductsError(this.message);
}

class ProductChangeQuantity extends ProductsState {}