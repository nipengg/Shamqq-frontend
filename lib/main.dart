import 'package:flutter/material.dart';
import 'package:shamqq_frontend/screens/cart_page.dart';
import 'package:shamqq_frontend/screens/checkout_page.dart';
import 'package:shamqq_frontend/screens/checkout_success.dart';
import 'package:shamqq_frontend/screens/edit_profile_page.dart';
import 'package:shamqq_frontend/screens/home/detail_chat_page.dart';
import 'package:shamqq_frontend/screens/home/main_page.dart';
import 'package:shamqq_frontend/screens/product_page.dart';
import 'package:shamqq_frontend/screens/sign_in.dart';
import 'package:shamqq_frontend/screens/sign_up.dart';
import 'package:shamqq_frontend/screens/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => MainPage(),
        '/detail-chat': (conetxt) => DetailChatPage(),
        '/edit-profile': (context) => EditProfile(),
        '/product': (context) => ProductPage(),
        '/cart': (context) => CartPage(),
        '/checkout': (contect) => CheckoutPage(),
        '/checkout-success': (context) => CheckoutSuccess(),
      },
    );
  }
}