import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

enum TrackStatus { initial, loading, success, successPost, failure }

class TrackingState extends Equatable {
  final TrackStatus? trackStatus;
  final Set<Polyline> polyline;
  final List<LatLng> route;
  final double totalPrice;
  final int? id;
  final String? userid;
  final double? dist;
  late String displayTime;
  late int time;
  final int? lastTime;
  final double? speed;
  final double? avgSpeed;
  final int? speedCounter;
  final bool? loadingStatus;
  final double? appendDist;
  final LatLng? sourceLocation;
  late Position? currentPosition;
  final GoogleMapController? controller;
  final bool? status;
  var mapstype;
  final MapType currentMapType;
  final double? price;
  final Image? img;
  final List<dynamic>? ss;

  TrackingState({
    this.ss,
    this.trackStatus,
    this.polyline = const {},
    this.route = const [],
    this.totalPrice = 0.0,
    this.id,
    this.userid,
    this.dist = 0.0,
    this.displayTime = '',
    this.time = 0,
    this.lastTime = 0,
    this.speed = 0.0,
    this.avgSpeed = 0.0,
    this.speedCounter = 0,
    this.loadingStatus = false,
    this.appendDist = 0.0,
    this.sourceLocation = const LatLng(38.432199, 27.177221),
    this.currentPosition,
    this.controller,
    this.status,
    this.currentMapType = MapType.normal,
    this.price = 0.0,
    this.mapstype,
    this.img,
  });

  TrackingState copyWith({
    TrackStatus? trackStatus,
    Set<Polyline>? polyline,
    List<LatLng>? route,
    double? totalPrice,
    int? id,
    String? userid,
    double? dist,
    String? displayTime,
    int? time,
    int? lastTime,
    double? speed,
    double? avgSpeed,
    int? speedCounter,
    bool? loadingStatus,
    double? appendDist,
    LatLng? sourceLocation,
    Position? currentPosition,
    GoogleMapController? controller,
    bool? status,
    MapType? currentMapType,
    double? price,
    var mapstype,
    Image? img,
    List<dynamic>? ss,
  }) {
    return TrackingState(
        trackStatus: trackStatus ?? this.trackStatus,
        polyline: polyline ?? this.polyline,
        route: route ?? this.route,
        totalPrice: totalPrice ?? this.totalPrice,
        id: id ?? this.id,
        userid: userid ?? this.userid,
        dist: dist ?? this.dist,
        displayTime: displayTime ?? this.displayTime,
        time: time ?? this.time,
        lastTime: lastTime ?? this.lastTime,
        speed: speed ?? this.speed,
        avgSpeed: avgSpeed ?? this.avgSpeed,
        speedCounter: speedCounter ?? this.speedCounter,
        loadingStatus: loadingStatus ?? this.loadingStatus,
        appendDist: appendDist ?? this.appendDist,
        sourceLocation: sourceLocation ?? this.sourceLocation,
        currentPosition: currentPosition ?? this.currentPosition,
        controller: controller ?? this.controller,
        status: status ?? this.status,
        currentMapType: currentMapType ?? this.currentMapType,
        price: price ?? this.price,
        mapstype: mapstype ?? this.mapstype,
        img: img ?? this.img,
        ss: ss ?? this.ss);
  }

  @override
  List<Object?> get props => [
        polyline,
        route,
        totalPrice,
        id,
        userid,
        dist,
        displayTime,
        time,
        lastTime,
        speed,
        avgSpeed,
        speedCounter,
        loadingStatus,
        appendDist,
        sourceLocation,
        currentPosition,
        controller,
        status,
        currentMapType,
        price,
        mapstype,
        img,
        trackStatus,
        ss,
      ];
}
