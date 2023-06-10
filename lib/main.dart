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
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        // AppLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('es', 'ES'), // Spanish
        // Add more locales as needed
      ],
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/gettingstarted': (context) => GettingStarted(),
        '/screen1': (context) => Screen1(),
        '/screen2': (context) => Screen2(),
        '/screen3': (context) => Screen3(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUp(),
        '/choicecard': (context) => ChoiceCard(),
        '/cardinfo': (context) => CardInfo(),
        '/orderdone': (context) => OrderDone(),
        '/itemdetails': (context) => ItemDetails(),
        '/more': (context) => More(),
        '/profile': (context) => Profile(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

