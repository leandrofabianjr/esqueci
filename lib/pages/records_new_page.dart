import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '/models/record.dart';
import '/services/records_service.dart';

class RecordsNewPage extends StatefulWidget {
  const RecordsNewPage({Key? key}) : super(key: key);

  @override
  _RecordsNewPageState createState() => _RecordsNewPageState();
}

class _RecordsNewPageState extends State<RecordsNewPage> {
  final formKey = GlobalKey<FormState>();

  late String word;

  @override
  void initState() {
    word = '';
    super.initState();
  }

  void onFormSubmit() {
    if (formKey.currentState!.validate()) {
      RecordsService.create(Record(word: word));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nova palavra')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    initialValue: "",
                    decoration: const InputDecoration(
                      labelText: "Palavra",
                    ),
                    onChanged: (value) {
                      setState(() {
                        word = word;
                      });
                    },
                  ),
                  ElevatedButton.icon(
                    label: const Text("Salvar"),
                    icon: const Icon(Icons.save),
                    onPressed: onFormSubmit,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
