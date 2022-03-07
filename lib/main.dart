import 'package:e_shopping/src/pages/category/category.dart';
import 'package:e_shopping/src/pages/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ValueNotifier<Brightness> brightness = new ValueNotifier(Brightness.light);

    return ValueListenableBuilder(
        valueListenable: brightness,
        builder: (context, value, child) {
          return MaterialApp(
              title: "Shopping",
              home: Splash(),
              routes: <String, WidgetBuilder>{
                "splash": (BuildContext context) => Splash()
              },
              debugShowCheckedModeBanner: false,
              theme: brightness.value == Brightness.light
                  ? ThemeData(
                      primaryColor: Color(0xFF11c411),
                      primaryColorDark: Color(0xFF0d930e),
                      floatingActionButtonTheme: FloatingActionButtonThemeData(
                          elevation: 0, foregroundColor: Colors.white),
                      brightness: Brightness.light,
                      accentColor: Color(0xFF0d930e),
                      buttonColor: Color(0xFFfb0907),
                      dividerColor: Colors.grey,
                      focusColor: Colors.grey,
                      hintColor: Colors.grey,
                    )
                  : ThemeData(
                      fontFamily: 'Poppins',
                      primaryColor: Color(0xFF11c411),
                      primaryColorDark: Color(0xFF0d930e),
                      brightness: Brightness.dark,
                      scaffoldBackgroundColor: Color(0xFFF9F9F9),
                      accentColor: Color(0xFF0d930e),
                      dividerColor: Colors.grey,
                      focusColor: Colors.grey,
                      hintColor: Colors.grey,
                      backgroundColor: Colors.white,
                    ));
        });
  }
}
