import 'package:flutter/material.dart';
import 'package:shamqq_frontend/screens/home/chat_page.dart';
import 'package:shamqq_frontend/screens/home/home_page.dart';
import 'package:shamqq_frontend/screens/home/profile_page.dart';
import 'package:shamqq_frontend/screens/home/wishlist_page.dart';
import 'package:shamqq_frontend/theme.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    Widget cartButton(){
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        backgroundColor: secondaryColor,
        child: Image.asset('assets/icon_cart.png', width: 20,),
      );
    }

    Widget customBottomNav(){
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: background4,
            currentIndex: currentIndex,
            onTap: (value) {
              print(value);
              setState(() {
                currentIndex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Image.asset('assets/icon_home.png', width: 21, color: currentIndex == 0 ? primaryColor : Color(0xff808191),)
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Image.asset('assets/icon_chat.png', width: 20, color: currentIndex == 1 ? primaryColor : Color(0xff808191),)
              ),
              label: ''
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Image.asset('assets/icon_wishlist.png', width: 20, color: currentIndex == 2 ? primaryColor : Color(0xff808191),)
              ),
              label: ''
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Image.asset('assets/icon_profile.png', width: 18, color: currentIndex == 3 ? primaryColor : Color(0xff808191),)
              ),
              label: ''
            ),
          ]),
        ),
      );
    }

    Widget body(){
      switch (currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return ChatPage();
          break;
        case 2:
          return WishlistPage();
          break;
        case 3:
          return ProfilePage();
          break;
        default:
          return HomePage();
          break;
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: currentIndex == 0 ? background1 : background3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}