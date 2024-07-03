import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:runningapp/hive/hivehis.dart';
import 'package:runningapp/homescreen.dart';
import 'package:runningapp/repos/hisrepos.dart';
import 'package:runningapp/view/activity/create.dart';
import 'package:runningapp/view/activity/rankiing.dart';
import 'package:runningapp/view/history/historydetail.dart';
import 'package:runningapp/viewmodel/tracking/trackingcubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(HistoryModelAdapter());
  kuy = await Hive.openBox<HistoryModel>('historyBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Box<HistoryModel>? history;
  const MyApp({
    super.key,
    this.history,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                TrackingCubit(HistoryRepository(historyBox: history))),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
        routes: {
          '/CreatePage': (context) => CreatePage(),
          '/RankingPage': (context) => RankingPage(),
          '/Hisdetail': (context) => Hisdetail(),
        },
      ),
    );
  }
}
