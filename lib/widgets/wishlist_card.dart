import 'package:flutter/material.dart';
import 'package:shamqq_frontend/theme.dart';

class WishlistCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: background4,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset('assets/Sepatu_running.png', width: 60, height: 60,)
          ),
          SizedBox(width: 12,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sepatu Running 2.0', style: primaryTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),),
                Text('\$100', style: priceTextStyle.copyWith(fontSize: 14),),
              ],
            ),
          ),
          Image.asset('assets/button_wishlist_active.png', width: 34, height: 34,),
        ],
      ),
    );
  }
}