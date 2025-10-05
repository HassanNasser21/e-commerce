import 'package:ecommerce/core/models/meta_data.dart';

import 'package:ecommerce/features/products/data/models/product_model.dart';

class ProductsResponse {
  int results;
  MetaData metadata;
  List<ProductModel> products;

  ProductsResponse({
    required this.results,
    required this.metadata,
    required this.products,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      results: json['results'] as int,
      metadata: MetaData.fromJson(json['metadata'] as Map<String, dynamic>),
      products: (json['data'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
