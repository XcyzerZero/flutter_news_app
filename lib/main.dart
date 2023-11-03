import 'package:flutter/material.dart';
import 'package:news_api_clean/app.dart';
import 'package:news_api_clean/injection_container.dart';

void main() async {
  await init();
  runApp(const MyApp());
}
