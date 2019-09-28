import 'package:flutter/material.dart';
import '../viewmodel/view_model.dart';
import '../viewmodel/provider.dart';
import 'button.dart';
import 'colors.dart';


class ColorFlood extends StatefulWidget {
  @override
  _ColorFloodState createState() => _ColorFloodState();
}

class _ColorFloodState extends State<ColorFlood> {
  final AppColors _appColors = AppColors();
  ViewModel _viewModel;

  @override
  dispose(){
    super.dispose();
    _viewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = ViewModelProvider.of(context);
    _viewModel.init();
    final size = MediaQuery.of(context).size.width/12;
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            StreamBuilder(
              stream: _viewModel.stream,
              initialData: List.generate(144, (_) => 0),
              builder: (context, snapshot){
                return Wrap(
                  children: List.generate(144, (i) => SizedBox.fromSize(
                    size: Size.square(size),
                    child: AnimatedContainer(
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 300),
                      color: _appColors.color(snapshot?.data[i] ?? 0)
                    )
                  ))
                );
              },
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _viewModel.init(),
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'new',
                        style: Theme.of(context).textTheme.body1,
                      ),
                    )
                  ),
                  StreamBuilder(
                    stream: _viewModel.streamCounter,
                    initialData: 0,
                    builder: (context, snapshot){
                      return Text(
                        'score:${snapshot?.data ?? 0}',
                        style: Theme.of(context).textTheme.body1,
                      );
                    },
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(6, (i) => AppButton(i))
            )
          ],
        ),
      ),
    );
  }
}