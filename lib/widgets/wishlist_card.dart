import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamqq_frontend/models/product_model.dart';
import 'package:shamqq_frontend/providers/wishlist_provider.dart';
import 'package:shamqq_frontend/theme.dart';

class WishlistCard extends StatelessWidget {

  final ProductModel product;
  WishlistCard(this.product);

  @override
  Widget build(BuildContext context) {

    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

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
            child: Image.network(product.galleries[0].url, width: 60, height: 60,)
          ),
          SizedBox(width: 12,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: primaryTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),),
                Text('\$${product.price}', style: priceTextStyle.copyWith(fontSize: 14),),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              wishlistProvider.setProduct(product);
            },
            child: Image.asset('assets/button_wishlist_active.png', width: 34, height: 34,)
          ),
        ],
      ),
    );
  }
}