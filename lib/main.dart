import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:testpro/profile.dart';
import 'package:testpro/signup_page.dart';
import 'package:testpro/splash.dart';
import 'package:testpro/start_one.dart';
import 'package:testpro/start_two.dart';
import 'package:testpro/start_three.dart';
import 'card_info.dart';
import 'choice_card.dart';
import 'getting_started.dart';
import 'item_details.dart';
import 'login_page.dart';
import 'more.dart';
import 'order_done.dart';


void main() {
  runApp(MaterialApp(
    // routes: {
    //   '/': (context) => ChoiceCard(),
    //   '/card_info': (context) => CardInfo(),
    //   // other routes...
    // },
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

