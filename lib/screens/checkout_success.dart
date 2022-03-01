import 'package:flutter/material.dart';
import 'package:shamqq_frontend/theme.dart';

class CheckoutSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget header(){
      return AppBar(
        backgroundColor: background1,
        centerTitle: true,
        title: Text('Checkout Success', style: primaryTextStyle,),
        elevation: 0,
      );
    }

    Widget content(){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icon_empty_cart.png', width: 80,),
            SizedBox(height: 20,),
            Text('You made a transaction', style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),),
            SizedBox(height: 12,),
            Text('Stay at home while we \nprepare your dream items', style: secondaryTextStyle, textAlign: TextAlign.center,),
            Container(
              margin: EdgeInsets.only(top: 30),
              width: 196,
              height: 44,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                },
                child: Text('Explore Store', style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              width: 196,
              height: 44,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff39374B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {

                },
                child: Text('View my order', style: primaryTextStyle.copyWith(color: Color(0xffB7B6BF),fontSize: 16, fontWeight: medium),),
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
    );
  }
}