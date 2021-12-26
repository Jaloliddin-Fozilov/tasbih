import 'package:flutter/material.dart';
import './rotation.dart';

class Buttons extends StatefulWidget {
  final Function() ozgartirgichPlus;
  final int yozuvSoniObshi;

  Buttons(
    this.ozgartirgichPlus,
    this.yozuvSoniObshi,
  );

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return AnimatedRotationCustom(
      angle: _counter * 15,
      duration: const Duration(milliseconds: 90),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _counter++;
              });
              widget.ozgartirgichPlus();
            },
            borderRadius: BorderRadius.circular(180),
            child: Image.asset(
              'assets/images/image.png',
              width: 250,
            ),
          ),
        ],
      ),
    );
  }
}
