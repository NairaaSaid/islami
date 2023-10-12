import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../My_Theme_data.dart';
import '../sura_details.dart';
import '../sura_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranTabs extends StatelessWidget {
  static const String routeName = "quran";

  List<String> suraName = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
var provider=Provider.of<AppConfigProvider>(context);
    return Center(

      child: Column(
        children: [

          Image.asset("assets/images/quran_image.png"),
          Divider(
            thickness: 2,
            color: provider.appTheme==ThemeMode.light?
            Theme.of(context).primaryColor :
            MyThemeData.YellowColor
          ),
          Text(

              AppLocalizations.of(context)!.sura_name, style:provider.appTheme==ThemeMode.light?
          Theme.of(context)
              .textTheme
              .bodyLarge!.copyWith(color: MyThemeData.blackColor):
          Theme.of(context)
              .textTheme
              .bodyLarge),

          Divider(
              thickness: 2,
              color: provider.appTheme==ThemeMode.light?
              Theme.of(context).primaryColor :
              MyThemeData.YellowColor
          ),
          Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  thickness: 1,
                  indent: 50,
                  color:  provider.appTheme==ThemeMode.light?
                  Theme.of(context).primaryColor :
                  MyThemeData.YellowColor,
                  endIndent: 50,

                )
                , itemBuilder: (context, index) {
              return InkWell(

                onTap: () {
                  Navigator.pushNamed(context, SuraDetails.routeName,arguments: SuraModel(suraName[index], index));




                },
                child: Text(

                  suraName[index],
                  style:provider.appTheme==ThemeMode.light?
                  Theme.of(context).textTheme.bodySmall!.copyWith(color: MyThemeData.blackColor):Theme.of(context).textTheme.bodySmall!.copyWith(color: MyThemeData.WhiteColor),
                  textAlign: TextAlign.center,),
              );
            },
              itemCount: suraName.length,
            ),
          )


        ],
      ),
    );
  }
}
