import 'dart:ui';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GaugeRangebase extends GaugeRange {
  GaugeRangebase(
    {
      required Color color,
      required double start,
      required double end,
      required String label})
    : super (

      color: color,
      startValue: start,
      endValue: end,
      label: label,
      sizeUnit: GaugeSizeUnit.factor,
      labelStyle: GaugeTextStyle( fontFamily: 'Times', fontSize: 12),
      startWidth: 0.65,
      endWidth: 0.65
    );
}