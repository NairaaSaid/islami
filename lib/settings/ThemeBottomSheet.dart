import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/My_Theme_data.dart';
import 'package:provider/provider.dart';

import '../provider/app_config_provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(color: MyThemeData.blackColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          InkWell(onTap: () {
            provider.ChangeTheme(ThemeMode.dark);
          },
              child: provider.appTheme==ThemeMode.dark?
                  getSelected(AppLocalizations.of(context)!.dark):getUnSelected(AppLocalizations.of(context)!.dark)
          ),
          InkWell(
              onTap: () {
                provider.ChangeTheme(ThemeMode.light);
              },
              child: provider.appTheme==ThemeMode.light?
      getSelected(AppLocalizations.of(context)!.light):getUnSelected(AppLocalizations.of(context)!.light)

      )
        ],
      ),
    );
  }

  Widget getSelected(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: MyThemeData.primary)),
          Icon(Icons.check, color: MyThemeData.primary, size: 20,)
        ],
      ),
    );
  }

  Widget getUnSelected(String text) {
    return Padding(

      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: Theme
              .of(context)
              .textTheme
              .bodyMedium),

        ],
      ),

    );
  }


}

