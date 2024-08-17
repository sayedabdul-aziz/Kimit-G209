// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

abstract interface class Area {
  getArea();
}

abstract interface class Perimeter {
  getPerimeter();
}

class Circle implements Area, Perimeter {
  double r;
  Circle({
    required this.r,
  });
  @override
  getArea() {
    print("Area : ${pi * r * r}");
  }

  @override
  getPerimeter() {
    print("Perimeter : ${2 * pi * r}");
  }
}
