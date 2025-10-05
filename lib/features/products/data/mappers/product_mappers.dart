import 'package:ecommerce/features/products/data/models/product_model.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';

extension ProductMapper on ProductModel {
  Product get toEntity => Product(
    id: id,
    title: title,
    description: description,
    price: price,

    images: images,
    sold: sold,
    ratingsQuantity: ratingsQuantity,
    quantity: quantity,
    priceAfterDiscount: priceAfterDiscount,
    imageCover: imageCover,
    ratingsAverage: ratingsAverage,
    
  
  );
}
