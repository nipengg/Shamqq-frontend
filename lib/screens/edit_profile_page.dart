import 'package:flutter/material.dart';
import 'package:shamqq_frontend/theme.dart';
import 'package:shamqq_frontend/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:shamqq_frontend/models/user_model.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget header(){
      return AppBar(
        leading: IconButton(icon: Icon(Icons.close), onPressed: () {
          Navigator.pop(context);
        }),
        backgroundColor: background1,
        elevation: 0,
        centerTitle: true,
        title: Text('Edit Profile', style: primaryTextStyle,),
        actions: [
          IconButton(icon: Icon(Icons.check, color: primaryColor,), onPressed: (){})
        ],
      );
    }

    Widget nameInput(){
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name', style: secondaryTextStyle.copyWith(fontSize: 13),),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: user.name,
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: subtitleColor),
                ),
              ),
            ),
          ],
        ),
      );
    }

      Widget usernameInput(){
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username', style: secondaryTextStyle.copyWith(fontSize: 13),),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: '@${user.username}',
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: subtitleColor),
                ),
              ),
            ),
          ],
        ),
      );
    }

      Widget emailInput(){
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email Address', style: secondaryTextStyle.copyWith(fontSize: 13),),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: user.email,
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: subtitleColor),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content(){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(top: defaultMargin),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(user.profilePhotoUrl)
                ),
              ),
            ),
            nameInput(),
            usernameInput(),
            emailInput(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: background3,
      appBar: header(),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}