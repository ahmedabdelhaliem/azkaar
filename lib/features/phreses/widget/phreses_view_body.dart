import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/features/home/presentation/data/model/azker_model.dart';

class PhresesViewBody extends StatelessWidget {
  final List<Adker> adkarList;

  const PhresesViewBody({super.key, required this.adkarList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: adkarList.length,
      itemBuilder: (context, index) {
        final adker = adkarList[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
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
                const SizedBox(height: 8),
                if (adker.description.isNotEmpty)
                  Text(
                    adker.description,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                const SizedBox(height: 8),
                Text("عدد التكرار: ${adker.count}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
