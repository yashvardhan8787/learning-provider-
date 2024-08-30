import "package:flutter/foundation.dart";

class FavouriteProvider with ChangeNotifier{
  List<int> _selectedItem =[];

  List<int> get selectedItem => _selectedItem;

  void addItem(int item){
    if(_selectedItem.contains(item)){
      _selectedItem.remove(item);
    }else{
      _selectedItem.add(item);
    }
    notifyListeners();
  }
}