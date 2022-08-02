import 'package:hive_flutter/hive_flutter.dart';

import '/models/record.dart';

class RecordsService {
  static String boxName = 'records';

  static init() async {
    Hive.registerAdapter(RecordAdapter());
    await Hive.openBox<Record>(boxName);
  }

  static getListanable() {
    return Hive.box<Record>(boxName).listenable();
  }

  static create(Record newObj) {
    newObj.createdAt = DateTime.now();
    Box<Record> box = Hive.box<Record>(boxName);
    box.add(newObj);
  }
}

class RecordAdapter extends TypeAdapter<Record> {
  @override
  final typeId = 0;

  @override
  Record read(BinaryReader reader) {
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
