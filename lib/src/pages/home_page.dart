import 'package:flutter/material.dart';
import 'package:rxform/src/blocs/managers/message_form_manager.dart';
import 'package:rxform/src/blocs/provider.dart';
import 'package:rxform/src/widgets/rx_text_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MessageFormManager manager =
        Provider.of(context).fetch(MessageFormManager);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Compose new message',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RxTextField(
                suscribe: manager.email$,
                dispatch: manager.setEmail,
                labelText: "To",
              ),
              RxTextField(
                suscribe: manager.subject$,
                dispatch: manager.setSubject,
                labelText: "Subject",
              ),
              RxTextField(
                suscribe: manager.body$,
                dispatch: manager.setBody,
                maxLines: 8,
                labelText: "Body",
              ),
              StreamBuilder<Object>(
                  stream: manager.isFormValid$,
                  builder: (context, snapshot) {
                    return Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: RaisedButton(
                        onPressed: () {
                          if (snapshot.hasData) manager.submit();
                        },
                        child: Center(
                          child: Text('Send'),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ));
  }
}
