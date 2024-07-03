import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:runningapp/view/components/status.dart';
import 'package:runningapp/hive/hivehis.dart';
import 'package:runningapp/service/hisservice.dart';

class HistoryRepository {
  final Box<HistoryModel>? historyBox;

  HistoryRepository({this.historyBox});

  Future<Either<Failure, List<dynamic>>> getAllHistory() async {
    try {
      var result = await HistroyService().getHistory();
      return right(result!);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<void> addHistory(HistoryModel history) async {
    await historyBox!.add(history);
  }

  Future<void> deleteHistory(int index) async {
    await historyBox!.deleteAt(index);
  }

  Future<void> clearHistory() async {
    await historyBox!.clear();
  }

  Future<Either<Failure, bool>?> saveHistory(
      {required int id, required String name}) async {
    try {
      final result = await HistroyService().saveHistory(id: id, name: name);
      if (result == true) {
        return right(result!);
      }
    } catch (e) {
      return Left(
        Failure(e.toString()),
      );
    }
    return null;
  }
}
