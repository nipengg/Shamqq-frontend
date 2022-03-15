import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:shamqq_frontend/models/product_model.dart';
import 'package:shamqq_frontend/providers/wishlist_provider.dart';
import 'package:shamqq_frontend/theme.dart';

class ProductPage extends StatefulWidget {

  final ProductModel product;
  ProductPage(this.product);

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
    'assets/shoes1.png',
    'assets/shoes2.png',
    'assets/shoes3.png',
    'assets/shoes4.png',
    'assets/shoes5.png',
    'assets/shoes6.png',
    'assets/shoes7.png',
  ];

  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {

    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    Future<void> showSuccessDialog() async{
      return showDialog(context: context, builder: (BuildContext context) => Container(
        width: MediaQuery.of(context).size.width - (2 * defaultMargin),
        child: AlertDialog(
          backgroundColor: background3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child:
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:
                        Icon(Icons.close, color: primaryText,),
                    ),
                ),
                Image.asset('assets/success_icon.png', width: 100,),
                SizedBox(height: 12,),
                Text('Hurray :)', style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),),
                SizedBox(height: 12,),
                Text('Item added successfully', style: secondaryTextStyle,),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 154,
                  height: 44,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('View my cart', style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),);
    }

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
            items: widget.product.galleries.map((image) => Image.network(image.url,
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
              widget.product.galleries.map((e) {
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
                        Text(widget.product.name, style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: semiBold)),
                        Text(widget.product.category.name, style: secondaryTextStyle.copyWith(fontSize: 12),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {

                      wishlistProvider.setProduct(widget.product);

                      if (wishlistProvider.isWishlist(widget.product)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: secondaryColor,
                            content: Text('Has been added to wishlist', textAlign: TextAlign.center,)
                          ),
                        );
                      }
                      else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: alertColor,
                            content: Text('Has been removed from wishlist', textAlign: TextAlign.center,)
                          ),
                        );
                      }

                    },
                    child: Image.asset(
                      wishlistProvider.isWishlist(widget.product) ? 'assets/button_wishlist_active.png' : 'assets/button_wishlist.png',
                      width: 46,
                    ),
                  ),
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
                  Text("\$${widget.product.price}", style: priceTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),)
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
                    widget.product.description,
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/detail-chat');
                    },
                    child: Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/button_chat.png')),
                      ),
                    ),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      height: 54,
                      child: TextButton(
                        onPressed: () {
                          showSuccessDialog();
                        },
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