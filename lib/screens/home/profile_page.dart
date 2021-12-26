import 'package:flutter/material.dart';
import 'package:shamqq_frontend/theme.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget header(){
      return AppBar(
        backgroundColor: background1,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(defaultMargin),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset('assets/Image_profile.png', width: 64,),
                ),
                SizedBox(width: 16,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hallo, Neville', style: primaryTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),),
                      Text('@nipengg', style: subtitleTextStyle.copyWith(fontSize: 16),),
                    ],
                  ),
                ),
                Image.asset('assets/icon_logout.png', width: 20,),
              ],
            ),
          ),
        ),
      );
    }

    Widget menuItem(String text){
      return Container(
        margin: EdgeInsets.only(top: 16),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: secondaryTextStyle.copyWith(fontSize: 13),),
            Icon(Icons.chevron_right, color: primaryText,),
          ],
        ),
      );
    }

    Widget content(){
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          decoration: BoxDecoration(
            color: background3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text('Account', style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),),
              menuItem('Edit Profile',),
              menuItem('Your Orders',),
              menuItem('Help',),
              SizedBox(height: 30,),
              Text('General', style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),),
              menuItem('Privacy Policy',),
              menuItem('Term of Service',),
              menuItem('Rate App',),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}