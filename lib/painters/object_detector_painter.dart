import 'dart:ui';
import 'dart:ui' as ui;

import 'package:fitster_poc/utils/coordinates_translator.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

class ObjectDetectorPainter extends CustomPainter {
  final List<DetectedObject> _objects;
  final Size absoluteSize;
  final InputImageRotation rotation;

  ObjectDetectorPainter(this._objects, this.rotation, this.absoluteSize);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = Colors.lightGreenAccent;

    final background = Paint()..color = const Color(0x99000000);

    for (final detection in _objects) {
      final box = detection.boundingBox;
      final left = translateX(box.left, rotation, size, absoluteSize);
      final top = translateY(box.top, rotation, size, absoluteSize);
      final right = translateX(box.right, rotation, size, absoluteSize);
      final bottom = translateY(box.bottom, rotation, size, absoluteSize);

      canvas.drawRect(Rect.fromLTRB(left, top, right, bottom), paint);
      final builder = ParagraphBuilder(
        ParagraphStyle(
          textAlign: TextAlign.left,
          fontSize: 14,
          textDirection: TextDirection.ltr,
        ),
      );

      builder.pushStyle(
        ui.TextStyle(color: Colors.lightGreenAccent, background: background),
      );

      for (final label in detection.labels.take(3)) {
        builder.addText('${label.text} ${label.confidence}\n');
      }

      builder.pop();

      final width = rotation == InputImageRotation.rotation270deg
          ? left - right
          : right - left;

      final paragraph = builder.build()
        ..layout(ParagraphConstraints(width: width));

      final offset = rotation == InputImageRotation.rotation270deg
          ? Offset(right, top)
          : Offset(left, top);

      canvas.drawParagraph(paragraph, offset);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
