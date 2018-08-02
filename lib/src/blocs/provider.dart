import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  /// 1. Pass in a BuildContext of any Widget.
  /// 2. Make it look up through all it's parent Widget's BuildContexts
  ///   (The BuildContext Chain) until it finds a Widget of type Provider.
  /// 3. Return the instance of this Provider's [final bloc] property.
  static Bloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}
