
import 'package:rxform/src/blocs/managers/message_form_manager.dart';

class Overseer {
  Map<dynamic, dynamic> repository = {};

  Overseer(){
    register(MessageFormManager, MessageFormManager());
  }

  register(name, object){
    repository[name] = object;
  }

  fetch(name) => repository[name];
}