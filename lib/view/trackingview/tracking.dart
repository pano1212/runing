import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:runningapp/view/components/color.dart';
import 'package:runningapp/viewmodel/tracking/trackingcubit.dart';
import 'package:runningapp/viewmodel/tracking/trackingstate.dart';
import 'package:screenshot/screenshot.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  List<DropdownMenuItem<String>> _dropdownItems = [
    DropdownMenuItem(
      value: 'Option 1',
      child: Icon(Icons.gps_fixed),
    ),
  ];

  ScreenshotController screenshot = ScreenshotController();

  screeshot() async {
    try {
      final Uint8List? capturedImage = await screenshot.capture();
      if (capturedImage != null) {
        final box = Hive.box('historyBox');
        await box.add(capturedImage);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Screenshot saved successfully!')),
        );
      }
    } catch (error) {
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to capture screenshot.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: BlocConsumer<TrackingCubit, TrackingState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<TrackingCubit>();
          final Completer<GoogleMapController?> controllerMap = Completer();
          if (state.currentPosition == null) {
            return Center(child: CircularProgressIndicator());
          }
          return Stack(
            children: [
              Screenshot(
                controller: screenshot,
                child: GoogleMap(
                  mapType: state.currentMapType,
                  polylines: state.polyline,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(state.currentPosition!.latitude,
                          state.currentPosition!.longitude),
                      zoom: 13.5),
                  onMapCreated: (mapController) {
                    mapController.setMapStyle(state.mapstype);

                    if (controllerMap.isCompleted) {
                      controllerMap.complete(mapController);
                      setState(() {});
                    }

                    setState(() {});
                  },
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.close,
                              color: Colors.grey,
                            ),
                            Container(
                                child: Row(
                              children: [
                                Image.asset(
                                  'assets/icon/bx_run.png',
                                ),
                                Text(
                                  'Running',
                                  style: TextStyle(color: primalycolor),
                                )
                              ],
                            )),
                            DropdownButton(
                              icon: Icon(Icons.display_settings_outlined),
                              items: _dropdownItems
                                  .map<DropdownMenuItem<String>>(
                                      (DropdownMenuItem<String> value) {
                                return value;
                              }).toList(),
                              onChanged: (value) {},
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FloatingActionButton(
                    child: Icon(Icons.map),
                    backgroundColor: Colors.black,
                    onPressed: () => {
                      cubit.toggleMapType(),
                    },
                    heroTag: null,
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    height: 220,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    decoration: BoxDecoration(
                        color: primalycolor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(clipBehavior: Clip.none, children: [
                      Positioned(
                        top: -35,
                        left: MediaQuery.of(context).size.width / 2 - 50,
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 35,
                            child: FloatingActionButton(
                              backgroundColor: Colors.white,
                              onPressed: () async {
                                cubit.addHistory(id: 1, name: '1');
                                print(cubit.addHistory(id: 1, name: '2'));
                                try {
                                  final Uint8List? capturedImage =
                                      await screenshot.capture();
                                  if (capturedImage != null) {
                                    final box = Hive.box('screen');
                                    await box.add(capturedImage);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Screenshot saved successfully!')),
                                    );
                                  }
                                } catch (error) {
                                  print(error);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Failed to capture screenshot.')),
                                  );
                                }
                              },
                              child: Icon(
                                Icons.stop,
                                color: primalycolor,
                                size: 40,
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: Column(
                          children: [
                            StreamBuilder<int>(
                              stream: cubit.stopWatchTimer.rawTime,
                              initialData: 0,
                              builder: (context, snap) {
                                state.time = snap.data!;
                                state.displayTime =
                                    "${StopWatchTimer.getDisplayTimeHours(state.time)}:${StopWatchTimer.getDisplayTimeMinute(state.time)}:${StopWatchTimer.getDisplayTimeSecond(state.time)}";
                                return Container(
                                  height: 40,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Time',
                                        style: TextStyle(color: primalycolor),
                                      ),
                                      Text(
                                        state.displayTime,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3!
                                            .copyWith(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black,
                                            ),
                                      ),
                                      Text(
                                        'Min',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Step',
                                          style: TextStyle(color: primalycolor),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              state.speed!.toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3!
                                                  .copyWith(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.black,
                                                  ),
                                            ),
                                            Text(
                                              ' Min',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Distance',
                                          style: TextStyle(color: primalycolor),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              (state.dist! / 1000)
                                                  .toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3!
                                                  .copyWith(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Colors.black,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                            ),
                                            Text(
                                              ' Km',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Heart',
                                          style: TextStyle(color: primalycolor),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              state.speed!.toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3!
                                                  .copyWith(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.black,
                                                  ),
                                            ),
                                            Text(
                                              ' Time/Min',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Calories',
                                          style: TextStyle(color: primalycolor),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              ' 10',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3!
                                                  .copyWith(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.black,
                                                  ),
                                            ),
                                            Text(
                                              ' Kcal',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // const Divider(),
                          ],
                        ),
                      ),
                    ]),
                  )),
            ],
          );
        },
      ),
    );
  }
}
