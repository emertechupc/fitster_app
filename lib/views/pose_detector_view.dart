import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

import '../painters/pose_painter.dart';
import 'camera_view.dart';

class PoseDetectorView extends StatefulWidget {
  final String title;

  const PoseDetectorView({
    super.key,
    required this.title,
  });

  @override
  State<PoseDetectorView> createState() => _PoseDetectorViewState();
}

class _PoseDetectorViewState extends State<PoseDetectorView> {
  late final PoseDetector _detector;
  bool _canProcess = false;
  bool _isBusy = false;
  CustomPaint? _customPaint;

  @override
  void initState() {
    super.initState();
    _initializeDetector();
  }

  @override
  void dispose() {
    _canProcess = false;
    _detector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CameraView(
      title: widget.title,
      onImage: processImage,
      customPaint: _customPaint,
    );
  }

  Future<void> _initializeDetector() async {
    final options = PoseDetectorOptions(
      model: PoseDetectionModel.base,
      mode: PoseDetectionMode.stream,
    );

    _detector = PoseDetector(options: options);
    _canProcess = true;
  }

  Future<void> processImage(InputImage inputImage) async {
    if (!_canProcess || _isBusy) return;

    _isBusy = true;
    setState(() {});

    final poses = await _detector.processImage(inputImage);
    final metadata = inputImage.metadata;

    if (metadata != null) {
      final painter = PosePainter(
        poses: poses,
        absoluteImageSize: metadata.size,
        rotation: metadata.rotation,
      );
      _customPaint = CustomPaint(painter: painter);
    } else {
      if (kDebugMode) {
        print('Poses found: ${poses.length}\n\n');
      }

      _customPaint = null;
    }

    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}
