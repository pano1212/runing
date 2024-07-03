import 'package:flutter/material.dart';
import 'package:runningapp/view/components/color.dart';
import 'package:runningapp/view/profile/chart.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 320,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 29, 208, 228),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              children: [
                SizedBox(
                  height: 45,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'PROFILE',
                        style: TextStyle(
                            color: textcolor, fontWeight: FontWeight.w600),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.settings, color: Colors.white),
                      )
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 55,
                  backgroundColor: textcolor,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.amber,
                    backgroundImage: AssetImage('assets/images/user.png'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 170,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'usernameeee',
                            style: TextStyle(
                              fontSize: 20,
                              color: textcolor,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Female',
                      style: TextStyle(
                          color: textcolor, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '60KG',
                      style: TextStyle(
                          color: textcolor, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '170cm',
                      style: TextStyle(
                          color: textcolor, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
            child: Container(
              height: 160,
              decoration: BoxDecoration(
                border: Border.all(width: 0.2, color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'My progress',
                          style: TextStyle(color: primalycolor),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primalycolor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Total Distance',
                              style: TextStyle(color: textcolor),
                            ),
                            Text(
                              '5.50 ',
                              style: TextStyle(color: textcolor, fontSize: 19),
                            ),
                            Text(
                              'km',
                              style: TextStyle(color: textcolor),
                            ),
                            Icon(
                              Icons.location_on,
                              color: textcolor,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primalycolor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Total Duration',
                              style: TextStyle(
                                color: textcolor,
                              ),
                            ),
                            Text(
                              '5',
                              style: TextStyle(color: textcolor, fontSize: 19),
                            ),
                            Text(
                              'h',
                              style: TextStyle(color: textcolor),
                            ),
                            Icon(
                              Icons.timer,
                              color: textcolor,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primalycolor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Total Calorie',
                              style: TextStyle(color: textcolor),
                            ),
                            Text(
                              '500',
                              style: TextStyle(color: textcolor, fontSize: 19),
                            ),
                            Text(
                              'Cal',
                              style: TextStyle(color: textcolor),
                            ),
                            Image.asset(
                              'assets/icon/mong.png',
                              width: 30,
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(width: 0.2, color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Distance',
                          style: TextStyle(color: primalycolor),
                        ),
                        Text(
                          'Duration',
                          style: TextStyle(color: primalycolor),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    child: ChartPage(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Distance',
                          style: TextStyle(color: primalycolor),
                        ),
                        Text(
                          'Duration',
                          style: TextStyle(color: primalycolor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 200,
          )
        ],
      ),
    ));
  }
}
