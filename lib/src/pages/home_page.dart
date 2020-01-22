import 'package:flutter/material.dart';
import 'package:rxform/src/blocs/managers/message_form_manager.dart';
import 'package:rxform/src/blocs/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MessageFormManager manager = Provider.of(context).fetch(MessageFormManager);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Compose new message',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            child: Column(
              children: <Widget>[
                StreamBuilder<String>(
                  stream: manager.email$,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 30.0),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: manager.inEmail.add,
                        decoration: InputDecoration(
                            labelText: 'TO',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            errorText: snapshot.error),
                      ),
                    );
                  },
                ),
                StreamBuilder<String>(
                  stream: manager.subject$,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 30.0),
                      child: TextField(
                        onChanged: manager.inSubject.add,
                        decoration: InputDecoration(
                            labelText: 'SUBJECT',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            errorText: snapshot.hasError ? snapshot.error : null),
                      ),
                    );
                  },
                ),
                StreamBuilder<String>(
                  stream: manager.body$,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 30.0),
                      child: TextField(
                        onChanged: manager.inBody.add,
                        maxLines: 5,
                        decoration: InputDecoration(
                            labelText: 'BODY',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            errorText: snapshot.hasError ? snapshot.error : null),
                      ),
                    );
                  },
                ),
                StreamBuilder<Object>(
                  stream: manager.isFormValid$,
                  builder: (context, snapshot) {
                    return Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: RaisedButton(
                        onPressed: (){
                          if(snapshot.hasData) manager.submit();
                        },
                        child: Center(
                          child: Text('Send'),
                        ),
                      ),
                    );
                  }
                )
              ],
            ),
          ),
        ));
  }
}
