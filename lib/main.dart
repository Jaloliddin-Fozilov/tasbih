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
    "Аллоҳу акбар",
    "Лаа илааҳа иллаллоҳу ваҳдаҳув лаа шарийка лаҳ, лаҳул мулку ва лаҳул ҳамду ва ҳува ъалаа кулли шайъин қодийр"
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
        // if (widget.hozirgi >= 33) {
        //   widget.hozirgi = 1;
        // } else {
        //   widget.hozirgi++;
        // }
        // if (widget.yozuvSoniObshi <= 32 && widget.yozuvSoniObshi >= 0) {
        //   if (widget.yozuvSoniObshi == 0 && widget.yozuvSoni == 3) {
        //     widget.hozirgi = 1;
        //   }
        //   widget.nechtaligi = 33;
        //   widget.yozuvSoni = 0;
        // } else if (widget.yozuvSoniObshi <= 65 && widget.yozuvSoniObshi >= 33) {
        //   widget.yozuvSoni = 1;
        // } else if (widget.yozuvSoniObshi <= 98 && widget.yozuvSoniObshi >= 66) {
        //   widget.yozuvSoni = 2;
        // } else if (widget.yozuvSoniObshi == 100) {
        //   widget.hozirgi = 1;
        //   widget.yozuvSoni = 3;
        //   widget.nechtaligi = 1;
        // } else {
        //   widget.yozuvSoniObshi = 0;
        // }

        if (widget.yozuvSoniObshi < 33) {
          widget.hozirgi++;
        } else {
          widget.yozuvSoni++;
          widget.hozirgi = 0;
          widget.yozuvSoniObshi = 0;
        }

        widget.jami++;
        widget.yozuvSoniObshi++;
      },
    );
  }

  void ozgartirgichMinus() {
    setState(() {
      if (widget.hozirgi == -0) {
        widget.hozirgi = 33;
      } else {
        widget.hozirgi--;
      }
      if (widget.hozirgi != 0) {
        widget.jami--;
        widget.yozuvSoniObshi--;
      }
      if (widget.yozuvSoniObshi == 1 &&
          widget.yozuvSoni == 0 &&
          widget.hozirgi == 0) {
        widget.yozuvSoniObshi = 0;
        widget.jami = 0;
      }
      if (widget.yozuvSoniObshi <= 33 && widget.yozuvSoniObshi >= 0) {
        widget.nechtaligi = 33;
        widget.yozuvSoni = 0;
      } else if (widget.yozuvSoniObshi <= 66 && widget.yozuvSoniObshi >= 32) {
        widget.yozuvSoni = 1;
      } else if (widget.yozuvSoniObshi <= 100 && widget.yozuvSoniObshi >= 67) {
        widget.yozuvSoni = 2;
        widget.nechtaligi = 33;
      } else {
        widget.hozirgi = 0;
        widget.yozuvSoni = 3;
        widget.nechtaligi = 1;
        widget.yozuvSoniObshi = 99;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Тасбеҳ"),
          actions: [
            IconButton(
              icon: const Icon(Icons.restart_alt),
              onPressed: () => restart(),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListText(text_list, widget.yozuvSoni),
                Present(hozirgi: widget.hozirgi, nechtaligi: widget.nechtaligi),
                Column(
                  children: [
                    Buttons(ozgartirgichPlus, widget.yozuvSoniObshi,
                        ozgartirgichMinus),
                    All(jami: widget.jami),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}