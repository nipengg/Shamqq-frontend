import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamqq_frontend/models/cart_model.dart';
import 'package:shamqq_frontend/providers/cart_provider.dart';
import 'package:shamqq_frontend/theme.dart';

class CartCard extends StatelessWidget {

  final CartModel cart;
  CartCard(this.cart);

  @override
  Widget build(BuildContext context) {

    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: background4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(image: NetworkImage(cart.product.galleries[0].url,)),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cart.product.name, style: primaryTextStyle.copyWith(fontWeight: semiBold),),
                    Text('\$${cart.product.price}', style: priceTextStyle.copyWith(),),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartProvider.addQuantity(cart.id);
                    },
                    child: Image.asset('assets/button_add.png', width: 16, height: 16,)
                  ),
                  SizedBox(height: 2),
                  Text(cart.quantity.toString(), style: primaryTextStyle.copyWith(fontWeight: medium),),
                  SizedBox(height: 2),
                  GestureDetector(
                    onTap: () {
                      cartProvider.reduceQuantity(cart.id);
                    },
                    child: Image.asset('assets/button_min.png', width: 16, height: 16,)
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12,),
          GestureDetector(
            onTap: () {
              cartProvider.removeCart(cart.id);
            },
            child: Row(
              children: [
                Image.asset('assets/remove.png', width: 10,),
                SizedBox(width: 4,),
                Text('Remove', style: alertTextStyle.copyWith(fontSize: 12, fontWeight: light)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}