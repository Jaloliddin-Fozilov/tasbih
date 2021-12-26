import 'package:flutter/material.dart';

class Present extends StatefulWidget {
  final int hozirgi;
  final int nechtaligi;
  const Present({
    Key? key,
    required this.hozirgi,
    required this.nechtaligi,
  }) : super(key: key);

  @override
  State<Present> createState() => _PresentState();
}

class _PresentState extends State<Present> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "${widget.hozirgi}/${widget.nechtaligi}",
        style: TextStyle(fontSize: 58, fontWeight: FontWeight.bold),
      ),
    );
  }
}
