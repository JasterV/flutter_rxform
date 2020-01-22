import 'package:flutter/material.dart';
import 'package:rxform/src/pages/home_page.dart';

import 'src/blocs/overseer.dart';
import 'src/blocs/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      data: Overseer(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Message Composer',
        theme: ThemeData.dark(),
        home: HomePage(),
      ),
    );
  }
}
