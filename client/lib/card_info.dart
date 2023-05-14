import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';

import 'login/login.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'plus_memo.dart';

class cardinfo extends StatelessWidget {
  cardinfo({Key? key, required this.cardId}) : super(key: key);
  final String cardId;
  final con = GestureFlipCardController();
  @override
  Widget build(BuildContext context) {
    final screenw = MediaQuery.of(context).size.width;
    final screenh = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 206, 231, 228),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 206, 231, 228),
        title: const Text('Inple',
            style: TextStyle(
                color: Color.fromARGB(255, 100, 187, 177),
                fontSize: 40,
                fontWeight: FontWeight.w900)),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 100, 187, 177),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            GestureFlipCard(
              animationDuration: const Duration(milliseconds: 300),
              axis: FlipAxis.horizontal,
              controller:
                  con, // used to ccontrol the Gesture flip programmatically
              enableController:
                  false, // if [True] if you need flip the card using programmatically
              frontWidget: Center(
                child: Container(
                  width: screenw * 0.8,
                  height: 200,
                  child: Image.asset(
                    "assets/image/${cardId}f.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              backWidget: Center(
                child: Container(
                  width: screenw * 0.8,
                  height: 200,
                  child: Image.asset(
                    "assets/image/${cardId}b.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenh * 0.03,
            ),
            Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                width: screenw,
                height: screenh * 0.8,
                child: Column(children: <Widget>[
                  SizedBox(
                    height: screenh * 0.05,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(width: screenw * 0.08),
                      const Icon(
                        Icons.face,
                        size: 55.0,
                      ),
                      SizedBox(width: screenw * 0.05),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Name',
                            style:
                                TextStyle(fontSize: 16.0, letterSpacing: 1.0),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Lee DongJun',
                            style: TextStyle(
                                fontSize: 19.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(width: screenw * 0.08),
                      const Icon(
                        Icons.phone,
                        size: 55.0,
                      ),
                      SizedBox(width: screenw * 0.05),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Phone Number',
                            style:
                                TextStyle(fontSize: 16.0, letterSpacing: 1.0),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '010 - 1234 - 5678',
                            style: TextStyle(
                                fontSize: 19.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(width: screenw * 0.08),
                      const Icon(
                        Icons.alternate_email,
                        size: 55.0,
                      ),
                      SizedBox(width: screenw * 0.05),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'E-mail',
                            style:
                                TextStyle(fontSize: 16.0, letterSpacing: 1.0),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'donglee@gmail.com',
                            style: TextStyle(
                                fontSize: 19.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(width: screenw * 0.08),
                      const Icon(
                        Icons.business,
                        size: 55.0,
                      ),
                      SizedBox(width: screenw * 0.05),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Company',
                            style:
                                TextStyle(fontSize: 16.0, letterSpacing: 1.0),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Korea Univ.',
                            style: TextStyle(
                                fontSize: 19.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenh * 0.04,
                  ),
                  AnimatedButton(
                    animatedOn: AnimatedOn.onTap,
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => memo()),
                      );
                    },
                    onChanges: (change) {},
                    height: 50,
                    width: 160,
                    text: 'more',
                    isReverse: true,
                    selectedTextColor: Colors.black,
                    transitionType: TransitionType.LEFT_TOP_ROUNDER,
                    backgroundColor: Color.fromARGB(255, 100, 187, 177),
                    selectedBackgroundColor: Colors.white,
                    borderColor: Colors.white,
                    borderWidth: 1,
                    borderRadius: 50,
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}
