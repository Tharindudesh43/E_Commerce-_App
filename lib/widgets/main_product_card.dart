import 'package:e_commerce_app/Screeens/first_screen.dart';
import 'package:flutter/material.dart';

class MainProductCard extends StatelessWidget {
  const MainProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.image});

  final String title;
  final String price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FirstScreen(price: price,)));
      },
      child: Padding(
        padding: EdgeInsets.only(right: 15),
        child: Container(
          padding: EdgeInsets.only(right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    image,
                    width: 200,
                    height: 260,
                    //fit: BoxFit.cover,
                  )),
              SizedBox(width: 150, child: Text(title)),
              Text(
                "\$$price",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
