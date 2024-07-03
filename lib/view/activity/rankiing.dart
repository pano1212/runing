import 'package:flutter/material.dart';
import 'package:runningapp/view/components/color.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    List item = [
      {
        'number': '1',
        'image': 'assets/images/user.png',
        'name': 'alis',
        'distance': '5.55km'
      },
      {
        'number': '2',
        'image': 'assets/images/user.png',
        'name': 'alis',
        'distance': '5.55km'
      },
      {
        'number': '3',
        'image': 'assets/images/user.png',
        'name': 'alis',
        'distance': '5.55km'
      },
      {
        'number': '4',
        'image': 'assets/images/user.png',
        'name': 'alis',
        'distance': '5.55km'
      },
      {
        'number': '5',
        'image': 'assets/images/user.png',
        'name': 'alis',
        'distance': '5.55km'
      },
      {
        'number': '6',
        'image': 'assets/images/user.png',
        'name': 'alis',
        'distance': '5.55km'
      },
      {
        'number': '7',
        'image': 'assets/images/user.png',
        'name': 'alis',
        'distance': '5.55km'
      },
      {
        'number': '8',
        'image': 'assets/images/user.png',
        'name': 'alis',
        'distance': '5.55km'
      },
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primalycolor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                  color: primalycolor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/images/user.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            'john',
                            style: TextStyle(color: textcolor),
                          ),
                        ),
                        Container(
                          height: 83,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10)),
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.grey,
                                size: 30,
                              ),
                              Text(
                                '5.5Km',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/images/user.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            'john',
                            style: TextStyle(color: textcolor),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10)),
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 35,
                              ),
                              Text(
                                '5.5Km',
                                style: TextStyle(
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/images/user.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            'john',
                            style: TextStyle(color: textcolor),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10)),
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 195, 74, 30),
                                size: 25,
                              ),
                              Text(
                                '5.5Km',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 195, 74, 30),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 480,
              child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200]),
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            item[index]['number'],
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.pinkAccent,
                            child: Image.asset(
                              item[index]['image'],
                              height: 30,
                            ),
                          ),
                          Text(item[index]['name'],
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              )),
                          Text(
                            item[index]['distance'],
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
