import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/core/utils/assets.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.image, this.text});
  final String? image;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Container(
        height: 120,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white.withOpacity(.8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 2,
            ),
            Image.asset(
              image!,
              width: 50,
              height: 50,
            ),
            Container(
              color: Colors.grey,
              width: 100,
              height: 1,
            ),
            Center(
              child: Text(
                text!,
                softWrap: true,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 2,
            )
          ],
        ),
      ),
    );
  }
}
