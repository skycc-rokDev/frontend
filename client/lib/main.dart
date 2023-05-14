import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login/login.dart';
import 'home.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  bool hasToken = false;
  () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    if (token != null) {
      hasToken = true;
    }
  };
  runApp(MaterialApp(
      title: 'Inple',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: hasToken
          ? Inple()
          : InpleLogin(
              title: 'Inple',
            )));

  // FlutterNativeSplash.remove();
}
