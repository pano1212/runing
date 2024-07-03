import 'package:flutter/material.dart';

class Cardimg extends StatelessWidget {
  Cardimg({
    super.key,
  });

  final List img = [
    {
      'img1':
          'https://s3-alpha-sig.figma.com/img/933f/f856/bb0eb3e1b8d04dce0b234221a925acf2?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=VE7JlXlgBjAs6SiLTY7PSaz23lxMtEAaL02IThwjTpzWSfMW7xPm4WCdTY8smodd2ikhRokaVVxBIH~kQrR7wIHufZEhU8ycckZlnyYtNXmIUK0Ae2V60amyfjz50DF-OJUnv-FI0wKuhRuvFW2~mt20zkhE4z6u-07vqRFgVRycWcyznQ-89J1bnLTnvYOoizso6~KLnWrdDmdlR0Hd-wKmb2aqxyoxedUHauhoz2UKxDULXC~1EsAiJjyBRjX~qIiMamJBL~upsYtnM-BtNUku3xc4GcSqs--WiwId2Lnr396U2pCk4EkTF5JZBmeXNaDvOkxPAe74Hn2kZmEg-Q__',
      'text': 'Running'
    },
    {
      'img1':
          'https://s3-alpha-sig.figma.com/img/2f92/a418/9fd629cf1114171f492dc3b1b6a364a1?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=YKmYwkjgesVXosVYcw9WJJnd2dqE-TRNBONQaUH~JKOwiuAimFo-fbfJXRHuja~20BJ0eDKU-eZ~zvIsyUEnLgn7tlPiNiT6V~yiW5VYilMbKkAd1y4x~A7LB~46-~PRSrslJm9AvVWJV2K8nVH7aRfU0~Y1rCnTuYfd3zpqdK71WiLsH4335V9kMGkeaRZ6~gHOY4k5Zx2mr7NofGdjXnENGtKDe1AaxcMfK8CUJZwm53ckqBEynt~dvrzdnLyqb5Sv5pfDxN4FeqrC-r4Hlhfgj0jfrYA9-XWhd6jUsF1Inxe8sqUSGnVDQq7q7mDCSen--SbztsXOaEDMQTb2fw__',
      'text': 'Bicycle'
    },
    {
      'img1':
          'https://th.bing.com/th/id/OIP.8e7_vMpxthDjoHoGfdDTFwHaLG?rs=1&pid=ImgDetMain',
      'text': 'Jogging'
    },
    {
      'img1':
          'https://i.pinimg.com/originals/64/bf/d6/64bfd634984797b01a4ad96528d05e09.png',
      'text': 'Tracking car'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
          children: img.map((e) {
        return Container(
          height: 175,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(children: [
                Image.network(
                  e['img1'],
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            e['text'],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 40),
                          )),
                    ),
                  ],
                )
              ]),
            ),
          ),
        );
      }).toList()),
    );
  }
}
