import 'package:flutter/material.dart';

import '/pages/home_page.dart';

void main() => runApp(const EsqueciApp());

class EsqueciApp extends StatelessWidget {
  const EsqueciApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Esqueci!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
