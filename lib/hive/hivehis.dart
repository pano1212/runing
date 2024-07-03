import 'package:hive/hive.dart';
part 'hivehis.g.dart';

@HiveType(typeId: 0)
class HistoryModel extends HiveObject {
  @HiveField(0)
  String displayTime;

  @HiveField(1)
  double dist;

  @HiveField(2)
  DateTime date;
  // @HiveField(3)
  // Image img;
  HistoryModel({
    required this.displayTime,
    required this.dist,
    required this.date,
    // required this.img
  });
}

late Box kuy;
late Box sus;
