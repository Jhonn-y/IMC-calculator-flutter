// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_element

import 'dart:math';

import 'package:flutter/material.dart';

class ControllerChangenotifier extends ChangeNotifier{
  var imc = 0.0;


  Future<void> CalculateIMC(
      {required double height, required double weight}) async {
    imc = 0.0;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    imc = weight/ pow(height, 2);
    notifyListeners();

  }



}