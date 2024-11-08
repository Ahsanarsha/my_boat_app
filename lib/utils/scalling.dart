import 'package:flutter/material.dart';
import 'package:my_boat/utils/constants.dart';
import 'package:my_boat/utils/helper.dart';

extension ResponsiveDoubleExtension on double {
  double get h {
    return (MediaQuery.of(globalKey.currentState!.context).size.height /
        (Constants.figmaFrameHeight / this));
  }

  double get w {
    return (MediaQuery.of(globalKey.currentState!.context).size.width /
        (Constants.figmaFrameWidth / this));
  }
}

extension ResponsiveIntExtension on int {
  double get h {
    return (MediaQuery.of(globalKey.currentState!.context).size.height /
        (Constants.figmaFrameHeight / this));
  }

  double get w {
    return (MediaQuery.of(globalKey.currentState!.context).size.width /
        (Constants.figmaFrameWidth / this));
  }
}
