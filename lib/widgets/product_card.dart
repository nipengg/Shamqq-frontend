import 'package:flutter/material.dart';
import 'package:shamqq_frontend/theme.dart';

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
        width: 215,
        height: 278,
        margin: EdgeInsets.only(right: defaultMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Image.asset('assets/Sepatu_running.png', width: 215, height: 150, fit: BoxFit.cover,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Running', style: secondaryTextStyle.copyWith(fontSize: 12),),
                  SizedBox(height: 6,),
                  Text('Running Shoes 2.0', style: titleTextStyle.copyWith(fontSize: 18, fontWeight: semiBold), overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 6,),
                  Text('\$100', style: priceTextStyle.copyWith(fontWeight: medium, fontSize: 14),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}