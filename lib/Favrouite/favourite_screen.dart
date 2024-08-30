import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learning_provider/Favrouite/selected_screen.dart';
import 'package:learning_provider/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget{
  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  @override
  Widget build(BuildContext context) {
    print("build hello");
    return Scaffold(
      appBar: AppBar(
        title:Text("favourite screen"),
        actions: [
          InkWell(
            onTap:(){
              Navigator.push(context,MaterialPageRoute(builder: (context) => SelectedScreen(),));
            },
            child: Icon(Icons.favorite),

          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount:100
                ,itemBuilder: (context, index) {
                  return  Consumer<FavouriteProvider>(builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        value.addItem(index);
                      },
                      title: Text("item " + index.toString()),
                      trailing: Icon(value.selectedItem
                          .contains(index) ?
                      Icons.favorite :
                      Icons.favorite_outline_outlined),
                    );
                  });
                },),
          )
        ],
      ),
    );
  }
}