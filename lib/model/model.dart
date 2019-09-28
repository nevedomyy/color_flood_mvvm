import 'dart:math';


class Model{
  Set<int> _accept;
  List<int> _list;

  List<int> get init {
    _accept = Set();
    _accept.add(0);
    _list = List.generate(144, (i) => Random().nextInt(6));
    return _list;
  }

  List<int> change(int color){
    List<int> tmpList = List();
    _accept.forEach((i) => _list[i] = color);
    _accept.forEach((i){
      if(i > 11){
        if(_list[i-12] == color) tmpList.add(i-12);
      }
      if(i < 132){
        if(_list[i+12] == color) tmpList.add(i+12);
      }
      if(i%11 != 0 || i == 0){
        if(_list[i+1] == color) tmpList.add(i+1);
      }
      if(i%12 != 0){
        if(_list[i-1] == color) tmpList.add(i-1);
      }
    });
    _accept.addAll(tmpList);
    _list = List.from(_list);
    return _list;
  }
}