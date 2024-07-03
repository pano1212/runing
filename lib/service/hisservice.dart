import 'package:runningapp/hive/hive.dart';

class HistroyService {
  Future<bool?> saveHistory({required int id, required String name}) async {
    try {
      final result = await HiveDatabase.saveHistory(id: id, name: name);
      if (result == true) {
        return true;
      }
    } catch (e) {
      return false;
    }
    return null;
  }

  Future<List<dynamic>?> getHistory() async {
    try {
      final result = await HiveDatabase.getHistpr();
      if (result != null) {
        return result;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
