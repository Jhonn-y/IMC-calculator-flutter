// ignore_for_file: prefer_const_constructors, body_might_complete_normally_nullable, non_constant_identifier_names
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:imc_calculator/changeNotifier/controller_changeNotifier.dart';
import 'package:imc_calculator/widgets/imc_gauge_range.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ImcChangenotifier extends StatefulWidget {
  const ImcChangenotifier({super.key});

  @override
  State<ImcChangenotifier> createState() => _ImcChangenotifierState();
}

class _ImcChangenotifierState extends State<ImcChangenotifier> {
  
  final controller = ControllerChangenotifier();

  final heightEC = TextEditingController();

  final weightEC = TextEditingController();

  final formkey = GlobalKey<FormState>();



  @override
  void dispose() {
    heightEC.dispose();
    weightEC.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMC Calculator'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formkey,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                AnimatedBuilder(
                  animation: controller,
                  builder: (context, child){
                    return SfRadialGauge(
                    axes: [
                      RadialAxis(
                        showTicks: false,
                        showLabels: false,
                        showAxisLine: false,
                        minimum: 12.5,
                        maximum: 44.9,
                        ranges: [
                          GaugeRangebase(
                              color: const Color.fromARGB(255, 51, 37, 180),
                              start: 12.5,
                              end: 18.5,
                              label: 'Magro'),
                          GaugeRangebase(
                              color: const Color.fromARGB(255, 52, 175, 165),
                              start: 18.6,
                              end: 24.9,
                              label: 'Normal'),
                          GaugeRangebase(
                              color: const Color.fromARGB(255, 28, 173, 72),
                              start: 25,
                              end: 29.9,
                              label: 'Sobrepeso'),
                          GaugeRangebase(
                              color: const Color.fromARGB(255, 214, 218, 27),
                              start: 30,
                              end: 34.9,
                              label: 'Obesidade'),
                          GaugeRangebase(
                            color: const Color.fromARGB(255, 209, 134, 21),
                            start: 35,
                            end: 39.9,
                            label: 'Obesidade grave',
                          ),
                          GaugeRangebase(
                            color: const Color.fromARGB(255, 240, 26, 11),
                            start: 40,
                            end: 44.9,
                            label: 'Obesidade extrema',
                          )
                        ],
                        pointers: [
                          NeedlePointer(
                            value: controller.imc,
                            enableAnimation: true,
                          )
                        ],
                      ),
                    ],
                  );
                  }
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: heightEC,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Altura (m)',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo Obrigatótio!';
                      }
                    },
                    inputFormatters: [
                      CurrencyTextInputFormatter.currency(
                        locale: 'pt-BR',
                        symbol: '',
                        decimalDigits: 2,
                        turnOffGrouping: true,
                      ),
                    ],
                  ),
                  TextFormField(
                      controller: weightEC,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Peso (Kg)',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo Obrigatótio!';
                        }
                      },
                      inputFormatters: [
                        CurrencyTextInputFormatter.currency(
                          locale: 'pt-BR',
                          symbol: '',
                          decimalDigits: 2,
                          turnOffGrouping: true,
                        ),
                      ]),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var formValidate =
                          formkey.currentState?.validate() ?? false;

                      if (formValidate) {
                        var formatter = NumberFormat.simpleCurrency(
                          locale: 'pt-BR',
                          decimalDigits: 2,
                        );
                        double height =
                            formatter.parse(heightEC.text) as double;
                        double weight =
                            formatter.parse(weightEC.text) as double;
                        controller.CalculateIMC(height: height, weight: weight);
                      }
                    },
                    child: Text("Calcular IMC"),
                  )
              ])),
          ),
        ),
      ),
    );
  }
}