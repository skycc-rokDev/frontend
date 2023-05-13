import 'package:flutter/material.dart';

import 'login/login.dart';
import 'home.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  bool hasToken = true;
  // () async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String accessToken = prefs.getString('accessToken')!;
  //   if (accessToken != null) {
  //     hasToken = true;
  //   }
  // };
  runApp(MaterialApp(
      title: 'Inple',
      theme: ThemeData(
        // color #64BBB1
        primarySwatch: Colors.teal,
      ),
      home: hasToken
          ? Inple(
              title: 'Inple',
            )
          : InpleLogin(
              title: 'Inple',
            )));
  // FlutterNativeSplash.remove();
}
