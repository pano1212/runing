import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:runningapp/view/activity/activity.dart';
import 'package:runningapp/view/components/color.dart';
import 'package:runningapp/view/history/history.dart';
import 'package:runningapp/view/home/home.dart';
import 'package:runningapp/view/profile/profile.dart';
import 'package:runningapp/view/trackingview/tracking.dart';
import 'package:runningapp/viewmodel/tracking/trackingcubit.dart';
import 'package:runningapp/viewmodel/tracking/trackingstate.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  // final autoSizeGroup = autoSizeGrou
  var _bottomNavIndex = 0; //default index of a first screen

  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;

  final iconList = <IconData>[
    Icons.home,
    Icons.sports_soccer,
    Icons.analytics,
    Icons.person,
  ];
  List label = ['Home', 'Activity', 'Analysis', 'Profile'];
  List<Widget> item = [
    HomePage(),
    ActivityPage(),
    HisPage(),
    Profile(),
  ];
  void _onTap(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    _fabAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    _hideBottomBarAnimationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      Duration(seconds: 1),
      () => _fabAnimationController.forward(),
    );
    Future.delayed(
      Duration(seconds: 1),
      () => _borderRadiusAnimationController.forward(),
    );
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification &&
        notification.metrics.axis == Axis.vertical) {
      switch (notification.direction) {
        case ScrollDirection.forward:
          _hideBottomBarAnimationController.reverse();
          _fabAnimationController.forward(from: 1);
          break;
        case ScrollDirection.reverse:
          // _hideBottomBarAnimationController.forward();
          _fabAnimationController.reverse(from: 0);
          break;
        case ScrollDirection.idle:
          break;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: item[_bottomNavIndex],
      floatingActionButton: Container(
          width: 70,
          height: 70,
          child: BlocConsumer<TrackingCubit, TrackingState>(
            builder: (context, state) {
              final cubit = context.read<TrackingCubit>();
              return FloatingActionButton(
                backgroundColor: Colors.white,
                child: Column(
                  children: [
                    Icon(Icons.run_circle, size: 40, color: primalycolor),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'START',
                      style: TextStyle(color: primalycolor),
                    ),
                  ],
                ),
                onPressed: () async {
                  Position? poss = await cubit.getPermission();

                  if (poss != null) {
                    cubit.startMap();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TrackingPage(),
                    ));
                    _fabAnimationController.reset();
                    _borderRadiusAnimationController.reset();
                    _borderRadiusAnimationController.forward();
                    _fabAnimationController.forward();
                  }
                },
              );
            },
            listener: (context, state) {},
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: 105,
        child: Column(children: [
          AnimatedBottomNavigationBar.builder(
            itemCount: iconList.length,
            tabBuilder: (int index, bool isActive) {
              // final color = isActive
              // ? colors.activeNavigationBarColor
              // : colors.notActiveNavigationBarColor;
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(iconList[index], size: 24, color: Colors.white),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      label[index],
                      style: TextStyle(
                          color: _bottomNavIndex == index
                              ? Colors.white
                              : Colors.grey.shade300),
                    ),
                    // child: AutoSizeText(
                    //   "brightness $index",
                    //   maxLines: 1,
                    //   style: TextStyle(color: color),
                    //   group: autoSizeGroup,
                    // ),
                  ),
                ],
              );
            },
            backgroundColor: primalycolor,
            activeIndex: _bottomNavIndex,
            splashColor: Colors.purple,
            notchAndCornersAnimation: borderRadiusAnimation,
            splashSpeedInMilliseconds: 300,
            notchSmoothness: NotchSmoothness.defaultEdge,
            gapLocation: GapLocation.center,
            onTap: (index) => setState(() => _bottomNavIndex = index),
            hideAnimationController: _hideBottomBarAnimationController,
            shadow: BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 12,
                spreadRadius: 0.5,
                color: Colors.white),
          ),
          Container(
            height: 49,
            width: double.infinity,
            decoration: BoxDecoration(
              color: primalycolor,
            ),
            child: InkWell(
              onTap: () {},
              child: ClipRRect(
                child: Image.network(
                  'https://img.lazcdn.com/us/domino/d8c5b16d554a044161e766c6a827b8e1.jpg_2200x2200q80.jpg_.webp',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
