import 'package:flutter/material.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

import 'login/login.dart';
import 'card_info.dart';

class Inple extends StatefulWidget {
  const Inple({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Inple> createState() => _InpleState();
}

class _InpleState extends State<Inple> {
  @override
  Widget build(BuildContext context) {
    final screenw = MediaQuery.of(context).size.width;
    final screenh = MediaQuery.of(context).size.height;
    final List<Widget> fancyCards = <Widget>[
      Card(
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Image.asset(
                  "assets/image/1f.png",
                  width: screenw * 0.9,
                ),
              ),
            ],
          ),
        ),
      ),
      Card(
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => cardinfo()),
              );
            },
            child: Column(
              children: <Widget>[
                Container(
                  child:
                      Image.asset("assets/image/2f.png", width: screenw * 0.9),
                ),
              ],
            ),
          ),
        ),
      ),
      Card(
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Image.asset("assets/image/1f.png", width: screenw * 0.9),
              ),
            ],
          ),
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(widget.title,
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
              builder: (context) => InpleLogin(title: widget.title),
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
      body: StackedCardCarousel(
        items: fancyCards,
        initialOffset: screenh * 0.2,
        pageController: PageController(initialPage: 9),
      ), //const Center(child: Text('Hello World')),
    );
  }
}
