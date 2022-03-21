import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamqq_frontend/providers/page_provider.dart';
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

  @override
  Widget build(BuildContext context) {

    PageProvider pageProvider = Provider.of<PageProvider>(context);

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
            currentIndex: pageProvider.currentIndex,
            onTap: (value) {
              print(value);
              pageProvider.currentIndex = value;
            },
            type: BottomNavigationBarType.fixed,
            items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Image.asset('assets/icon_home.png', width: 21, color: pageProvider.currentIndex == 0 ? primaryColor : Color(0xff808191),)
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Image.asset('assets/icon_chat.png', width: 20, color: pageProvider.currentIndex == 1 ? primaryColor : Color(0xff808191),)
              ),
              label: ''
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Image.asset('assets/icon_wishlist.png', width: 20, color: pageProvider.currentIndex == 2 ? primaryColor : Color(0xff808191),)
              ),
              label: ''
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Image.asset('assets/icon_profile.png', width: 18, color: pageProvider.currentIndex == 3 ? primaryColor : Color(0xff808191),)
              ),
              label: ''
            ),
          ]),
        ),
      );
    }

    Widget body(){
      switch (pageProvider.currentIndex) {
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
      backgroundColor: pageProvider.currentIndex == 0 ? background1 : background3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}