import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import 'package:client/home.dart';

class InpleLogin extends StatefulWidget {
  const InpleLogin({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<InpleLogin> createState() => _InpleLoginState();
}

class _InpleLoginState extends State<InpleLogin> {
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
        title: 'Inple',
        //logo: AssetImage('assets/images/ecorp.png'),
        onLogin: (_) => Future(() => null),
        onSignup: (_) => Future(() => null),
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Inple(title: widget.title),
          ));
        },
        theme: LoginTheme(
          primaryColor: Color.fromARGB(255, 100, 187, 177),
          // space between login card and login buttons
        ),
        onRecoverPassword: (_) => Future(() => null));
  }
}
