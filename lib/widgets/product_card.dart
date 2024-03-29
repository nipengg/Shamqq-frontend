import 'package:flutter/material.dart';
import 'package:shamqq_frontend/models/product_model.dart';
import 'package:shamqq_frontend/screens/product_page.dart';
import 'package:shamqq_frontend/theme.dart';

class ProductCard extends StatelessWidget {

  final ProductModel product;
  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductPage(product),
          ),
        );
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
            Image.network(product.galleries[0].url, width: 215, height: 150, fit: BoxFit.cover,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.category.name, style: secondaryTextStyle.copyWith(fontSize: 12),),
                  SizedBox(height: 6,),
                  Text(product.name, style: titleTextStyle.copyWith(fontSize: 18, fontWeight: semiBold), overflow: TextOverflow.ellipsis, maxLines: 1,),
                  SizedBox(height: 6,),
                  Text('\$${product.price}', style: priceTextStyle.copyWith(fontWeight: medium, fontSize: 14),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}