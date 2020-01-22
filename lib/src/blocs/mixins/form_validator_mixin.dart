import 'dart:async';

mixin FormValidatorMixin {
  StreamTransformer<String, String> emailValidator = StreamTransformer.fromHandlers(
    handleData: (value, sink){
      if(value.contains('@'))
        sink.add(value);
      else  
        sink.addError('Invalid email');
    }
  );

  StreamTransformer<String, String> subjectValidator = StreamTransformer.fromHandlers(
    handleData: (value, sink){
      if(value.length <= 5)
        sink.addError('Subject too short');
      else  
        sink.add(value);
    }
  );

  StreamTransformer<String, String> bodyValidator = StreamTransformer.fromHandlers(
    handleData: (value, sink){
      if(value.length <= 10)
        sink.addError('Body too short');
      else  
        sink.add(value);
    }
  );  
}

