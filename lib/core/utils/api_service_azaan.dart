import 'package:dio/dio.dart';

class ApiServiceAzaan {
  final String baseUrl = "https://muslimsalat.com/";
  final String apiKey = "0086c917f7d3521c921920262ba16f44";
  final Dio _dio;

  ApiServiceAzaan(this._dio);
  Future<Map<String, dynamic>> get({
    required String city,
    String type = "daily",
  }) async {
    final response = await _dio.get('$baseUrl$city.json?key=$apiKey');
    return response.data;
  }
}
