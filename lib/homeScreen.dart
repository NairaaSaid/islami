import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/provider/app_config_provider.dart';
import 'package:islami_app/tabs/ahadeth.dart';
import 'package:islami_app/tabs/quran.dart';
import 'package:islami_app/tabs/radio.dart';
import 'package:islami_app/tabs/sebha.dart';
import 'package:islami_app/settings/setting.dart';
import 'package:provider/provider.dart';

import 'My_Theme_data.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Stack(children: [
      provider.appTheme==ThemeMode.light?Image.asset("assets/images/background.png",
          width: double.infinity, fit: BoxFit.fill):Image.asset("assets/images/backgroundDark.png",
          width: double.infinity, fit: BoxFit.fill),

      Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.app_title, style:
              provider.appTheme==ThemeMode.light?
          Theme.of(context).textTheme.bodyLarge!.copyWith(color: MyThemeData.blackColor):Theme.of(context).textTheme.bodyLarge!.copyWith(color: MyThemeData.WhiteColor)),
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
                  label: AppLocalizations.of(context)!.setting,
                  backgroundColor: MyThemeData.primary),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(
                    "assets/images/radio.png",
                  )),
                  label: AppLocalizations.of(context)!.radio,
                  backgroundColor: MyThemeData.primary),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                  label: AppLocalizations.of(context)!.sebha,
                  backgroundColor: MyThemeData.primary
              ),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/ahadeth.png")),
                  label: AppLocalizations.of(context)!.ahadeth,
                  backgroundColor: MyThemeData.primary),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/quran.png")),
                  label: AppLocalizations.of(context)!.quran,
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
