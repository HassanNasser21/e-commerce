import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/errors/exceptions.dart';
import 'package:ecommerce/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:ecommerce/features/home/data/models/categories_response.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as:  HomeRemoteDataSource)
class HomeApiRemoteDataSource implements HomeRemoteDataSource {
  final Dio _dio;

  const HomeApiRemoteDataSource(this._dio);

  @override
  Future<CategoriesResponse> getcategories() async {
    try {
      final response = await _dio.get(APIConstants.categoriesEndpoint);
      return CategoriesResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message??'faild to get categories');
    }
  }
}
