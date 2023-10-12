import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../My_Theme_data.dart';
import '../provider/app_config_provider.dart';


class RadioTabs extends StatelessWidget {
  static const String routeName="radio";
  const RadioTabs({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);

    return Column(


      children: [Container(alignment: Alignment.center,
       margin: EdgeInsets.only(top: 80),

        child: Image.asset("assets/images/radio_image.png"),
      ),
       Text("اذاعة القران الكريم",style:provider.appTheme==ThemeMode.light? Theme.of(context).textTheme.bodyLarge!.copyWith(color: MyThemeData.blackColor):Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: 50),
        Row(
          children: [
            Expanded(child: Icon(Icons.skip_previous,color:provider.appTheme==ThemeMode.light? MyThemeData.primary:MyThemeData.YellowColor)),
            Expanded(child: Icon(Icons.play_arrow, color:provider.appTheme==ThemeMode.light? MyThemeData.primary:MyThemeData.YellowColor)),
            Expanded(child: Icon(Icons.skip_next,color:provider.appTheme==ThemeMode.light? MyThemeData.primary:MyThemeData.YellowColor)),
          ],
        ),
      ],);



    
  }
}
