import 'package:flutter/material.dart';
import 'package:rxform/src/blocs/overseer.dart';

class Provider extends InheritedWidget {
  final Overseer data;

  Provider({Key key, Widget child, @required this.data}) : super(key: key, child: child);

  static Overseer of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().data;
  }

  @override
  bool updateShouldNotify(Provider oldWidget) => true;
}