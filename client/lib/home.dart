/*
Name: Zotov Vladimir
Date: 18/06/22
Purpose: Defines the package: sliding_up_panel2
Copyright: © 2022, Zotov Vladimir. All rights reserved.
Licensing: More information can be found here: https://github.com/Zotov-VD/sliding_up_panel/blob/master/LICENSE

This product includes software developed by Akshath Jain (https://akshathjain.com)
*/

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';
import 'package:nfc_manager/nfc_manager.dart';

import 'login/login.dart';
import 'card_info.dart';

class Inple extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Inple> {
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 95.0;
  late final ScrollController scrollController;
  late final PanelController panelController;

  @override
  void initState() {
    scrollController = ScrollController();
    panelController = PanelController();
    super.initState();

    _fabHeight = _initFabHeight;
  }

  Widget My_Card(String image, String cardId, double screenw) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => cardinfo(cardId: cardId)),
            );
          },
          child: Column(
            children: <Widget>[
              Container(
                child: Image.asset("assets/image/$image", width: screenw * 0.9),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenw = MediaQuery.of(context).size.width;
    final screenh = MediaQuery.of(context).size.height;
    final List<Widget> fancyCards = <Widget>[
      My_Card("1f.png", "1", screenw),
      My_Card("2f.png", "2", screenw),
      My_Card("3f.png", "3", screenw),
      My_Card("4f.png", "4", screenw),
    ];
    _panelHeightOpen = MediaQuery.of(context).size.height * .80;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text("Inple",
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
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => InpleLogin(title: "Inple"),
            ));
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
            snapPoint: .5,
            disableDraggableOnScrolling: false,
            footer: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: IgnoreDraggableWidget(
                  child: Container(
                    color: Colors.white,
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 40.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "My business card",
                              style: TextStyle(
                                  color: Colors.teal,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
            header: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ForceDraggableWidget(
                    child: Container(
                      width: 100,
                      height: 40,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 12.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 30,
                                height: 7,
                                decoration: const BoxDecoration(
                                    color: Colors.teal,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            body: StackedCardCarousel(
              items: fancyCards,
              initialOffset: screenh * 0.2,
              pageController: PageController(initialPage: 9),
            ),
            controller: panelController,
            scrollController: scrollController,
            panelBuilder: () => _panel(),
            color: Color.fromARGB(255, 206, 231, 228),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(35.0),
                topRight: Radius.circular(35.0)),
            onPanelSlide: (double pos) => setState(() {
              _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                  _initFabHeight;
            }),
          ),
        ],
      ),
    );
  }

  Widget content(bool connection) {
    if (connection) {
      return const SizedBox(
        height: 50.0,
      );
    } else {
      return Container(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          child: Column(children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/image/2f.png",
              width: 250,
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: <Widget>[
                Icon(
                  Icons.face,
                  size: 40.0,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Name',
                      style: TextStyle(fontSize: 14.0, letterSpacing: 1.0),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Lee DongJun',
                      style: TextStyle(
                          fontSize: 16.0,
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
            const Row(
              children: <Widget>[
                Icon(
                  Icons.phone,
                  size: 40.0,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Phone Number',
                      style: TextStyle(fontSize: 14.0, letterSpacing: 1.0),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '010 - 1234 - 5678',
                      style: TextStyle(
                          fontSize: 16.0,
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
            const Row(
              children: <Widget>[
                Icon(
                  Icons.alternate_email,
                  size: 40.0,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'E-mail',
                      style: TextStyle(fontSize: 14.0, letterSpacing: 1.0),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'donglee@gmail.com',
                      style: TextStyle(
                          fontSize: 16.0,
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
            const Row(
              children: <Widget>[
                Icon(
                  Icons.business,
                  size: 40.0,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Company',
                      style: TextStyle(fontSize: 14.0, letterSpacing: 1.0),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Korea Univ.',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ]));
    }
  }

  Widget _panel() {
    bool connection = false;
    ValueNotifier<dynamic> result = ValueNotifier(null);

    bool _tagRead() {
      NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        result.value = tag.data;
        NfcManager.instance.stopSession();
      });
      return true;
    }

    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          physics: PanelScrollPhysics(controller: panelController),
          controller: scrollController,
          children: <Widget>[
            const SizedBox(
              height: 40.0,
            ),
            content(connection),
            const SizedBox(
              height: 20.0,
            ),
            Container(
                alignment: Alignment.center,
                child: AnimatedButton(
                  animatedOn: AnimatedOn.onTap,
                  onPress: () {
                    FutureBuilder<bool>(
                        future: NfcManager.instance.isAvailable(),
                        builder: (context, ss) =>
                            (ss.data != true && _tagRead())
                                ? AlertDialog(
                                    title: Text('NFC'),
                                    content: Text('NFC connected.'),
                                    actions: <Widget>[
                                        ElevatedButton(
                                          child: Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ])
                                : Container());
                  },
                  onChanges: (change) {},
                  height: 40,
                  width: 160,
                  text: 'connect',
                  isReverse: true,
                  selectedTextColor: Colors.teal,
                  transitionType: TransitionType.LEFT_TOP_ROUNDER,
                  backgroundColor: const Color.fromARGB(255, 100, 187, 177),
                  selectedBackgroundColor: Colors.white,
                  borderColor: Colors.white,
                  borderWidth: 0,
                  borderRadius: 20,
                )),
            const SizedBox(
              height: 24,
            ),
          ],
        ));
  }
}
