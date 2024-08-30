import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_provider/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class SelectedScreen extends StatefulWidget{
  @override
  State<SelectedScreen> createState() => _SelectedScreenState();
}

class _SelectedScreenState extends State<SelectedScreen> {

  @override
  Widget build(BuildContext context) {
    print("build hello");
    return Scaffold(
      appBar: AppBar(
          title:Text("favourite screen")
      ),
      body: Column(
        children: [
          Expanded(
          child:  Consumer<FavouriteProvider>(builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.selectedItem.length
              ,itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    value.addItem(value.selectedItem[index]);
                  },
                  title: Text("item " + value.selectedItem[index].toString()),
                  trailing: Icon(
                  Icons.favorite ),
                );
              });
            },),
          )
        ],
      ),
    );
  }
}