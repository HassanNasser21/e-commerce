import 'package:ecommerce/core/models/category_model.dart';
import 'package:ecommerce/core/models/meta_data.dart';

class CategoriesResponse {
  final int results;
  final MetaData metadata;
  final List<CategoryModel> categories;
  const CategoriesResponse({
    required this.results,
    required this.metadata,
    required this.categories,
  });
  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return CategoriesResponse(
      results: json['results'] as int,
      metadata: MetaData.fromJson(json['metadata'] as Map<String, dynamic>),
      categories: (json['data'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
