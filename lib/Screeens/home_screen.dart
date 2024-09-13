import 'package:e_commerce_app/services/api_service.dart';
import 'package:e_commerce_app/widgets/Category_Slider.dart';
import 'package:e_commerce_app/widgets/main_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List ProductListByCateroy = [];

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
          //CategorySlider(),
          // Padding(
          //   padding: EdgeInsets.only(top: 10, left: 10, bottom: 20),
          //   child: SingleChildScrollView(
          //     scrollDirection: Axis.horizontal,
          //     child: SizedBox(
          //       width: 600,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: categoryList,
          //       ),
          //     ),
          //   ),
          // ),

          FutureBuilder(
              future: ApiService.getCategories(),
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    //width: 250.0,
                    height: 30.0,
                    child: Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            height: 30,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:
                                    List.generate(10, (index) => shimmerbox())),
                          ),
                        )),
                  );
                } else {
                  List categoryList = ["All"];
                  categoryList.addAll(snap.data!);
                  return Padding(
                    padding: EdgeInsets.only(top: 10, left: 10, bottom: 20),
                    child: SizedBox(
                      height: 50,
                      child: ListView.builder(
                          itemCount: categoryList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    ApiService.getProductsByCategory(
                                            category:
                                                categoryList[index].toString())
                                        .then((value) {
                                      setState(() {
                                        ProductListByCateroy = value;
                                      });
                                    });
                                  },
                                  child: Text(categoryList[index]
                                      .toString()
                                      .toUpperCase()),
                                ),
                              )),
                    ),
                  );
                }
              }),

          ProductListByCateroy.isNotEmpty
              ? SizedBox(
                  height: 380,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ProductListByCateroy.length,
                    itemBuilder: (context, index) => MainProductCard(
                        title: ProductListByCateroy[index]["title"],
                        price: ProductListByCateroy[index]["price"].toString(),
                        image: ProductListByCateroy[index]["image"]),
                  ),
                )
              : FutureBuilder(
                  future: ApiService.getProsucts(),
                  builder: (context, snap) {
                    if (snap.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      List allproducts = snap.data!;
                      return SizedBox(
                        height: 380,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: allproducts.length,
                          itemBuilder: (context, index) => MainProductCard(
                              title: allproducts[index]["title"],
                              price: allproducts[index]["price"].toString(),
                              image: allproducts[index]["image"]),
                        ),
                      );
                    }
                  },
                ),
        ],
      ),
    );
  }

  Padding shimmerbox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(2)),
        width: 40,
        height: 20,
      ),
    );
  }
}
