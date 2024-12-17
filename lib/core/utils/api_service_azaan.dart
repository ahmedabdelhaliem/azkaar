import 'package:dio/dio.dart';

class ApiServiceAzaan {
  final String baseUrl = "https://muslimsalat.com/";
  final String apiKey = "0e1f44c8b324559b820dd39477efc262";
  final Dio _dio;

  ApiServiceAzaan(this._dio);
  Future<Map<String, dynamic>> get(
      // String type = "daily",
      ) async {
    final response = await _dio.get('$baseUrl/cairo.json?key=$apiKey');
    return response.data;
  }
}
