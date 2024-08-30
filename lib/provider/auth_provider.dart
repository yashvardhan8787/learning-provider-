import 'package:flutter/material.dart';
import "package:http/http.dart" ;

class AuthProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  void setloading (bool value){
    _loading = value ;
    notifyListeners();
  }

  bool _isLoggedIn =false;
  bool get isLoggedIn => _isLoggedIn;
  void setIsLoggedIn (bool value){
    _isLoggedIn = value ;
    notifyListeners();
  }

  void loggedIn(String email , String  password)async{

    setloading(true);
    try {
      Response response = await post(Uri.parse("https://reqres.in/api/register"),
          body: {"email": email, "password": password});
      if (response.statusCode == 200) {
        print("ApI successfully called");
        setloading(false);
        setIsLoggedIn(true);
      } else {
        print("request failedd");
        setloading(false);
      }
    } catch (e) {
      print(e);
      setloading(false);
    }
  }
}