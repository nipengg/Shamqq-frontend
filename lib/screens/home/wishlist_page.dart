import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamqq_frontend/providers/page_provider.dart';
import 'package:shamqq_frontend/providers/wishlist_provider.dart';
import 'package:shamqq_frontend/theme.dart';
import 'package:shamqq_frontend/widgets/wishlist_card.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget header(){
      return AppBar(
        backgroundColor: background1,
        centerTitle: true,
        title: Text('Wishlist', style: primaryTextStyle,),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget content(){
      return Expanded(
        child: Container(
          color: background3,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            children: wishlistProvider.wishlist.map((product) => WishlistCard(product)).toList(),
          ),
        ),
      );
    }

    Widget emptyWishlist(){
      return Expanded(
        child: Container(
          color: background3,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/wishlist_love_icon.png', width: 74, height: 62,),
              SizedBox(height: 23,),
              Text('You don\'t have any wishlist yet?', style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),),
              SizedBox(height: 12,),
              Text("Let\'s find your first wishlist item", style: secondaryTextStyle),
              SizedBox(height: 20,),
              Container(
                height: 44,
                child: TextButton(
                  onPressed: () {
                    pageProvider.currentIndex = 0;
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24)
                  ),
                  child: Text("Explore Store", style: primaryTextStyle.copyWith(fontWeight: medium, fontSize: 16),),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        wishlistProvider.wishlist.length == 0 ? emptyWishlist() : content(),
      ],
    );
  }
}