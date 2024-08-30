import "package:flutter/foundation.dart";

class CountProvider with ChangeNotifier{

   int _count = 0;
   int get count => _count ;

   setCount(){
      _count++;
      notifyListeners();
   }
}