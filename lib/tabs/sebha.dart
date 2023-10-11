import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../My_Theme_data.dart';


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
          Text("عدد التسبيحات",style: Theme.of(context).textTheme.bodyMedium,),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Color(0xFFB7935F),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                '$counter',
                style: TextStyle(
                    color: Colors.black, fontSize: 24),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: MyThemeData.primary),
            child: Text(
              tasbeh[tasbehCount],
              style: Theme.of(context).textTheme.bodySmall
            ),
          ),
      ],),
    );
  }
}

