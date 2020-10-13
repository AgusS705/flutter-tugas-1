import 'package:flutter/material.dart';
import 'package:my_first_app/about_page.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: AboutPage(), title: 'Sdgs 7');
  }
}
