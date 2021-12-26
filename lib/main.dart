import 'package:flutter/material.dart';
import './widgets/buttons.dart';
import './widgets/all.dart';
import './widgets/present.dart';
import 'widgets/listText.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  int hozirgi = 0;
  int jami = 0;
  int yozuvSoni = 0;
  int yozuvSoniObshi = 0;
  int nechtaligi = 33;
  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<String> text_list = [
    "Субҳааналлоҳ",
    "Алҳамдулиллааҳ",
    "Аллоҳу Акбар",
    "Лаа Илааҳа Иллаллоҳу",
    "Астағфируллаҳу ва атубу илайҳ",
    "Субҳаналлоҳи ва биҳамдиҳи",
    "Субҳаналлоҳил азийм",
    "Лаа ҳавла ва лаа қуввата иллаа биллааҳ",
  ];
  void restart() {
    setState(() {
      widget.jami = 0;
      widget.hozirgi = 0;
      widget.nechtaligi = 33;
      widget.yozuvSoni = 0;
      widget.yozuvSoniObshi = 0;
    });
  }

  void ozgartirgichPlus() {
    setState(
      () {
        if (widget.yozuvSoniObshi < 32) {
          widget.hozirgi++;
        } else if (widget.yozuvSoni >= text_list.length - 1) {
          widget.yozuvSoni = 0;
          widget.hozirgi = 0;
          widget.yozuvSoniObshi = 0;
        } else {
          widget.yozuvSoni++;
          widget.hozirgi = 0;
          widget.yozuvSoniObshi = -1;
        }

        widget.jami++;
        widget.yozuvSoniObshi++;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Andika',
        primaryColor: const Color.fromRGBO(39, 54, 73, 1),
        scaffoldBackgroundColor: const Color.fromRGBO(39, 54, 73, 1),
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Color.fromRGBO(224, 191, 94, 1),
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 45,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            "Тасбеҳ",
            style: TextStyle(
              color: Color.fromRGBO(224, 191, 94, 1),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.restart_alt,
                color: Color.fromRGBO(224, 191, 94, 1),
              ),
              onPressed: () => restart(),
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListText(text_list, widget.yozuvSoni),
                  Present(
                      hozirgi: widget.hozirgi, nechtaligi: widget.nechtaligi),
                  Column(
                    children: [
                      Buttons(
                        ozgartirgichPlus,
                        widget.yozuvSoniObshi,
                      ),
                      All(jami: widget.jami),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
