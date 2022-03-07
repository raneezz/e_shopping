import 'dart:async';
import 'package:e_shopping/src/pages/category/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Splash extends StatefulWidget {
  const Splash() : super();

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: _con.scaffoldKey,
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/img/logo.png',
                width: 200,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void init() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement( context, MaterialPageRoute(builder: (context) => Category()));
    });
  }
}
