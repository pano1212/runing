import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:runningapp/view/components/color.dart';
import 'package:runningapp/viewmodel/tracking/trackingcubit.dart';
import 'package:runningapp/viewmodel/tracking/trackingstate.dart';

class HisPage extends StatefulWidget {
  const HisPage({super.key});

  @override
  State<HisPage> createState() => _HisPageState();
}

class _HisPageState extends State<HisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
              color: primalycolor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Past History',
                style: TextStyle(
                    color: textcolor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'For  your convenience and good health',
                style: TextStyle(color: textcolor),
              )
            ],
          ),
        ),
        BlocConsumer<TrackingCubit, TrackingState>(
            listener: (context, state) {},
            builder: (context, state) {
              // if (state.trackStatus == TrackStatus.loading) {
              //   return Center(child: CircularProgressIndicator());
              // } else if (state.trackStatus == TrackStatus.failure) {
              //   return Center(child: Text('Failed to load history'));
              // } else if (state.trackStatus == TrackStatus.success) {
              //   if (state.ss == null || state.ss!.isEmpty) {
              //     return Center(child: Text('No history found'));
              //   } else {
              return Container(
                height: 450,
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Hisdetail');
                  },
                  child: ListView.builder(
                      padding: EdgeInsets.all(10),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Stack(children: [
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/map.png',
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Running',
                                  style: TextStyle(
                                      color: textcolor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '${DateTime.now().toLocal()},'.split(' ')[0],
                                  style: TextStyle(
                                      color: textcolor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            left: 10,
                            top: 60,
                            child: Text(
                              '5.50km',
                              style: TextStyle(
                                  color: textcolor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Positioned(
                            top: 130,
                            left: 10,
                            child: Text(
                              '00:00:00',
                              style: TextStyle(
                                  color: textcolor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ]);
                      }),
                ),
              );
            }),
      ],
    ));
  }
}
