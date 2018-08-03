import 'dart:async';
import 'validators.dart';

// you could alternatively use: class Bloc extends Validators {}
class Bloc extends Object with Validators {
  // Private StreamControllers
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  // Add Data to Streams
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Get Data from Streams
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

final bloc = Bloc();
