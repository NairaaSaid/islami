import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../My_Theme_data.dart';
import '../provider/app_config_provider.dart';


class SebhaTabs extends StatefulWidget {
  static const String routeName="sebha";

  @override
  State<SebhaTabs> createState() => _SebhaTabsState();
}

class _SebhaTabsState extends State<SebhaTabs> {

  int counter=0;
  int tasbehCount = 0;
  List<String> tasbeh = ["سبحان الله", "الحمد لله","لا اله الا الله ", "الله اكبر"];
  void incCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);

    return Center(
      child: Column(
        children: [
        Image(image: AssetImage("assets/images/head_of_seb7a.png")),

          InkWell(onTap: () {
            if (counter == 33) {
              counter = 0;
              if (tasbehCount == tasbeh.length - 1) {
                tasbehCount = 0;
              } else {
                tasbehCount++;
              }
            } else {
              counter++;
            }

            setState(() {});
          },


           child: Image.asset("assets/images/body_of_seb7a.png")),
          Text("عدد التسبيحات",style:provider.appTheme==ThemeMode.light?
          Theme.of(context).textTheme.bodyMedium!.copyWith(color: MyThemeData.blackColor):Theme.of(context).textTheme.bodyMedium,),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: provider.appTheme==ThemeMode.light? MyThemeData.primary:MyThemeData.blackColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                '$counter',
    style:provider.appTheme==ThemeMode.light?
    Theme.of(context).textTheme.bodyMedium!.copyWith(color: MyThemeData.blackColor):Theme.of(context).textTheme.bodyMedium,),
              ),
            ),
          //),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color:provider.appTheme==ThemeMode.light? MyThemeData.primary:MyThemeData.YellowColor),
            child: Text(
              tasbeh[tasbehCount],
              style: provider.appTheme==ThemeMode.light?
    Theme.of(context).textTheme.bodyMedium:Theme.of(context).textTheme.bodyMedium!.copyWith(color: MyThemeData.blackColor,)
            ),
          ),
      ],),
    );
  }
}

