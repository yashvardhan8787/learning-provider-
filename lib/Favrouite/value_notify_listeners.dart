import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotifyListenersScreen extends StatefulWidget{



  NotifyListenersScreen({super.key});

  @override
  State<NotifyListenersScreen> createState() => _NotifyListenersScreenState();
}

class _NotifyListenersScreenState extends State<NotifyListenersScreen> {
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> _toggel = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       title: Text("StateManegement in StateLessWidget"),
     ),
     body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         ValueListenableBuilder(
           valueListenable: _toggel,
           builder: (context, value, child) {
             return  TextFormField(
                 obscureText: _toggel.value,
                 decoration: InputDecoration(
                     hintText: "password",
                     suffix: InkWell(
                       onTap: () {
                         _toggel.value = !_toggel.value;
                       },
                       child: Icon(_toggel.value ? Icons.visibility : Icons
                           .visibility_off),
                     )
                 )
             );
           },
         ),

         Center(
           child:ValueListenableBuilder(
             valueListenable:_counter ,
             builder: (context, value, child) {
               return Text(_counter.value.toString() ,style: TextStyle(fontSize:50),);
             },
           ),
         ),
       ],
     ),
     floatingActionButton: FloatingActionButton(
       onPressed:(){
         _counter.value++ ;
         print(_counter.value.toString());
       },
       child: Icon(Icons.add),

     ),
   );
  }
}