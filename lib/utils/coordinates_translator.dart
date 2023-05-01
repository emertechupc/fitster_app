import 'dart:ui';

import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

double translateX(
  double x,
  InputImageRotation rotation,
  Size size,
  Size absoluteImageSize,
) {
  switch (rotation) {
    case InputImageRotation.rotation90deg:
    case InputImageRotation.rotation270deg:
      return x * size.width / absoluteImageSize.height;
    default:
      return x * size.width / absoluteImageSize.width;
  }
}

double translateY(
  double y,
  InputImageRotation rotation,
  Size size,
  Size absoluteImageSize,
) {
  switch (rotation) {
    case InputImageRotation.rotation90deg:
    case InputImageRotation.rotation270deg:
      return y * size.height / absoluteImageSize.width;
    default:
      return y * size.height / absoluteImageSize.height;
  }
}
