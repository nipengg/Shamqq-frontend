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

  List familiarShoes = [
    'assets/Sepatu_running.png',
    'assets/Sepatu_running.png',
    'assets/Sepatu_running.png',
    'assets/Sepatu_running.png',
    'assets/Sepatu_running.png',
    'assets/Sepatu_running.png',
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

    Widget familiarCard(String imageUrl){
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(imageUrl)),
          borderRadius: BorderRadius.circular(6)
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

    Widget content(){
      int index = -1;
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          color: background1,
        ),
        child: Column(
          children: [
            // Header
            Container(
              margin: EdgeInsets.only(top: defaultMargin, left: defaultMargin, right: defaultMargin),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Running Shoes 2.0", style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: semiBold)),
                        Text("Hiking", style: secondaryTextStyle.copyWith(fontSize: 12),)
                      ],
                    ),
                  ),
                  Image.asset('assets/button_wishlist.png', width: 46,),
                ],
              ),
            ),

            // Price Box
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: background2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Price starts from", style: primaryTextStyle.copyWith(fontSize: 14),),
                  Text("\$149.99", style: priceTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),)
                ],
              ),
            ),

            // Description
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Description", style: primaryTextStyle.copyWith(fontWeight: medium),),
                  SizedBox(height: 12,),
                  Text(
                    "Ipsum in Lorem quis amet eiusmod culpa excepteur irure.  Ad ut aliquip tempor amet officia tempor nisi officia exercitation. Ea aute commodo reprehenderit laborum et minim anim dolor quis ad mollit. Quis elit est adipisicing cillum. Quis elit est adipisicing cillum. Lorem",
                    style: subtitleTextStyle.copyWith(fontWeight: light),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),

            // Familiar Shoes
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text("Familiar Shoes", style: primaryTextStyle.copyWith(fontWeight: medium),),
                  ),
                  SizedBox(height: 12,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                        familiarShoes.map((image){
                          ++index;
                          return Container(
                            margin: EdgeInsets.only(left: index == 0 ? 16 : 0),
                            child: familiarCard(image),
                          );
                        }).toList(),
                    ),
                  ),
                ],
              ),
            ),

            // Button
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(30),
              child: Row(
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/button_chat.png')),
                    ),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      height: 54,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: primaryColor,
                        ),
                        child: Text('Add to Cart', style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: cardColor,
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}