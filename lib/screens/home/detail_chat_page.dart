import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamqq_frontend/models/message_model.dart';
import 'package:shamqq_frontend/models/product_model.dart';
import 'package:shamqq_frontend/providers/auth_provider.dart';
import 'package:shamqq_frontend/services/message_service.dart';
import 'package:shamqq_frontend/theme.dart';
import 'package:shamqq_frontend/widgets/chat_bubble.dart';

class DetailChatPage extends StatefulWidget {

  ProductModel product;
  DetailChatPage(this.product);

  @override
  _DetailChatPageState createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {

  TextEditingController messageController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleAddMessage() async {
      await MessageService().addMessage(
        user: authProvider.user,
        isFromUser: true,
        product: widget.product,
        message: messageController.text,
      );

      setState(() {
        widget.product = UninitializedProductModel();
        messageController.text = '';
      });
    }

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
              child: Image.network(widget.product.galleries[0].url, width: 54,)
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.product.name, style: primaryTextStyle.copyWith(fontSize: 14), overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 2,),
                  Text('\$${widget.product.price}', style: priceTextStyle.copyWith(fontWeight: medium),),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.product = UninitializedProductModel();
                });
              },
              child: Image.asset('assets/button_close.png', width: 22,),
            ),
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
            widget.product is UninitializedProductModel ? SizedBox() : productPreview(),
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
                        controller: messageController,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Type message...',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                GestureDetector(
                  onTap: handleAddMessage,
                  child: Image.asset('assets/send_button.png', width: 45,)
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget content(){
      return StreamBuilder<List<MessageModel>>(
        stream: MessageService().getMessagesByUserId(userId: authProvider.user.id),
        builder: (context, snapshot) {

          if (snapshot.hasData) {
            return ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            children: snapshot.data.map((MessageModel message) => ChatBubble(
              isSender: message.isFromUser,
              text: message.message,
              product: message.product,
            )).toList(),
          );
          }
          else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      );
    }

    return Scaffold(
      backgroundColor: background3,
      appBar: header(),
      body: content(),
      bottomNavigationBar: chatInput(),
    );
  }
}