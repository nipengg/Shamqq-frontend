import 'package:flutter/material.dart';
import 'package:shamqq_frontend/theme.dart';
import 'package:shamqq_frontend/widgets/cart_card.dart';

class CartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Widget header(){
      return AppBar(
        backgroundColor: background1,
        centerTitle: true,
        title: Text('Your cart'),
        elevation: 0,
      );
    }

    Widget emptyCart(){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icon_empty_cart.png', width: 80,),
            SizedBox(height: 20,),
            Text('Oops! Your cart is empty!', style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),),
            SizedBox(height: 12,),
            Text('Let\'s find your favorite item', style: secondaryTextStyle),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 154,
              height: 44,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: primaryColor,
                ),
                child: Text('Explore Store', style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),)
              ),
            ),
          ],
        ),
      );
    }

    Widget content(){
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        children: [
          CartCard(),
        ],
      );
    }

    Widget customButtonNav(){
      return Container(
        height: 180,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Subtotal', style: primaryTextStyle,),
                  Text('\$100', style: priceTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Divider(thickness: 0.3, color: subtitleColor,),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Continue to Checkout', style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: semiBold)),
                    Icon(Icons.arrow_forward, color: primaryText,),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }


    return Scaffold(
      backgroundColor: background3,
      appBar: header(),
      body: content(),
      bottomNavigationBar: customButtonNav(),
    );
  }
}