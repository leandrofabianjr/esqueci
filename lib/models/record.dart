import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Record extends HiveObject {
  String word;
  DateTime? createdAt;

  Record({
    required this.word,
    this.createdAt,
  });
}
