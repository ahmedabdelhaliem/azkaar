import 'package:flutter/material.dart';

class CustomPhresesSlider extends StatelessWidget {
  const CustomPhresesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return PageView.builder(
      itemCount: 5, // عدد العناصر (استبدل بعدد العناصر الفعلي)
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Container(
            height: screenHeight * .62,
            width: screenWidth * .9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withOpacity(.8),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    'النص العلوي $index',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  color: Colors.grey,
                  width: screenWidth,
                  height: 1,
                ),
                const SizedBox(height: 50),
                const Center(
                  child: Text(
                    'النص السفلي',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.amber[900]!.withOpacity(.3),
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
