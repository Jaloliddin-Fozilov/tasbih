import 'package:flutter/material.dart';

class All extends StatelessWidget {
  const All({
    Key? key,
    required this.jami,
  }) : super(key: key);

  final int jami;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        "Жами: $jami",
        style: const TextStyle(fontSize: 22),
      ),
    );
  }
}
