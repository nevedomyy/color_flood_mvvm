import 'package:flutter/material.dart';
import 'view_model.dart';


class ViewModelProvider extends InheritedWidget{
  final ViewModel viewModel = ViewModel();

  ViewModelProvider({Key key, Widget child}):super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static ViewModel of(BuildContext context) => (context.inheritFromWidgetOfExactType(ViewModelProvider) as ViewModelProvider).viewModel;
}