import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamqq_frontend/providers/product_provider.dart';
import 'package:shamqq_frontend/theme.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
    void initState() {

      getInit();

      super.initState();
    }

    getInit() async {
      await Provider.of<ProductProvider>(context, listen: false).getProducts();

      Navigator.pushNamed(context, '/sign-in');
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background1,
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/splash_screen.png'))
          ),
        ),
      ),
    );
  }
}