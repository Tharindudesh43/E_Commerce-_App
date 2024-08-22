
import 'package:flutter/material.dart';

class CategorySlider extends StatelessWidget {
  const CategorySlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, bottom: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: 400,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("All"),
              Text("Shirts"),
              Text("Skirts"),
              Text("Throusers"),
            ],
          ),
        ),
      ),
    );
  }
}
