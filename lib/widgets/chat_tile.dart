import 'package:flutter/material.dart';
import 'package:shamqq_frontend/models/product_model.dart';
import 'package:shamqq_frontend/screens/home/detail_chat_page.dart';
import 'package:shamqq_frontend/theme.dart';

class ChatTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailChatPage(UninitializedProductModel(),),),);
      },
      child: Container(
        margin: EdgeInsets.only(top: 33),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/image_shop_logo.png', width: 54,),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Shoe Store', style: primaryTextStyle.copyWith(fontSize: 15),),
                      Text(
                        'Good Nite, Item is ready..',
                        style: secondaryTextStyle.copyWith(fontSize: 14, fontWeight: light),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Text('Now', style: secondaryTextStyle.copyWith(fontSize: 10),),
              ],
            ),
            SizedBox(height: 12,),
            Divider(
              thickness: 1,
              color: Color(0xff2B2939),
            ),
          ],
        ),
      ),
    );
  }
}