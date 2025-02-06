import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get realTextScale => MediaQuery.of(this).textScaler.scale(1);
}
