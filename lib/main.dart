import 'package:flutter/material.dart';
import 'dart:math';
import 'library.dart';
import 'firstpage.dart';
import 'quizpage.dart';
import 'gotitrightpage.dart';
import 'gaveuppage.dart';
import 'endpage.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter',
    theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFCF788)),
    home: FirstPage(),
  ),
  );
}