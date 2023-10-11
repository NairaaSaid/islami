import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../My_Theme_data.dart';


class RadioTabs extends StatelessWidget {
  static const String routeName="radio";
  const RadioTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(


      children: [Container(alignment: Alignment.center,
       margin: EdgeInsets.only(top: 80),

        child: Image.asset("assets/images/radio_image.png"),
      ),
       Text("اذاعة القران الكريم",style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: 50),
        Row(
          children: [
            Expanded(child: Icon(Icons.skip_previous,color: MyThemeData.primary,)),
            Expanded(child: Icon(Icons.play_arrow,color: MyThemeData.primary,)),
            Expanded(child: Icon(Icons.skip_next,color: MyThemeData.primary,)),
          ],
        ),
      ],);



    
  }
}
