import 'package:flutter/material.dart';
import 'package:carros_app/pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: LoginPage(),

    );
  }


}
