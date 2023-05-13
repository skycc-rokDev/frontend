import 'package:flutter/material.dart';

import 'login/login.dart';

class Inple extends StatefulWidget {
  const Inple({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Inple> createState() => _InpleState();
}

class _InpleState extends State<Inple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
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
      body: const Center(child: Text('Hello World')),
    );
  }
}
