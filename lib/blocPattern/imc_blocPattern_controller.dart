// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:async';
import 'dart:math';

import 'package:imc_calculator/blocPattern/imc_StatePattern.dart';

class ImcBlocpatternController {

  final _imcStreamController = StreamController<ImcStatePattern>.broadcast()..add(ImcStatePattern(imc: 0.0));

  Stream<ImcStatePattern> get imcOut => _imcStreamController.stream;

  Future<void> CalculateIMC(
      {required double height, required double weight}) async {
        _imcStreamController.add(ImcStatepatternLoading());

    await Future.delayed(Duration(seconds: 1));
    _imcStreamController.add(ImcStatePattern(imc: 0.0));
    final imc = weight/ pow(height, 2);
    _imcStreamController.add(ImcStatePattern(imc: imc));
  }

  void dispose(){
    _imcStreamController.close();
  }
  
}