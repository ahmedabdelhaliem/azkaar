import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/features/home/presentation/data/model/azker_model.dart';

class PhresesViewBody extends StatelessWidget {
  final List<Adker> adkarList;

  const PhresesViewBody({super.key, required this.adkarList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      itemCount: adkarList.length,
      itemBuilder: (context, index) {
        final adker = adkarList[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 20), // تباعد بين العناصر
          decoration: BoxDecoration(
            color: Colors.white, // خلفية بيضاء للبطاقات
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15,
                offset: const Offset(0, 5), // ظل لطيف أسفل البطاقة
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // نص الأذكار
                Text(
                  adker.content,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[800], // لون مميز للنص
                  ),
                ),
                const SizedBox(height: 10),
                // وصف الأذكار إذا كان موجودًا
                if (adker.description.isNotEmpty)
                  Text(
                    adker.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey, // اللون الرمادي للوصف
                    ),
                  ),
                const SizedBox(height: 12),
                // إضافة صف يحتوي على تكرار العدد ورمز
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "عدد التكرار: ${adker.count}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.teal[500], // اللون الأخضر المخضر
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.teal[100],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.repeat,
                        color: Colors.teal[800],
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
