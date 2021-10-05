import 'package:flutter/material.dart';

class Present extends StatelessWidget {
  const Present({
    Key? key,
    required this.hozirgi,
    required this.nechtaligi,
  }) : super(key: key);

  final int hozirgi;
  final int nechtaligi;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        hozirgi.toString() + "/" + nechtaligi.toString(),
        style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
      ),
    );
  }
}
