import 'dart:ffi';

import 'package:flutter/material.dart';

import 'login/login.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class memo extends StatelessWidget {
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
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            SizedBox(
              height: screenh * 0.04,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(60))),
              width: screenw,
              height: screenh * 0.82,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(45.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Date',
                          style: TextStyle(fontSize: 16.0, letterSpacing: 1.0),
                        ),
                        Text(
                          '2023 / 05 / 13',
                          style: TextStyle(
                              fontSize: 20.0,
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          'SKYCC 해커톤을 통해 만남. \n고려대 재학 중\n개발 및 보안 관련 지식 풍부',
                          style: TextStyle(
                            fontSize: 18.0,
                            height: 1.5,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
