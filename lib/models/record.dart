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

class RecordAdapter extends TypeAdapter<Record> {
  @override
  final typeId = 0;

  @override
  Record read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Record(
      word: reader.read() as String,
      createdAt: reader.read() as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Record obj) {
    writer
      ..write(obj.word)
      ..write(obj.createdAt);
  }
}
