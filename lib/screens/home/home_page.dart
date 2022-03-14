import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamqq_frontend/models/user_model.dart';
import 'package:shamqq_frontend/providers/auth_provider.dart';
import 'package:shamqq_frontend/providers/product_provider.dart';
import 'package:shamqq_frontend/theme.dart';
import 'package:shamqq_frontend/widgets/product_card.dart';
import 'package:shamqq_frontend/widgets/product_tile.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    Widget header(){
      return Container(
        margin: EdgeInsets.only(top: defaultMargin, right: defaultMargin, left: defaultMargin),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello, ${user.name}', style: primaryTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),),
                  Text('@${user.username}', style: subtitleTextStyle.copyWith(fontSize: 16, fontWeight: regular),)
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage(user.profilePhotoUrl))
              ),
            ),
          ],
        ),
      );
    }

    Widget categories(){
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: defaultMargin,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: primaryColor,
                ),
                child: Text('All Category', style: primaryTextStyle.copyWith(fontSize: 13, fontWeight: medium),),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: subtitleColor),
                  color: transparentColor,
                ),
                child: Text('Factory New', style: subtitleTextStyle.copyWith(fontSize: 13, fontWeight: medium),),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: subtitleColor),
                  color: transparentColor,
                ),
                child: Text('Minimal Wear', style: subtitleTextStyle.copyWith(fontSize: 13, fontWeight: medium),),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: subtitleColor),
                  color: transparentColor,
                ),
                child: Text('Field Tested', style: subtitleTextStyle.copyWith(fontSize: 13, fontWeight: medium),),
              ),
            ],
          ),
        ),
      );
    }

    Widget popularTitle(){
      return Container(
        margin: EdgeInsets.only(top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Text('Popular Products', style: primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 22),),
      );
    }

    Widget popularItem(){
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: defaultMargin,),
              Row(
                children: productProvider.products
                    .map(
                      (product) => ProductCard(product),
                    ).toList(),
              ),
            ],
          ),
        ),
      );
    }

    Widget arrivalTitle(){
      return Container(
        margin: EdgeInsets.only(top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Text('New Arrivals', style: primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 22),),
      );
    }

    Widget newArrivals(){
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: Column(
          children: productProvider.products
              .map(
                (product) => ProductTile(product),
              ).toList(),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        categories(),
        popularTitle(),
        popularItem(),
        arrivalTitle(),
        newArrivals(),
      ],
    );
  }
}