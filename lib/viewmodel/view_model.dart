import '../model/model.dart';
import 'dart:async';


class ViewModel{
  final StreamController _controllerCounter = StreamController<int>();
  final StreamController _controller = StreamController<List<int>>();
  final Model _model = Model();
  int _counter = 0;
  
  Stream<int> get streamCounter => _controllerCounter.stream;
  Stream<List<int>> get stream => _controller.stream;

  init() async{
    _counter = 0;
    _controllerCounter.sink.add(_counter);
    _controller.sink.add(_model.init);
  }

  change(int color) async{
    _counter++;
    _controllerCounter.sink.add(_counter);
    _controller.sink.add(_model.change(color));
  }

  dispose(){
    _controllerCounter.close();
    _controller.close();
  } 
}