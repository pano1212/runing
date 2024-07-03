import 'dart:io';

import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

class HiveDatabase {
  static BoxCollection? box;
  Future<BoxCollection?> hiveDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    box = await BoxCollection.open(
      'map_step_tracker', // Name of your database
      {'user'}, // Names of your boxes
      path: directory.path,
    );
    return box;
  }

  static Future<dynamic> getHistory(
      {required double dist, required String displaytime}) async {
    final hisBox = await box!.openBox<Map>('historyBox');
    await hisBox.put("history", {
      "distance": dist,
      "displaytime": displaytime,
    });

    return true;
  }

  static Future<bool> saveHistory(
      {required int id, required String name}) async {
    try {
      final history = await Hive.box<Map>("history");
      await history.add({"id": id, "name": name});
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<List<dynamic>?> getHistpr() async {
    try {
      final history = await Hive.box("history").values.toList();
      return history;
    } catch (e) {
      return null;
    }
  }
}
