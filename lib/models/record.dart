import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Record extends HiveObject {
  @HiveField(0)
  String word;

  @HiveField(1)
  DateTime? createdAt;

  Record({
    required this.word,
    this.createdAt,
  });
}
