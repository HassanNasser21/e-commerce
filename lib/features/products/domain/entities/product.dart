import 'package:ecommerce/core/models/brand_model.dart';
import 'package:ecommerce/core/models/category_model.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int sold;
  final List<String> images;
  final int ratingsQuantity;
  final String id;
  final String title;
  final String description;
  final int quantity;
  final int price;
  final int? priceAfterDiscount;
  final String imageCover;

  final double ratingsAverage;

  Product({
    required this.sold,
    required this.images,

    required this.ratingsQuantity,
    required this.id,
    required this.title,
    required this.description,
    required this.quantity,
    required this.price,
    required this.priceAfterDiscount,
    required this.imageCover,

    required this.ratingsAverage,
  
  });
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
