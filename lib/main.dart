import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/provider/app_config_provider.dart';
import 'package:islami_app/sura_details.dart';
import 'package:islami_app/tabs/ahadeth_details.dart';
import 'package:provider/provider.dart';

import 'My_Theme_data.dart';
import 'homeScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(ChangeNotifierProvider(create: (BuildContext context) => AppConfigProvider(),
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetails.routeName:(context)=>SuraDetails(),

        AhadethDetails.routeName:(context) => AhadethDetails(),

      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.darkTheme,
      themeMode: provider.appTheme,
      darkTheme: MyThemeData.darkTheme,
      locale: Locale(provider.appLanguage),
    );
  }
}
