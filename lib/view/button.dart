import 'package:flutter/material.dart';
import '../viewmodel/view_model.dart';
import '../viewmodel/provider.dart';
import 'colors.dart';


class AppButton extends StatefulWidget{
  final int _item;
  AppButton(this._item);
  @override
  _AppButtonState createState() => _AppButtonState(_item);
}

class _AppButtonState extends State<AppButton>{
  final AppColors _appColors = AppColors();
  final int _item;
  double _height = 80.0;
  ViewModel _viewModel;

  _AppButtonState(this._item);

  @override
  dispose(){
    super.dispose();
    _viewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = ViewModelProvider.of(context);
    return Expanded(
      child: GestureDetector(
        onTapDown: (details){
          _height = 60.0;
          _viewModel.change(_item);
          setState(() {});
        },
        onTapUp: (details){
          _height = 80.0;
          setState(() {});
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 80),
          curve: Curves.easeIn,
          height: _height,
          color: _appColors.color(_item)
        )
      ),
    );
  }
}