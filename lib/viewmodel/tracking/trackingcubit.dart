import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:runningapp/view/components/status.dart';
import 'package:runningapp/hive/hivehis.dart';
import 'package:runningapp/repos/hisrepos.dart';
import 'package:runningapp/viewmodel/tracking/trackingstate.dart';

import 'package:hive/hive.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TrackingCubit extends Cubit<TrackingState> {
  final HistoryRepository historyRepository;
  final StopWatchTimer stopWatchTimer = StopWatchTimer();
  late StreamSubscription<Position> positionStream;
  final Box<HistoryModel> historyBox = Hive.box<HistoryModel>('historyBox');

  TrackingCubit(this.historyRepository) : super(TrackingState());

  void loading(bool success) {
    emit(state.copyWith(loadingStatus: success));
  }

  Future<void> startMap() async {
    emit(state.copyWith(
      route: [],
      polyline: {},
      dist: 0.0,
      time: 0,
      lastTime: 0,
      speed: 0,
      avgSpeed: 0,
      speedCounter: 0,
      appendDist: 0,
    ));
    stopWatchTimer.onResetTimer();
    stopWatchTimer.clearPresetTime();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getCurrentPosition();
    });
    stopWatchTimer.onStartTimer();
  }

  Future<void> getCurrentPosition() async {
    loading(true);
    state.currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    if (state.currentPosition != null) {
      LocationSettings locationSettings = const LocationSettings(
          accuracy: LocationAccuracy.high, distanceFilter: 5);
      positionStream =
          Geolocator.getPositionStream(locationSettings: locationSettings)
              .listen((Position? position) async {
        if (position != null) {
          final route = List<LatLng>.from(state.route);
          final polyline = Set<Polyline>.from(state.polyline);
          final appendDist = Geolocator.distanceBetween(
            route.last.latitude,
            route.last.longitude,
            position.latitude,
            position.longitude,
          );
          final dist = state.dist! + appendDist;
          final timeDuration = (state.time - state.lastTime!);
          double speed = 0;
          double avgSpeed = state.avgSpeed!;
          int speedCounter = state.speedCounter!;
          if (timeDuration != 0) {
            speed = (appendDist / (timeDuration / 100)) * 3.6;
            if (speed != 0) {
              avgSpeed += speed;
              speedCounter++;
            }
          }
          final price = await calculatePriceInMeters(dist);
          route.add(LatLng(position.latitude, position.longitude));
          polyline.add(Polyline(
            polylineId: PolylineId(position.toString()),
            visible: true,
            points: route,
            width: 6,
            startCap: Cap.roundCap,
            endCap: Cap.roundCap,
            color: Colors.blue,
          ));
          emit(state.copyWith(
            currentPosition: position,
            route: route,
            polyline: polyline,
            dist: dist,
            lastTime: state.time,
            speed: speed,
            avgSpeed: avgSpeed,
            speedCounter: speedCounter,
            price: price,
          ));
        }
      });
    }
    loading(false);
  }

  Future<void> toggleMapType() async {
    final currentMapType = state.currentMapType == MapType.normal
        ? MapType.hybrid
        : MapType.normal;
    emit(state.copyWith(currentMapType: currentMapType));
  }

  Future<void> cleardata() async {
    stopWatchTimer.onStopTimer();
    emit(state.copyWith(
      route: [],
      polyline: {},
      dist: 0,
      time: 0,
      lastTime: 0,
      speed: 0,
      avgSpeed: 0,
      speedCounter: 0,
      appendDist: 0,
    ));
  }

  Future<void> saveHis() async {
    final history = HistoryModel(
        displayTime: state.displayTime,
        dist: state.dist!,
        date: DateTime.now());
    await historyBox.add(history);
  }

  Future<double> calculatePriceInMeters(double meter) async {
    const double pricePerKilometer = 25000.0;
    const double startPrice = 0.0;
    double kilometers = meter / 1000;
    double totalPrice = (kilometers * pricePerKilometer) + startPrice;
    return totalPrice;
  }

  Future<Position?> getPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return null;
    }
    Position? position = await Geolocator.getLastKnownPosition();
    {
      if (position != null) {
        return position;
      } else {
        return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
      }
    }
  }

  // void loadHistory() {
  //   try {
  //     final history = historyRepository.getAllHistory();
  //     emit(Success(history) as TrackingState);
  //   } catch (e) {
  //     emit(HistoryError('Failed to load history'));
  //   }
  // }

  Future<void> addHistory({required int id, required String name}) async {
    final result = await HistoryRepository().saveHistory(id: id, name: name);
    gethistory();
    result!.fold((l) {
      Failure;
    }, (succes) {
      emit(state.copyWith(
        trackStatus: TrackStatus.success,
      ));
    });
  }

  Future<void> gethistory() async {
    emit(state.copyWith(trackStatus: TrackStatus.loading));

    final result = await HistoryRepository().getAllHistory();
    result.fold((l) {
      Failure;
    }, (success) {
      emit(
        state.copyWith(
          ss: success,
          trackStatus: TrackStatus.success,
        ),
      );
    });
  }

  // Future<void> deleteHistory(int index) async {
  //   try {
  //     await historyRepository.deleteHistory(index);
  //     loadHistory(); // Reload history after deletion
  //   } catch (e) {
  //     emit(HistoryError('Failed to delete history'));
  //   }
  // }

  // Future<void> clearHistory() async {
  //   try {
  //     await historyRepository.clearHistory();
  //     loadHistory(); // Reload history after clearing
  //   } catch (e) {
  //     emit(HistoryError('Failed to clear history'));
  //   }
  // }

  // void fetchAndAddHistoryFromAPI() {}
}
