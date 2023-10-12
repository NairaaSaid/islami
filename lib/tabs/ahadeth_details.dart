import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../My_Theme_data.dart';
import '../ahadeth_model.dart';
import '../provider/app_config_provider.dart';

class AhadethDetails extends StatefulWidget {
  static const String routeName = "ahadeth_details";

  @override
  State<AhadethDetails> createState() => _AhadethDetailsState();
}

class _AhadethDetailsState extends State<AhadethDetails> {
  List<String> list = [];

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as AhadethModel;
    /* if (list.isEmpty) {
      loadFile(args.index);
    }*/
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: provider.appTheme==ThemeMode.light?AssetImage("assets/images/background.png"):AssetImage("assets/images/backgroundDark.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
          args.title,
    style:provider.appTheme==ThemeMode.light?
    Theme.of(context).textTheme.bodySmall!.copyWith(color: MyThemeData.blackColor):
    Theme.of(context).textTheme.bodySmall),

            ),),

        body: Card(
          color: provider.appTheme==ThemeMode.light? MyThemeData.WhiteColor:MyThemeData.primaryDark,

          elevation: 10,
          margin: EdgeInsets.all(15),
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: MyThemeData.primary)),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                      thickness: 2,
                      indent: 40,
                      endIndent: 40,
                    ),
                itemBuilder: (context, index) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      " ${args.content[index]} ",
                      textAlign: TextAlign.center,
                        style:provider.appTheme==ThemeMode.light?
                    Theme.of(context).textTheme.bodySmall!.copyWith(color: MyThemeData.blackColor):
                      Theme.of(context).textTheme.bodySmall
                    ),
                  );
                },
                itemCount: args.content.length),
          ),
        ),
      ),
    );
  }
}
