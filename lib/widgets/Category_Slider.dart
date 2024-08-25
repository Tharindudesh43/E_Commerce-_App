import 'package:e_commerce_app/services/api_service.dart';
import 'package:flutter/material.dart';

class CategorySlider extends StatefulWidget {
  const CategorySlider({
    super.key,
  });

  @override
  State<CategorySlider> createState() => _CategorySliderState();
}

class _CategorySliderState extends State<CategorySlider> {
  List<Text> categoryList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ApiService.getCategories().then((categories) {
      setState(() {
        categoryList.add(const Text("All"));
        for (var categoty in categories) {
          categoryList.add(Text(categoty.toString().toUpperCase()));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10, bottom: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: 600,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: categoryList,
          ),
        ),
      ),
    );
  }
}
