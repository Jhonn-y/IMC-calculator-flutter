// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:imc_calculator/setState/imc_setState.dart';
import 'package:imc_calculator/valueNotifier/valueNotifier.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  void _goToPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            ElevatedButton(onPressed: (){
              _goToPage(context, ImcSetstate());

            }, child: Text("setState")),
            ElevatedButton(onPressed: (){


            }, child: Text("changeNotifier")),
            ElevatedButton(onPressed: (){


            }, child: Text("Valuenotifier")),
            ElevatedButton(onPressed: (){
            _goToPage(context, IMCvalueNotifier());

            }, child: Text("Bloc Pattern")),

          ],
      ),
      ),
    );
  }
}