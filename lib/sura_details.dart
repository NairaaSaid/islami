import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/provider/app_config_provider.dart';
import 'package:islami_app/sura_model.dart';
import 'package:provider/provider.dart';

import 'My_Theme_data.dart';


class SuraDetails extends StatefulWidget {
  static const String routeName = "sura_details";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> list = [];

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (list.isEmpty) {
      loadFile(args.index);
    }
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(

              image: provider.appTheme==ThemeMode.light?AssetImage("assets/images/background.png"):AssetImage("assets/images/backgroundDark.png"),
              fit: BoxFit.fill)

      ),
      child: Scaffold(
        appBar: AppBar(
            title: Text(
          args.name,
          style: Theme.of(context).textTheme.bodyLarge,
        )),
        body: Card(
          color: provider.appTheme==ThemeMode.light? MyThemeData.WhiteColor:MyThemeData.primaryDark,
          elevation: 10,
          margin: EdgeInsets.all(15),
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color:provider.appTheme==ThemeMode.light? MyThemeData.primary:MyThemeData.YellowColor)

          ),
          child: ListView.separated(separatorBuilder: (context, index) => Divider(
            thickness: 2,indent: 40,endIndent: 40,color:

          provider.appTheme==ThemeMode.light? MyThemeData.primary:MyThemeData.WhiteColor
          ),
              itemBuilder: (context, index) {
                return Directionality(textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                     " ${list[index]} (${index+1})",
                      textAlign: TextAlign.center,style:provider.appTheme==ThemeMode.light?
                    Theme.of(context).textTheme.bodySmall!.copyWith(color: MyThemeData.blackColor):
                    Theme.of(context).textTheme.bodySmall

                    ),
                  ),
                );
              },
              itemCount: list.length),
        ),
      ),
    );
  }

  Future<void> loadFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");

    List<String> lines = sura.split("\n");
    list = lines;
    setState(() {});
  }
}
