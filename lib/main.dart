import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int hozirgi = 0;
  int jami = 0;
  int yozuvSoni = 0;
  int yozuvSoniObshi = 0;
  int nechtaligi = 33;
  List<String> text_list = [
    "Subhanalloh",
    "Alhamdulillah",
    "Allohu akbar",
    "La ilaha illallohu vahdahu la sharika lah, lahul mulku va lahul hamd. Va huva 'ala kulli shayin qodir."
  ];
  String get text => text_list[yozuvSoni];

  void ozgartirgichPlus() {
    setState(() {
      if (hozirgi >= 33) {
        hozirgi = 1;
      } else {
        hozirgi++;
      }
      if (yozuvSoniObshi <= 32 && yozuvSoniObshi >= 0) {
        if (yozuvSoniObshi == 0 && yozuvSoni == 3) {
          hozirgi = 1;
        }
        nechtaligi = 33;
        yozuvSoni = 0;
      } else if (yozuvSoniObshi <= 65 && yozuvSoniObshi >= 33) {
        yozuvSoni = 1;
      } else if (yozuvSoniObshi <= 98 && yozuvSoniObshi >= 66) {
        yozuvSoni = 2;
      } else {
        hozirgi = 1;
        yozuvSoni = 3;
        yozuvSoniObshi = -1;
        nechtaligi = 1;
      }
      jami++;
      yozuvSoniObshi++;
      print("yozuv soni obshi $yozuvSoniObshi");
      print("yozuv soni $yozuvSoni");
    });
  }

  void ozgartirgichMinus() {
    setState(() {
      if (hozirgi == -0) {
        hozirgi = 33;
      } else {
        hozirgi--;
      }
      if (hozirgi != 0) {
        jami--;
        yozuvSoniObshi--;
      }
      if (yozuvSoniObshi == 1 && yozuvSoni == 0 && hozirgi == 0) {
        yozuvSoniObshi = 0;
        jami = 0;
      }
      if (yozuvSoniObshi <= 33 && yozuvSoniObshi >= 0) {
        nechtaligi = 33;
        yozuvSoni = 0;
      } else if (yozuvSoniObshi <= 66 && yozuvSoniObshi >= 32) {
        yozuvSoni = 1;
      } else if (yozuvSoniObshi <= 100 && yozuvSoniObshi >= 67) {
        yozuvSoni = 2;
        nechtaligi = 33;
      } else {
        hozirgi = 0;
        yozuvSoni = 3;
        nechtaligi = 1;
        yozuvSoniObshi = 99;
      }
      print("yozuv soni obshi $yozuvSoniObshi");
      print("yozuv soni $yozuvSoni");
    });
  }

  void restart() {
    setState(() {
      jami = 0;
      hozirgi = 0;
      nechtaligi = 0;
      yozuvSoni = 0;
      yozuvSoniObshi = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tasbih app"),
          actions: [
            IconButton(
              icon: Icon(Icons.restart_alt),
              onPressed: () {
                setState(() {
                  jami = 0;
                });
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    hozirgi.toString() + "/" + nechtaligi.toString(),
                    style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          color: Colors.blue,
                          shape: CircleBorder(),
                          onPressed: ozgartirgichPlus,
                          child: Padding(
                            padding: const EdgeInsets.all(50),
                            child: Text(
                              '+',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                        ),
                        MaterialButton(
                          color: Colors.blue,
                          shape: CircleBorder(),
                          onPressed:
                              yozuvSoniObshi == 0 ? () {} : ozgartirgichMinus,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              '-',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Jami: $jami",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
