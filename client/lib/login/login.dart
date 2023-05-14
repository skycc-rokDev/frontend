import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:client/home.dart';

import '../data/rest_client.dart';
import '../data/custom_log_interceptor.dart';

class InpleLogin extends StatefulWidget {
  const InpleLogin({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<InpleLogin> createState() => _InpleLoginState();
}

class _InpleLoginState extends State<InpleLogin> {
  // final String email;
  // final String name;
  final dio = Dio()..interceptors.add(CustomLogInterceptor());

  final prefs = SharedPreferences.getInstance();

  void setString(String accessToken) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', accessToken);
  }

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    final restClient = RestClient(dio);
    var userdata = {
      'email': data.name,
      'password': data.password,
    };
    FutureBuilder<Data?>(
      future: restClient.login(jsondata: userdata),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Data? authenticationResult = snapshot.data;
          if (authenticationResult != null) {
            setString(authenticationResult.token);
          }
        }
        return const CircularProgressIndicator();
      },
    );
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    final restClient = RestClient(dio);
    var userdata = {
      'email': data.name,
      'password': data.password,
    };
    FutureBuilder<Data?>(
      future: restClient.authentication(jsondata: userdata),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Data? authenticationResult = snapshot.data;
          if (authenticationResult != null) {
            setString(authenticationResult.token);
          }
        }
        return const CircularProgressIndicator();
      },
    );
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
        title: 'Inple',
        //logo: AssetImage('assets/images/ecorp.png'),
        onLogin: _authUser,
        onSignup: _signupUser,
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Inple(),
          ));
        },
        theme: LoginTheme(
          primaryColor: Color.fromARGB(255, 100, 187, 177),
          // space between login card and login buttons
        ),
        onRecoverPassword: (_) => Future(() => null));
  }
}
