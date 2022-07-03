import 'package:flutter/material.dart';

class ListText extends StatefulWidget {
  final List textMap;
  final int textCount;

  const ListText(this.textMap, this.textCount, {Key? key}) : super(key: key);

  @override
  State<ListText> createState() => _ListTextState();
}

class _ListTextState extends State<ListText> {
  String get text => widget.textMap[widget.textCount]['text'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
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
          style: TextStyle(
            fontSize: widget.textMap[widget.textCount]['count'] == 1 ? 14 : 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
