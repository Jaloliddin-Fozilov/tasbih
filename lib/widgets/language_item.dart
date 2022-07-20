import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class LanguageItem extends StatelessWidget {
  final String languageName;
  final String imageUrl;
  final String languageCode;
  final String countryCode;
  const LanguageItem({
    Key? key,
    required this.languageName,
    required this.imageUrl,
    required this.languageCode,
    required this.countryCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 36,
        height: 36,
        child: CircleAvatar(
          backgroundImage: AssetImage(imageUrl),
        ),
      ),
      title: Text(languageName),
      onTap: () async {
        MyApp.of(context)!.setLocale(Locale.fromSubtags(
            languageCode: languageCode, countryCode: countryCode));
        SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setBool('languageSelected', true);
        prefs.setString('languageCode', languageCode);
        prefs.setString('countryCode', countryCode.toString());

        Navigator.of(context).pop();
      },
    );
  }
}
