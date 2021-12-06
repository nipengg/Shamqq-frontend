import 'package:flutter/material.dart';
import 'package:shamqq_frontend/theme.dart';

class DetailChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget header(){
      return PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: background1,
          centerTitle: false,
          elevation: 0,
          title: Row(
            children: [
              Image.asset('assets/icon_shop_logo_online.png', width: 50,),
              SizedBox(width: 12,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Shoe Store', style: primaryTextStyle.copyWith(fontWeight: medium, fontSize: 14),),
                  Text('Online', style: secondaryTextStyle.copyWith(fontWeight: light, fontSize: 14),),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget productPreview(){
      return Container(
        width: 225,
        height: 74,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: background5,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: primaryColor),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/Sepatu_running.png', width: 54,)
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sepatu Running 2.0', style: primaryTextStyle.copyWith(fontSize: 14), overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 2,),
                  Text('\$100', style: priceTextStyle.copyWith(fontWeight: medium),),
                ],
              ),
            ),
            Image.asset('assets/button_close.png', width: 22,),
          ],
        ),
      );
    }

    Widget chatInput(){
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            productPreview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: background4,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Type message...',
                          hintStyle: subtitleTextStyle
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Image.asset('assets/send_button.png', width: 45,),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: background3,
      appBar: header(),
      bottomNavigationBar: chatInput(),
    );
  }
}