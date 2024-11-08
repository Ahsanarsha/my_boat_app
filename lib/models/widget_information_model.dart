import 'dart:developer';

import 'package:flutter/material.dart';

class WidgetInformationModel {
  final double h;
  final double w;
  final double x;
  final double y;

  WidgetInformationModel({required this.h, required this.w, required this.x, required this.y});

  factory WidgetInformationModel.getProperties(GlobalKey key) {
    RenderBox box = key.currentContext!.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);

    return WidgetInformationModel(
      h: box.size.height,
      w: box.size.width,
      x: position.dx,
      y: position.dy,
    );
  }

  void print() {
    log('WidgetInformationModel: Height: $h Width: $w X: $x Y: $y');
  }
}
