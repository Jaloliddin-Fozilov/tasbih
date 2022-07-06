import 'package:flutter/material.dart';

class DarkTheme extends StatefulWidget {
  final Function() changeTheme;
  final Function() restart;
  final int all;
  final Function() addToAll;
  const DarkTheme(this.changeTheme, this.restart, this.all, this.addToAll,
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
          onPressed: () => widget.changeTheme(),
          icon: const Icon(
            Icons.light_mode,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        title: const Text(
          "Тасбиҳ",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        actions: [
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
