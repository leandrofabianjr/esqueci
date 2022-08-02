import 'package:hive_flutter/hive_flutter.dart';

import '/models/record.dart';

class RecordsService {
  static String boxName = 'records';

  static init() async {
    await Hive.openBox<Record>(boxName);
  }

  static getListanable() {
    return Hive.box<Record>(boxName).listenable();
  }
}
