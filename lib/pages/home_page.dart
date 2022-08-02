import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '/models/record.dart';
import '/pages/records_new_page.dart';
import '/services/records_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CustomScrollView(
        slivers: [
          SliverAppBar(title: Text('Esqueci!')),
          RecordsListWidget(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const RecordsNewPage()),
        ),
      ),
    );
  }
}

class RecordsListWidget extends StatelessWidget {
  const RecordsListWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<Record>>(
      valueListenable: RecordsService.getListanable(),
      builder: (context, box, widget) {
        final records = box.values.toList();
        if (records.isEmpty) {
          return SliverToBoxAdapter(
              child: Center(
            child: Column(
              children: [
                const Text('Esqueceu a palavra? 🤦'),
                const Text('Clica no botão e salva ela aqui'),
              ],
            ),
          ));
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int i) {
              return ListTile(
                title: Text(records[i].word),
                subtitle: Text(records[i].createdAt.toString()),
              );
            },
            childCount: records.length,
          ),
        );
      },
    );
  }
}
