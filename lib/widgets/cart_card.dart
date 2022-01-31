import 'package:flutter/material.dart';
import 'package:shamqq_frontend/theme.dart';

class CartCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: background4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(image: AssetImage('assets/Sepatu_running.png',)),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sepatu Runing 2.0', style: primaryTextStyle.copyWith(fontWeight: semiBold),),
                    Text('\$143.99', style: priceTextStyle.copyWith(),),
                  ],
                ),
              ),
              Column(
                children: [
                  Image.asset('assets/button_add.png', width: 16, height: 16,),
                  SizedBox(height: 2),
                  Text('2', style: primaryTextStyle.copyWith(fontWeight: medium),),
                  SizedBox(height: 2),
                  Image.asset('assets/button_min.png', width: 16, height: 16,),
                ],
              ),
            ],
          ),
          SizedBox(height: 12,),
          Row(
            children: [
              Image.asset('assets/remove.png', width: 10,),
              SizedBox(width: 4,),
              Text('Remove', style: alertTextStyle.copyWith(fontSize: 12, fontWeight: light)),
            ],
          ),
        ],
      ),
    );
  }
}