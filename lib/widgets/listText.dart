import 'package:flutter/material.dart';

class ListText extends StatefulWidget {
  final List text_list;
  final int yozuvSoni;

  ListText(this.text_list, this.yozuvSoni);

  @override
  State<ListText> createState() => _ListTextState();
}

class _ListTextState extends State<ListText> {
  String get text => widget.text_list[widget.yozuvSoni];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}
