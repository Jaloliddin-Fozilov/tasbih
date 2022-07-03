import 'package:flutter/material.dart';

class Present extends StatefulWidget {
  final int current;
  final int count;
  const Present({
    Key? key,
    required this.current,
    required this.count,
  }) : super(key: key);

  @override
  State<Present> createState() => _PresentState();
}

class _PresentState extends State<Present> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "${widget.current}/${widget.count}",
        style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
      ),
    );
  }
}
