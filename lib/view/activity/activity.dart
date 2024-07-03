import 'package:flutter/material.dart';
import 'package:runningapp/view/components/color.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List img = [
      {
        'img1':
            'https://s3-alpha-sig.figma.com/img/9a00/1e59/8db63244319ad21fba696eb7061b4706?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hYjm56IzBtFCYNV1rQp9cXy~bff7u96~P0sdhzV5du-JOEu5HTyUtvlm-mM43~mIMUQfA5aWexQue7ILLv6aAUhZY9UgQ191~FzCYoDC0xM2vuW9SIonO8Ymlv-b1tPFKq0wKGU8R0bVURFz4cNzW-40u7mm9RmLVFt44BRFyGRhMgvAnuxYjuoWjxtap1VByhDzXJuH13JVoShshX-6PNNn3ZFpOL8O2YcVa7L6E2j0F6DnY8uSXHKNxdsum7S7p~pINiTFtv9EuMpiaO4DMqLeUoLfDcIVNyaDwjNlr4n8swGWyOPNN~~cb4M9OCC59WAVO0BTfF6bNCdOlqgH8g__',
        'text': 'Marathon'
      },
      {
        'img1':
            'https://s3-alpha-sig.figma.com/img/8dc5/aa05/60d3d4061e777019c65b8e305501ec06?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=DC1bgrj4eQsl9Q9etLQhQwB0I0w6l5zQZTuRvz1YRvgCYjfyGIR-1nPZZfvlLnZbupTTQ6zn--zy78TX7EFSerKLlsD-xXu5bqKDoKmiYwq9PlztY41T0e~q3ZHUkezWt9y7hU1~KwS7dRVwus23dOOhBV7y9YV0CVbfwq44HRxGWyui38w8M04dxk1urcm6dmwhz9fMoo0KNjk8kREJW8T2~DV-m2Le~fjF-Z0N0uf1t2CLEFCtY7-7LIs1FIxvyqM3npE4oW-OrL-nVP1hIJyKYOODDaV~Yet1cHzI3PhSRgea7VmVHMQZU7iho-sfv9-IR1g4tUcnEcUB15qMgg__',
        'text': 'Running'
      },
      {
        'img1':
            'https://s3-alpha-sig.figma.com/img/84ac/9cad/82d316747ac55dde90c88c0e6c0a3cce?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=NpuP4VVNIifs74UDcIz-z5BKOINy8GVRnZRg6R1001O4Ey3BPiMq17jhbmJeFyQ~Be0HbQCWvUpAcU9SGc~ozfs3olGtAd201BXMTbr7B0yAP3P0dc~NIYBJUlW5uINjDBKp6JT3pQ-ZOh-ozibnHcWGOKvN4Yf8iiqmfvjmQG2xXFdDlV25DZZQp-2NL2fokbb8rF9gLr39VEBvkQxvbY9lBO0qNxHfb0akqEK9ZEo59mpWpFt9n0ldD7IebafnCmj50RZAfjhGYxL9ZXQ2VA0BDiUrSD2inXHbNQkCOiMQKtfMKg0GWmLUgkiLV92Ja4b1Pw-UdW8JS9Os8E3GGA__',
        'text': 'Cadio'
      },
    ];
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 220,
            decoration: BoxDecoration(
                color: primalycolor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/CreatePage');
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Create',
                            style: TextStyle(color: Colors.lightBlue),
                          ),
                          Image.asset(
                            'assets/icon/plus.png',
                            width: 20,
                            color: primalycolor,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create Your Activity',
                          style: TextStyle(fontSize: 17, color: textcolor),
                        ),
                        Text(
                          'For your convenience andgood health',
                          style: TextStyle(color: textcolor),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'template',
                  style: TextStyle(color: primalycolor),
                )
              ],
            ),
          ),
          Container(
            height: 650,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(0),
              itemCount: img.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    print('sus');
                  },
                  child: Container(
                    height: 175,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(children: [
                          Image.network(
                            img[index]['img1'],
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 13, top: 10),
                                  child: Text(
                                    img[index]['text'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
