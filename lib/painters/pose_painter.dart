import 'package:flutter/material.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

import '../utils/coordinates_translator.dart';

class PosePainter extends CustomPainter {
  final List<Pose> poses;
  final Size absoluteImageSize;
  final InputImageRotation rotation;

  PosePainter({
    required this.poses,
    required this.absoluteImageSize,
    required this.rotation,
  });

  Offset createLandmarkCenter(PoseLandmark landmark, Size size) {
    return Offset(
      translateX(landmark.x, rotation, size, absoluteImageSize),
      translateY(landmark.y, rotation, size, absoluteImageSize),
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.green;

    final leftPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = Colors.yellow;

    final rightPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = Colors.blueAccent;

    for (final pose in poses) {
      pose.landmarks.forEach((_, landmark) {
        final center = createLandmarkCenter(landmark, size);
        canvas.drawCircle(center, 1, paint);
      });

      void paintLine(
        PoseLandmarkType type1,
        PoseLandmarkType type2,
        Paint paintType,
      ) {
        final joint1 = pose.landmarks[type1]!;
        final joint2 = pose.landmarks[type2]!;
        final position1 = createLandmarkCenter(joint1, size);
        final position2 = createLandmarkCenter(joint2, size);
        canvas.drawLine(position1, position2, paintType);
      }

      // Draw arms
      paintLine(
        PoseLandmarkType.leftShoulder,
        PoseLandmarkType.leftElbow,
        leftPaint,
      );
      paintLine(
        PoseLandmarkType.leftElbow,
        PoseLandmarkType.leftWrist,
        leftPaint,
      );
      paintLine(
        PoseLandmarkType.rightShoulder,
        PoseLandmarkType.rightElbow,
        rightPaint,
      );
      paintLine(
        PoseLandmarkType.rightElbow,
        PoseLandmarkType.rightWrist,
        rightPaint,
      );

      // Draw Body
      paintLine(
        PoseLandmarkType.leftShoulder,
        PoseLandmarkType.leftHip,
        leftPaint,
      );
      paintLine(
        PoseLandmarkType.rightShoulder,
        PoseLandmarkType.rightHip,
        rightPaint,
      );

      // Draw legs
      paintLine(
        PoseLandmarkType.leftHip,
        PoseLandmarkType.leftKnee,
        leftPaint,
      );
      paintLine(
        PoseLandmarkType.leftKnee,
        PoseLandmarkType.leftAnkle,
        leftPaint,
      );
      paintLine(
        PoseLandmarkType.rightHip,
        PoseLandmarkType.rightKnee,
        rightPaint,
      );
      paintLine(
        PoseLandmarkType.rightKnee,
        PoseLandmarkType.rightAnkle,
        rightPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant PosePainter oldDelegate) {
    return oldDelegate.absoluteImageSize != absoluteImageSize ||
        oldDelegate.poses != poses;
  }
}
