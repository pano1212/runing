import 'package:flutter/material.dart';
import 'package:runningapp/view/components/color.dart';

class Hisdetail extends StatelessWidget {
  const Hisdetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primalycolor,
        elevation: 0,
        title: Text('Running'),
      ),
      body: Column(
        children: [
          Container(
            height: 190,
            width: double.infinity,
            decoration: BoxDecoration(
                color: primalycolor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Image.asset(
                'assets/images/map.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
