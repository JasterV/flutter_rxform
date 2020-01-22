import 'package:flutter/material.dart';

class RxTextField extends StatelessWidget {
  final Stream<String> suscribe;
  final Function(String) dispatch;
  final int maxLines;
  final String labelText;

  RxTextField(
      {@required this.suscribe, @required this.dispatch, this.maxLines = 1, this.labelText, key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: suscribe,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            maxLines: maxLines,
            onChanged: dispatch,
            decoration: InputDecoration(
                labelText: labelText,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                errorText: snapshot.error),
          ),
        );
      },
    );
  }
}
