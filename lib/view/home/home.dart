import 'package:flutter/material.dart';
import 'package:animated_pie_chart/animated_pie_chart.dart';
import 'package:runningapp/view/components/color.dart';
import 'package:runningapp/view/home/widget/cardhome.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 310,
              decoration: BoxDecoration(
                  color: primalycolor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Column(
                children: [
                  SizedBox(
                    height: 63,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: PieChart(
                                data: [
                                  PieChartData(primalycolor, 100),
                                ],
                                radius: 70,
                                strokeWidth: 10,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('10000'),
                                    Text('Steps'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 130,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: primalycolor,
                                    ),
                                    Text('280KM')
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 15,
                                        height: 5,
                                        color: primalycolor),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('280KM')
                                  ],
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 15,
                                        height: 5,
                                        color: Color(0xffFCA5A5),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '28.8888s222KM',
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/icon/mong.png',
                                  width: 60,
                                ),
                                Container(
                                  width: 110,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('calories'),
                                      Text(
                                        '500 cal',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: primalycolor,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ],
                                  ),
                                )
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
                            height: 80,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/icon/heart.png',
                                  width: 50,
                                ),
                                Container(
                                  width: 110,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('Heart'),
                                      Text(
                                        '1000/Min',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: primalycolor,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Cardimg(),
            SizedBox(
              height: 35,
            )
          ],
        ),
      ),
    );
  }
}
