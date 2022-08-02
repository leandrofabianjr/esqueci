import 'package:flutter/material.dart';

import '/services/records_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final records = RecordsService().getAll();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(title: Text('Esqueci!')),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int i) {
                return ListTile(
                  title: Text(records[i].word),
                  subtitle: Text(records[i].createdAt.toString()),
                );
              },
              childCount: records.length, // 1000 list items
            ),
          ),
        ],
      ),
    );
  }
}
