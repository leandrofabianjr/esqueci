import '/models/record.dart';

class RecordsService {
  getAll() {
    return [
      Record(word: 'Teste', createdAt: DateTime.now()),
      Record(word: 'Muleta', createdAt: DateTime.now()),
    ];
  }
}
