import 'package:e_commerce_app/services/api_service.dart';
import 'package:e_commerce_app/widgets/Category_Slider.dart';
import 'package:e_commerce_app/widgets/main_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ecommy",
                  style: TextStyle(fontSize: 18),
                ),
                Icon(Icons.person)
              ],
            ),
          ),
          CategorySlider(),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MainProductCard(),
                  MainProductCard(),
                  MainProductCard(),
                ],
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                ApiService.getCategories();
              },
              child: Text("Get Categories")),
          TextButton(
              onPressed: () {
                ApiService.getProsuctsById(productId: "1");
              },
              child: Text("Get Products By ID"))
        ],
      ),
    );
  }
}
