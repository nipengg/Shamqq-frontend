import 'package:flutter/material.dart';
import 'package:shamqq_frontend/theme.dart';
import 'package:shamqq_frontend/widgets/checkout_card.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget header(){
      return AppBar(
        backgroundColor: background1,
        elevation: 0,
        centerTitle: true,
        title: Text('Checkout Details', style: primaryTextStyle),
      );
    }

    Widget content(){
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          // LIST ITEMS
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'List Items', style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
                CheckoutCard(),
                CheckoutCard(),
              ],
            ),
          ),
          // Address
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: background4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Address Details', style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),),
                SizedBox(height: 12,),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset('assets/icon_store_location.png', width: 40, height: 40,),
                        Image.asset('assets/icon_line.png', height: 30,),
                        Image.asset('assets/icon_address.png', width: 40,),
                      ],
                    ),
                    SizedBox(width: 12,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Store Location', style: secondaryTextStyle.copyWith(fontSize: 12, fontWeight: light),),
                        Text('Warehouse', style: primaryTextStyle.copyWith(fontWeight: medium,)),
                        SizedBox(height: defaultMargin,),
                        Text('Your Address', style: secondaryTextStyle.copyWith(fontSize: 12, fontWeight: light),),
                        Text('Bogor', style: primaryTextStyle.copyWith(fontWeight: medium,)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Payment Summary
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: background4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Payment Summary', style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),),
                SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Product Quantity', style: secondaryTextStyle.copyWith(fontSize: 12,),),
                    Text('2 Items', style: primaryTextStyle.copyWith(fontWeight: medium),),

                  ],
                ),
                SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Product Price', style: secondaryTextStyle.copyWith(fontSize: 12,),),
                    Text('\$200', style: primaryTextStyle.copyWith(fontWeight: medium),),

                  ],
                ),
                SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Shipping', style: secondaryTextStyle.copyWith(fontSize: 12,),),
                    Text('Free', style: primaryTextStyle.copyWith(fontWeight: medium),),
                  ],
                ),
                SizedBox(height: 12,),
                Divider(thickness: 1, color: Color(0xff2E3141),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total', style: priceTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),),
                    Text('\$200', style: priceTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),),
                  ],
                ),
              ],
            ),
          ),
          //  Checkout Button
          SizedBox(height: defaultMargin,),
          Divider(thickness: 1, color: Color(0xff2E3141),),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(vertical: defaultMargin),
            width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/checkout-success', (route) => false);
              },
              child: Text('Checkout Now', style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: background3,
      appBar: header(),
      body: content(),
    );
  }
}