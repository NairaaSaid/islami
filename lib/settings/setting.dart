import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/My_Theme_data.dart';
import 'package:islami_app/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

import 'language.dart';
import 'ThemeBottomSheet.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.language,
              style: provider.appTheme == ThemeMode.light
                  ? Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: MyThemeData.blackColor)
                  : Theme.of(context).textTheme.bodyMedium),
          SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: MyThemeData.primary,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        provider.appLanguage == "en"
                            ? AppLocalizations.of(context)!.english
                            : AppLocalizations.of(context)!.arabic,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: MyThemeData.blackColor)),
                    Icon(Icons.arrow_drop_down)
                  ]),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(AppLocalizations.of(context)!.theme,
              style: provider.appTheme == ThemeMode.light
                  ? Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: MyThemeData.blackColor)
                  : Theme.of(context).textTheme.bodyMedium),
          SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: MyThemeData.primary,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        provider.appTheme == ThemeMode.dark
                            ? AppLocalizations.of(context)!.dark
                            : AppLocalizations.of(context)!.light,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: MyThemeData.blackColor)),
                    Icon(Icons.arrow_drop_down)
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context) => Language());
  }

  void showThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet());
  }
}
