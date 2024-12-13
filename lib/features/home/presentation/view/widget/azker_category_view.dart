import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/features/home/presentation/data/model/azker_model.dart';
import 'package:fortress_of_the_muslim/features/home/presentation/data/model/model.dart';

class AdkarCategoryView extends StatelessWidget {
  final String category;
  const AdkarCategoryView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // الحصول على الأذكار بناءً على الفئة
    final List<Adker> adkarList = getAdkarForCategory(category);

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: adkarList.length,
        itemBuilder: (context, index) {
          final adker = adkarList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      adker.content,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    if (adker.description.isNotEmpty)
                      Text(
                        adker.description,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    const SizedBox(height: 20),
                    Text('عدد التكرار: ${adker.count}'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // دالة لإرجاع الأذكار بناءً على الفئة
  List<Adker> getAdkarForCategory(String category) {
    // استرجاع الأذكار من الخريطة
    if (adkarJson.containsKey(category)) {
      final List<dynamic> adkarList = adkarJson[category]!;
      return adkarList.map<Adker>((json) => Adker.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}
