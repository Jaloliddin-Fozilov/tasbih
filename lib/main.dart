import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasbih/widgets/language_item.dart';
// import 'package:vibration/vibration.dart';
import 'screens/dark_theme.dart';
import 'screens/first_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  bool isDark = false;
  int current = 0;
  int all = 0;
  int textCount = 0;
  int textCountAll = 0;
  int count = 33;

  saveValues(
    int currentToSave,
    int all,
    int textCount,
    int textCountAllToSave,
    int countToSave,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('currentToSave', currentToSave);
    prefs.setInt('allToSave', all);
    prefs.setInt('textCountToSave', textCount);
    prefs.setInt('textCountAllToSave', textCountAllToSave);
    prefs.setInt('countToSave', countToSave);
  }

  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  getValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      widget.isDark = prefs.getBool('isDarkToSave')!;
      widget.current = prefs.getInt('currentToSave')!;
      widget.all = prefs.getInt('allToSave')!;
      widget.textCount = prefs.getInt('textCountToSave')!;
      widget.textCountAll = prefs.getInt('textCountAllToSave')!;
      widget.count = prefs.getInt('countToSave')!;
    });
  }

  changeTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      widget.isDark = !widget.isDark;
    });
    prefs.setBool('isDarkToSave', widget.isDark);
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  void restart() {
    setState(() {
      widget.all = 0;
      widget.current = 0;
      widget.count = 33;
      widget.textCount = 0;
      widget.textCountAll = 0;
      widget.saveValues(
        widget.current,
        widget.all,
        widget.textCount,
        widget.textCountAll,
        widget.count,
      );
      // Vibration.vibrate(duration: 500);
    });
  }

  void changeLanguage(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text('change_language'.i18n()),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LanguageItem(
                  languageName: 'uzbek'.i18n(),
                  imageUrl: 'assets/images/uzbekistan.png',
                  languageCode: 'uz',
                  countryCode: 'UZ',
                ),
                LanguageItem(
                  languageName: 'uzbek_cyrl'.i18n(),
                  imageUrl: 'assets/images/uzbekistan.png',
                  languageCode: 'uz',
                  countryCode: 'Cyrl',
                ),
                LanguageItem(
                  languageName: 'english'.i18n(),
                  imageUrl: 'assets/images/united-states.png',
                  languageCode: 'en',
                  countryCode: 'EN',
                ),
                LanguageItem(
                  languageName: 'russian'.i18n(),
                  imageUrl: 'assets/images/russia.png',
                  languageCode: 'ru',
                  countryCode: 'RU',
                ),
                LanguageItem(
                  languageName: 'turk'.i18n(),
                  imageUrl: 'assets/images/turkey.png',
                  languageCode: 'tr',
                  countryCode: 'TR',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('close'.i18n()),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['assets/i18n'];
    List<Map<String, dynamic>> mapList = [
      {
        "count": 33,
        "text": "SubhanAllah".i18n(),
      },
      {
        "count": 33,
        "text": "Al-hamdu_lillah".i18n(),
      },
      {
        "count": 33,
        "text": "Allahu_Akbar".i18n(),
      },
      {
        "count": 1,
        "text":
            "La_illaha_illallah_wah-dahu_la_sharika_lah_Lahul-mulku_wa_lahul_hamd_wa_huwa_ala_Kul-li_shayin_Qadeer"
                .i18n(),
      },
    ];
    void changerPlus() {
      setState(
        () {
          if (widget.textCountAll < mapList[widget.textCount]['count'] - 1) {
            widget.current++;
            widget.saveValues(
              widget.current,
              widget.all,
              widget.textCount,
              widget.textCountAll,
              widget.count,
            );
          } else if (widget.textCount >= mapList.length - 1) {
            widget.textCount = 0;
            widget.current = 0;
            widget.textCountAll = 0;
            // Vibration.vibrate(duration: 350);
            widget.saveValues(
              widget.current,
              widget.all,
              widget.textCount,
              widget.textCountAll,
              widget.count,
            );
          } else {
            widget.textCount++;
            // Vibration.vibrate(duration: 350);
            widget.current = 0;
            widget.textCountAll = -1;
            widget.saveValues(
              widget.current,
              widget.all,
              widget.textCount,
              widget.textCountAll,
              widget.count,
            );
          }

          widget.all++;
          widget.textCountAll++;
          widget.saveValues(
            widget.current,
            widget.all,
            widget.textCount,
            widget.textCountAll,
            widget.count,
          );
        },
      );
    }

    void addToAll() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      widget.all++;

      setState(() {
        prefs.setInt('allToSave', widget.all);
      });
    }

    void selectText(BuildContext context) {
      String selectedText = '';
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: mapList
                  .map(
                    (object) => Container(
                      padding: const EdgeInsets.all(4.0),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 1.5,
                        ),
                      )),
                      child: InkWell(
                        onTap: () {
                          selectedText = object['text'];
                          final selectedTextIndex = mapList.indexWhere(
                              (object) => object['text'] == selectedText);

                          setState(() {
                            widget.textCount = selectedTextIndex;
                            widget.current = 0;
                            widget.saveValues(
                              widget.current,
                              widget.all,
                              widget.textCount,
                              widget.textCountAll,
                              widget.count,
                            );
                          });

                          Navigator.of(context).pop();
                        },
                        child: Text(
                          object['text'],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('close'.i18n()),
              ),
            ],
          );
        },
      );
    }

    return MaterialApp(
      localeResolutionCallback: (locale, supportedLocales) {
        if (supportedLocales.contains(locale)) {
          return locale;
        }

        return const Locale('en', 'EN');
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        LocalJsonLocalization.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en', 'EN'),
        Locale('uz', 'UZ'),
        Locale('uz', 'Cyrl'),
        Locale('ru', 'RU'),
        Locale('tr', 'TR'),
      ],
      title: "title".i18n(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Andika',
        primaryColor: const Color.fromRGBO(2, 25, 69, 1),
        scaffoldBackgroundColor:
            widget.isDark ? Colors.black : const Color.fromRGBO(2, 25, 69, 1),
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Color.fromRGBO(224, 191, 94, 1),
          ),
        ),
      ),
      home: widget.isDark
          ? DarkTheme(
              changeTheme,
              restart,
              widget.all,
              addToAll,
              changeLanguage,
            )
          : FirstTheme(
              changeTheme,
              mapList,
              widget.textCount,
              widget.current,
              restart,
              changerPlus,
              widget.all,
              selectText,
              changeLanguage,
            ),
    );
  }
}
