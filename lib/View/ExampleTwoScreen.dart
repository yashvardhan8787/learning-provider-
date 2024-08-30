import 'package:flutter/material.dart';
import 'package:learning_provider/provider/exmaple_two_provider.dart';
import 'package:provider/provider.dart';

class Exampletwoscreen extends StatefulWidget {
  const Exampletwoscreen({super.key});

  @override
  State<Exampletwoscreen> createState() => _ExampletwoscreenState();
}

class _ExampletwoscreenState extends State<Exampletwoscreen> {
  double value = 1.0; // Move the value to the state

  @override
  Widget build(BuildContext context) {
    final valueProvider = Provider.of<ExampleTwoProvider>(context,listen:true);
    return Scaffold(
      body: Center(
        child: Consumer<ExampleTwoProvider>(builder: (context, value, child){
          return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(value.value.toString()),
              Slider(
                min: 0.0,
                max: 1.0,
                value:value.value,
                onChanged: (val) {
                  value.setValue(val);
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.red.withOpacity(value.value),
                      child: const Center(
                        child: Text("container 1"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.green.withOpacity(value.value),
                      child: const Center(
                        child: Text("container 2"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
        ),
      ),
    );
  }
}
