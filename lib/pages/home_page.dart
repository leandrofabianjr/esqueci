import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '/models/record.dart';
import '/services/records_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final records = RecordsService.getListanable();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(title: Text('Esqueci!')),
          ValueListenableBuilder<Box<Record>>(
            valueListenable: RecordsService.getListanable(),
            builder: (context, box, widget) {
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
          ),
        ],
      ),
    );
  }
}
