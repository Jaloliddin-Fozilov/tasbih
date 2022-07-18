import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tasbih/generated/locale_keys.g.dart';

class All extends StatelessWidget {
  const All({
    Key? key,
    required this.all,
  }) : super(key: key);

  final int all;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        borderRadius: const BorderRadius.all(
          Radius.circular(30.0),
        ),
        color: const Color(0xff021233).withOpacity(0.8),
      ),
      child: Text(
        "${LocaleKeys.all.tr()}: $all",
        style: const TextStyle(fontSize: 22),
      ),
    );
  }
}
