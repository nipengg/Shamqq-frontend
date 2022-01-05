import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shamqq_frontend/theme.dart';

class ProductPage extends StatefulWidget {

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    'assets/Sepatu_running.png',
    'assets/Sepatu_running.png',
    'assets/Sepatu_running.png',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    Widget indicator(int index){
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 2),
        width: currentIndex == index ? 16 : 4,
        height: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : Color(0xffC4C4C4),
        ),
      );
    }

    Widget header(){

      int index = -1;

      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, left: defaultMargin, right: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child:
                    Icon(Icons.chevron_left),
                ),
                Icon(Icons.shopping_bag, color: background1),
              ],
            ),
          ),
          CarouselSlider(
            items: images.map((image) => Image.asset(image,
              width: MediaQuery.of(context).size.width,
              height: 310,
              fit: BoxFit.cover,
            )).toList(),
            options: CarouselOptions(
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              }
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
              images.map((e) {
                index++;
                return indicator(index);
              }).toList(),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: cardColor,
      body: ListView(
        children: [
          header(),
        ],
      ),
    );
  }
}