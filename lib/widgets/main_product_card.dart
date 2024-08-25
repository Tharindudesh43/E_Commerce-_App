import 'package:flutter/material.dart';

class MainProductCard extends StatelessWidget {
  const MainProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  "https://images.pexels.com/photos/1926769/pexels-photo-1926769.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  width: 200,
                  height: 300,
                  fit: BoxFit.cover,
                )),
            const Text("Women Blouse"),
            const Text("\$10.00"),
          ],
        ),
      ),
    );
  }
}
