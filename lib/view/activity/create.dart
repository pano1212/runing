import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:runningapp/view/components/color.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Container(
                      height: 140,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                              height: 70,
                              width: double.infinity,
                              child: InkWell(
                                onTap: () {
                                  print('object');
                                },
                                child: DottedBorder(
                                  color: Colors.grey,
                                  strokeWidth: 1,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.photo_library,
                                              color: Colors.grey),
                                        ],
                                      ),
                                      Center(
                                        child: Text(
                                          'Please add photos of your activities.',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 480,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(179, 255, 255, 255)),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        '*Activity Name',
                        style: TextStyle(color: primalycolor),
                      ),
                      subtitle: TextFormField(
                        decoration: InputDecoration(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(
                        '*Activity list',
                        style: TextStyle(color: Colors.grey),
                      ),
                      subtitle: TextFormField(
                        decoration: InputDecoration(),
                      ),
                      trailing: DropdownButton(
                        borderRadius: BorderRadius.circular(10),
                        padding: EdgeInsets.only(top: 15),
                        iconEnabledColor: primalycolor,
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              '20MIn',
                              style: TextStyle(color: primalycolor),
                            ),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                    ListTile(
                      subtitle: TextFormField(
                        decoration: InputDecoration(),
                      ),
                      trailing: DropdownButton(
                        borderRadius: BorderRadius.circular(10),
                        iconEnabledColor: primalycolor,
                        padding: EdgeInsets.only(top: 15),
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              '20MIn',
                              style: TextStyle(color: primalycolor),
                            ),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                    ListTile(
                      subtitle: TextFormField(
                        decoration: InputDecoration(),
                      ),
                      trailing: DropdownButton(
                        borderRadius: BorderRadius.circular(15),
                        iconEnabledColor: primalycolor,
                        padding: EdgeInsets.only(top: 15),
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              '20MIn',
                              style: TextStyle(color: primalycolor),
                            ),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                    ListTile(
                      subtitle: TextFormField(
                        decoration: InputDecoration(),
                      ),
                      trailing: DropdownButton(
                        padding: EdgeInsets.only(top: 15),
                        borderRadius: BorderRadius.circular(10),
                        iconEnabledColor: primalycolor,
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              '20MIn',
                              style: TextStyle(color: primalycolor),
                            ),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          '+Add',
                          style: TextStyle(color: primalycolor, fontSize: 17),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/RankingPage');
                        },
                        child: CircleAvatar(
                            radius: 30,
                            backgroundColor: primalycolor,
                            child: Text(
                              'OK',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
