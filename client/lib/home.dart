import 'package:flutter/material.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login/login.dart';
import 'card_info.dart';

class Inple extends StatefulWidget {
  const Inple({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Inple> createState() => _InpleState();
}

class _InpleState extends State<Inple> {
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(widget.title,
            style: const TextStyle(
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
