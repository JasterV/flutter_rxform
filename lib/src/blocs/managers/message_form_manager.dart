import 'package:rxdart/rxdart.dart';
import 'package:rxform/src/blocs/mixins/form_validator_mixin.dart';

class MessageFormManager with FormValidatorMixin{
  final _email = BehaviorSubject<String>();
  Stream<String> get email$ => _email.stream.transform(emailValidator);
  Sink<String> get inEmail => _email.sink;

  final _subject = BehaviorSubject<String>();
  Stream<String> get subject$ => _subject.stream.transform(subjectValidator);
  Sink<String> get inSubject => _subject.sink;

  final _body = BehaviorSubject<String>();
  Stream<String> get body$ => _body.stream.transform(bodyValidator);
  Sink<String> get inBody => _body.sink;

  Stream<bool> get isFormValid$ => CombineLatestStream([_email, _subject, _body], (values) => true);

  void submit(){
    print(_email.value);
    print(_subject.value);
    print(_body.value);
  }



  void dispose(){
    _email.close();
    _subject.close();
    _body.close();
  }
}