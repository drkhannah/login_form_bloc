import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'validators.dart';

// you could alternatively use: class Bloc extends Validators {}
class Bloc extends Object with Validators {
  // Private BehaviorSubject
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Add Data to Streams
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  /// Combine the email and password streams, similar to a Gate
  /// Creates a new stream that emits [true] if both email and password streams are valid
  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (email, password) => true);

  // Get Data from Streams
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  // handle form data submission
  submit() {
    final submitedEmail = _emailController.value;
    final submitedPassword = _passwordController.value;
    print('Email: $submitedEmail Password: $submitedPassword');
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
