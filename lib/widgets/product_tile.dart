import 'package:flutter/material.dart';
import 'package:shamqq_frontend/theme.dart';

class ProductTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultMargin, right: defaultMargin, bottom: defaultMargin),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/Sepatu_running.png',
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Running', style: secondaryTextStyle.copyWith(fontSize: 12),),
                SizedBox(height: 6,),
                Text('Sepatu Running 2.0', style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: semiBold,),),
                SizedBox(height: 6,),
                Text('\$100', style: priceTextStyle.copyWith(fontWeight: medium, fontSize: 14),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}