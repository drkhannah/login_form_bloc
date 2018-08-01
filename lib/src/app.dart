import 'package:flutter/material.dart';
import 'package:login_form_bloc/src/screens/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log me in',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
