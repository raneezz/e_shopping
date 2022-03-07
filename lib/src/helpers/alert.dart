import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Author: Ranees kalathingal

class Alert{

  static toast(String msg) {

    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0
    );
  }
  static Future<bool> alert(BuildContext context,String title,String msg) async
  {
    var clicked=false;
    await showDialog<bool>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title:  Text(title),
          content:  Text(msg),
          actions: <Widget>[
            TextButton(
              onPressed:() {
                Navigator.of(context).pop();
                clicked= false;
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed:()
              {
                Navigator.of(context).pop();
                clicked= true;
              },
              child: const Text('Yes'),
            ),
          ],
        ),

      );
  return clicked;
    }

  static Future<bool> alert_simple(BuildContext context,String title,String msg) async
  {
    var clicked=false;

    await showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title:  Text(title),
        content:  Text(msg),
        actions: <Widget>[

          TextButton(
            onPressed:()
            {
              Navigator.of(context).pop();
              clicked= true;
            },
            child: const Text('OK'),
          ),
        ],
      ),

    );
    return clicked;
  }

}