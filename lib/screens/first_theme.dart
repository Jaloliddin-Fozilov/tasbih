import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../widgets/buttons.dart';
import '../widgets/all.dart';
import '../widgets/present.dart';
import '../widgets/listText.dart';

class FirstTheme extends StatefulWidget {
  final Function() changeTheme;
  final Function restart;
  final List textMap;
  final int textCount;
  final int current;
  final Function() changerPlus;
  final int textCountAll;
  final Function selectText;
  final Function changeLanguage;

  const FirstTheme(
      this.changeTheme,
      this.textMap,
      this.textCount,
      this.current,
      this.restart,
      this.changerPlus,
      this.textCountAll,
      this.selectText,
      this.changeLanguage,
      {Key? key})
      : super(key: key);

  @override
  State<FirstTheme> createState() => _FirstThemeState();
}

class _FirstThemeState extends State<FirstTheme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: Row(
          children: [
            IconButton(
              onPressed: () => widget.changeLanguage(context),
              icon: const Icon(
                Icons.settings,
                color: Color.fromRGBO(224, 191, 94, 1),
              ),
            ),
          ],
        ),
        title: Text(
          "title".i18n(),
          style: const TextStyle(
            color: Color.fromRGBO(224, 191, 94, 1),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => widget.changeTheme(),
            icon: const Icon(
              Icons.dark_mode,
              color: Color.fromRGBO(224, 191, 94, 1),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.restart_alt,
              color: Color.fromRGBO(224, 191, 94, 1),
            ),
            onPressed: () => widget.restart(),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListText(widget.textMap, widget.textCount, widget.selectText),
                  Present(
                      current: widget.current,
                      count: widget.textMap[widget.textCount]['count']),
                  Column(
                    children: [
                      Buttons(
                        widget.changerPlus,
                        widget.textCountAll,
                      ),
                      All(all: widget.textCountAll),
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
