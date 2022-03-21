import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamqq_frontend/models/message_model.dart';
import 'package:shamqq_frontend/providers/auth_provider.dart';
import 'package:shamqq_frontend/services/message_service.dart';
import 'package:shamqq_frontend/theme.dart';
import 'package:shamqq_frontend/widgets/chat_tile.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    Widget header(){
      return AppBar(
        backgroundColor: background1,
        centerTitle: true,
        title: Text('Message Support', style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyChat(){
      return Expanded(
        child: Container(
          width: double.infinity,
          color: background3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icon_headset.png', width: 80,),
              SizedBox(height: 20,),
              Text('Oops no message yet?', style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),),
              SizedBox(height: 12,),
              Text('You have never done a transaction', style: subtitleTextStyle.copyWith(fontSize: 14),),
              SizedBox(height: 20,),
              Container(
                height: 44,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text('Explore Store', style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget content(){
      return StreamBuilder<List<MessageModel>>(
        stream: MessageService().getMessagesByUserId(userId: authProvider.user.id),
        builder: (context, snapshot) {

          if (snapshot.hasData) {

            if (snapshot.data.length == 0) {
              return emptyChat();
            }

            return Expanded(
            child: Container(
              width: double.infinity,
              color: background3,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                children: [
                  ChatTile(snapshot.data[snapshot.data.length - 1]),
                ],
              ),
            ),
          );
          }
          else{
            return emptyChat();
          }
        }
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