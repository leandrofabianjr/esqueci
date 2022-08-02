import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '/pages/home_page.dart';
import '/services/records_service.dart';

void main() async {
  await Hive.initFlutter();
  RecordsService.init();
  runApp(const EsqueciApp());
}

class EsqueciApp extends StatelessWidget {
  const EsqueciApp({Key? key}) : super(key: key);

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
