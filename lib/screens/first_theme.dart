import 'package:flutter/material.dart';

import '../widgets/buttons.dart';
import '../widgets/all.dart';
import '../widgets/present.dart';
import '../widgets/listText.dart';

class FirstTheme extends StatelessWidget {
  final Function restart;
  final List textMap;
  final int textCount;
  final int current;
  final Function() changerPlus;
  final int textCountAll;
  final Function selectText;

  const FirstTheme(this.textMap, this.textCount, this.current, this.restart,
      this.changerPlus, this.textCountAll, this.selectText,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Тасбиҳ",
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
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListText(textMap, textCount, selectText),
                  Present(current: current, count: textMap[textCount]['count']),
                  Column(
                    children: [
                      Buttons(
                        changerPlus,
                        textCountAll,
                      ),
                      All(all: textCountAll),
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
