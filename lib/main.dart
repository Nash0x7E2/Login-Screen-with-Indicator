import 'package:flutter/material.dart';
import 'package:login_page_with_indicator_slider/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        accentColor: Colors.amber,
        primaryColor: Color(0xFFBDA778),
        iconTheme: IconThemeData(
          color: Color(0xFFBDA778),
        ),
      ),
      home: HomePage(),
    ),
  );
}
