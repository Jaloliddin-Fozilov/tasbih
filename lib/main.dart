import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:vibration/vibration.dart';

import 'screens/first_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
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
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  getValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      widget.current = prefs.getInt('currentToSave')!;
      widget.all = prefs.getInt('allToSave')!;
      widget.textCount = prefs.getInt('textCountToSave')!;
      widget.textCountAll = prefs.getInt('textCountAllToSave')!;
      widget.count = prefs.getInt('countToSave')!;
    });
  }

  List<Map<String, dynamic>> mapList = [
    {
      "count": 33,
      "text": "Субҳааналлоҳ",
    },
    {
      "count": 33,
      "text": "Алҳамдулиллааҳ",
    },
    {
      "count": 33,
      "text": "Аллоҳу Акбар",
    },
    {
      "count": 1,
      "text":
          "Лаа илааҳа иллаллоҳу ваҳдаҳув лаа шарийка лаҳ, лаҳул мулку ва лаҳул ҳамду ва ҳува ъалаа кулли шайъин қодийр",
    },
  ];

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
      print('vibration 500');
      // Vibration.vibrate(duration: 500);
    });
  }

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
          print('vibration 350');
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
          print('vibration 350');
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

  void selectText(BuildContext context) {
    String selectedText = '';
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          content: Column(
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

                        widget.current = selectedTextIndex;
                        print(selectedTextIndex);
                        changerPlus();

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
              child: const Text('YOPISH'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    getValues();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Andika',
        primaryColor: const Color.fromRGBO(2, 25, 69, 1),
        scaffoldBackgroundColor: const Color.fromRGBO(2, 25, 69, 1),
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Color.fromRGBO(224, 191, 94, 1),
          ),
        ),
      ),
      home: FirstTheme(
        mapList,
        widget.textCount,
        widget.all,
        restart,
        changerPlus,
        widget.all,
        selectText,
      ),
    );
  }
}
