import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:fortress_of_the_muslim/features/home/presentation/data/model/azker_model.dart';

class AdkarDataProvider {
  Future<List<Adker>> loadAdkar() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/json/adkar.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);

      // تأكد من أن المفتاح صحيح
      final List<dynamic> adkarList = jsonData['adkarElsbah'] ?? [];
      return adkarList.map((json) => Adker.fromJson(json)).toList();
    } catch (e) {
      throw Exception('فشل في تحميل البيانات: $e');
    }
  }
}
