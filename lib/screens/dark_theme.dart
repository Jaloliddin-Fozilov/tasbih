import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class DarkTheme extends StatefulWidget {
  final Function() changeTheme;
  final Function() restart;
  final int all;
  final Function() addToAll;
  final Function changeLanguage;
  const DarkTheme(this.changeTheme, this.restart, this.all, this.addToAll,
      this.changeLanguage,
      {Key? key})
      : super(key: key);

  @override
  State<DarkTheme> createState() => _DarkThemeState();
}

class _DarkThemeState extends State<DarkTheme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45,
        backgroundColor: const Color.fromARGB(31, 103, 103, 103),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => widget.changeLanguage(context),
          icon: const Icon(
            Icons.settings,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        title: Text(
          "title".i18n(),
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => widget.changeTheme(),
            icon: const Icon(
              Icons.light_mode,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.restart_alt,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            onPressed: () => widget.restart(),
          ),
        ],
      ),
      body: InkWell(
        onTap: () => widget.addToAll(),
        highlightColor: Colors.transparent,
        radius: 0,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            heightFactor: 4.3,
            child: Text(
              widget.all.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 90,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
