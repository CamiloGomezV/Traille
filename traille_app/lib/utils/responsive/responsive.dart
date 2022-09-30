import 'dart:math' as math;

import 'package:flutter/cupertino.dart';

class Responsive {
  double? width, height, inch;

  static Responsive? _singleton;

  factory Responsive({required BuildContext context}) {
    _singleton ??= Responsive._internal(context: context);
    return _singleton!;
  }

  Responsive._internal({required BuildContext context}) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height - (MediaQuery.of(context).padding.bottom * 2);

    inch = math.sqrt(math.pow(width!, 2) + math.pow(height!, 2));
  }

  double wp(double percent) => width! * percent / 100;
  double hp(double percent) => height! * percent / 100;
  double ip(double percent) => inch! * percent / 100;
}
