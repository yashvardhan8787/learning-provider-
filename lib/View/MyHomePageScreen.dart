import 'package:flutter/material.dart';
import 'package:learning_provider/provider/count_provider.dart';
import 'package:provider/provider.dart';

class MyHomePageScreen extends StatefulWidget {
  const MyHomePageScreen({super.key});

  @override
  State<MyHomePageScreen> createState() => _MyHomePageScreenState();
}

class _MyHomePageScreenState extends State<MyHomePageScreen> {
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context,listen:false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Count Example"),
      ),
      body:Column(
        children: [
          Container(
            child: Center(
              child:Consumer<CountProvider>(builder:(context,value,child){
                return Text(value.count.toString(),style: TextStyle(
                  fontSize: 40,
                ));
              })
            ),
          ),
          FloatingActionButton(onPressed: (){
            countProvider.setCount();
          },
          child: Icon(Icons.add),)
        ],
      ),
    );
  }
}

