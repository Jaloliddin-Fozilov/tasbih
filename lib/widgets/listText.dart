import 'package:flutter/material.dart';

class ListText extends StatefulWidget {
  final List text_list;
  final int yozuvSoni;

  const ListText(this.text_list, this.yozuvSoni);

  @override
  State<ListText> createState() => _ListTextState();
}

class _ListTextState extends State<ListText> {
  String get text => widget.text_list[widget.yozuvSoni];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          borderRadius: const BorderRadius.all(
            Radius.circular(30.0),
          ),
          color: const Color(0xff021233).withOpacity(0.80),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
