import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/core/models/product.dart';
import 'package:flutter_app/core/models/sponsors.dart';
import 'package:flutter_app/core/utilities/app_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';

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
  Future<void> registerUser(String name, String email, String phone, String password, String type) async {
    try {
      final response = await _dio.post(
        'RegisterApi',
        data: {
          "name": name,
          "email": email,
          "phone": phone,
          "password": password,
          "type": type,
        },
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
        if (kDebugMode) {
          print(response.data['message']);
        }
      } else {
        throw Exception('Failed to register');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    try {
      final response = await _dio.post(
        'LoginApi',
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
        return response.data['data'];
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
  Future<void> logoutUser() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token == null) {
      return;
    }
    try {
      final response = await _dio.post(
        'UserLogoutApi',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
        if (kDebugMode) {
          print(response.data['message']);
        }
      } else {
        throw Exception('Failed to logout');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

}
