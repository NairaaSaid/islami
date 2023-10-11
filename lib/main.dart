import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/sura_details.dart';
import 'package:islami_app/tabs/ahadeth_details.dart';

import 'My_Theme_data.dart';
import 'homeScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetails.routeName:(context)=>SuraDetails(),

        AhadethDetails.routeName:(context) => AhadethDetails(),

      },
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      locale: Locale("eng"),
    );
  }
}
