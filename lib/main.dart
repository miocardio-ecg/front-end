import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(
  MaterialApp(title: 'Analisis de Miocardio',
    home: Home(),
  theme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.red,
    secondaryHeaderColor: Colors.red
  ),)
);