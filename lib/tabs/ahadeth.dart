import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../My_Theme_data.dart';
import '../ahadeth_model.dart';
import 'ahadeth_details.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AhadethTabs extends StatefulWidget {

  static const String routeName = "ahadeth";

  @override
  State<AhadethTabs> createState() => _AhadethTabsState();
}

class _AhadethTabsState extends State<AhadethTabs> {
  List<AhadethModel>hadethList=[];

  @override
  Widget build(BuildContext context) {
    if(hadethList.isEmpty){loadHadeth();}

    return Center(
        child: Column(
      children: [
        Image.asset("assets/images/ahadeth_image.png"),
        Divider(
          thickness: 2,
          color: MyThemeData.primary,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: MyThemeData.blackColor),
        ),
        Divider(
          thickness: 2,
          color: MyThemeData.primary,
        ),
        hadethList.isEmpty?
            Center(child: CircularProgressIndicator(

              color: MyThemeData.primary,
            )):

        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(

                onTap: () {
                  Navigator.pushNamed(context, AhadethDetails.routeName,arguments: hadethList[index]);




                },
                child: Text(hadethList[index].title,textAlign: TextAlign.center,style: Theme
                    .of(context)
                    .textTheme
                    .bodySmall!.copyWith(color: MyThemeData.blackColor)),
              );
            },separatorBuilder: (context, index) {
              return Divider(
                thickness: 1,
                indent: 50,
                color: MyThemeData.primary,
                endIndent: 50,

              );
            }, itemCount: hadethList.length,
        ),




        )



      ],
    ));
  }

  loadHadeth() async {
     rootBundle
        .loadString("assets/files/ahadeth.txt").then((ahadeth) {
    List<String>ahadethList=ahadeth.split('#');
    for(int i=0;i<ahadethList.length;i++) {
      String hadethOne = ahadethList[i];
      List<String>hadethLines = hadethOne.trim().split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      List<String> content = hadethLines;
      AhadethModel ahadethModel = AhadethModel(title: title, content: content);
      hadethList.add(ahadethModel );

      setState(() {

      });
    }
    }).catchError((e){
      print(e.toString());
    });


  }

}
