

import 'package:ecommerce/core/models/brand_model.dart';
import 'package:ecommerce/core/models/category_model.dart';

class ProductModel {
  final int sold;
  final List<String> images;
  final int ratingsQuantity;
  final String id;
  final String title;
  final String slug;
  final String description;
  final int quantity;
  final int price;
  final int? priceAfterDiscount;
  final String imageCover;
  final CategoryModel category;
  final BrandModel brand;
  final double ratingsAverage;
  final String createdAt;
  final String updatedAt;

  ProductModel({
    required this.sold,
    required this.images,
   
    required this.ratingsQuantity,
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    required this.priceAfterDiscount,
    required this.imageCover,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      sold: json['sold'] as int,
      images: (json['images'] as List).cast<String>(),
 
      ratingsQuantity: json['ratingsQuantity'] as int,
      id:  json['_id'] as String,
      title: json['title'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String,
      quantity: json['quantity'] as int,
      price: json['price'] as int,
      priceAfterDiscount: json['priceAfterDiscount'] as int?,
      imageCover: json['imageCover'] as String,
      category: CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      brand: BrandModel.fromJson(json['brand'] as Map<String, dynamic>),
      ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }
}