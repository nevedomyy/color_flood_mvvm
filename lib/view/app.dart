import 'package:flutter/material.dart';
import '../viewmodel/provider.dart';
import 'color_flood.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      child: MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(
            body1: TextStyle(color: Colors.black54, fontSize: 40, fontFamily: 'ShareTechMono-Regular')
          )
        ),
        home: ColorFlood(),
      ),
    );
  }
}