import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/tabs/ahadeth.dart';
import 'package:islami_app/tabs/quran.dart';
import 'package:islami_app/tabs/radio.dart';
import 'package:islami_app/tabs/sebha.dart';
import 'package:islami_app/tabs/setting.dart';

import 'My_Theme_data.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset("assets/images/background.png",
          width: double.infinity, fit: BoxFit.fill),
      Scaffold(
        appBar: AppBar(
          title: Text("Islami", style: Theme.of(context).textTheme.bodyLarge),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(

                  icon: Icon(Icons.settings),
                  label: "Setting",
                  backgroundColor: MyThemeData.primary),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(
                    "assets/images/radio.png",
                  )),
                  label: "Radio",
                  backgroundColor: MyThemeData.primary),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                  label: "Sebha",
                  backgroundColor: MyThemeData.primary),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/ahadeth.png")),
                  label: "Ahadeth",
                  backgroundColor: MyThemeData.primary),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/quran.png")),
                  label: "Quran",
                  backgroundColor: MyThemeData.primary),
            ]),
        body:tabs[index] ,
      ),
    ]);
  }
  List<Widget>tabs=[
    SettingTab(),RadioTabs(),SebhaTabs(),AhadethTabs(),QuranTabs()
  ];
}
