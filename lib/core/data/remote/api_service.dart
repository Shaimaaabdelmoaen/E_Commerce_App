import 'package:dio/dio.dart';
import '../../models/product.dart';
import 'package:get_it/get_it.dart';

import '../../models/sponsors.dart';
import '../../utilities/app_endpoints.dart';

class ApiService {
  final Dio _dio = GetIt.instance<Dio>();

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await _dio.get(AppEndPoints.baseUrl + AppEndPoints.product);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data']['data'];
        return Product.fromJsonList(data);
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
  Future<List<Sponsor>> fetchSponsors() async {
    try {
      final response = await _dio.get(AppEndPoints.baseUrl + AppEndPoints.sponsors);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        return Sponsor.fromJsonList(data);
      } else {
        throw Exception('Failed to load sponsors');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}
