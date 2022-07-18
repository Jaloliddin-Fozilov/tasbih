// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en_EN = {
  "title": "Tasbeeh",
  "all": "All",
  "close": "Close"
};
static const Map<String,dynamic> ru_RU = {
  "title": "Тасбиҳ",
  "all": "Жами",
  "close": "Назад"
};
static const Map<String,dynamic> uz_Cyrl = {
  "title": "Тасбиҳ",
  "all": "Жами",
  "close": "Ортга"
};
static const Map<String,dynamic> uz_UZ = {
  "title": "Tasbih",
  "all": "Jami",
  "close": "Ortga"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_EN": en_EN, "ru_RU": ru_RU, "uz_Cyrl": uz_Cyrl, "uz_UZ": uz_UZ};
}
