import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

import '../painters/object_detector_painter.dart';
import 'camera_view.dart';

class ObjectDetectorView extends StatefulWidget {
  final String title;

  const ObjectDetectorView({
    super.key,
    required this.title,
  });

  @override
  State<ObjectDetectorView> createState() => _ObjectDetectorViewState();
}

class _ObjectDetectorViewState extends State<ObjectDetectorView> {
  late ObjectDetector _objectDetector;
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
    _objectDetector.close();
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
    final options = ObjectDetectorOptions(
      mode: DetectionMode.stream,
      classifyObjects: true,
      multipleObjects: true,
    );
    _objectDetector = ObjectDetector(options: options);

    _canProcess = true;
  }

  Future<void> processImage(InputImage inputImage) async {
    if (!_canProcess || _isBusy) return;

    _isBusy = true;
    setState(() {});

    final objects = await _objectDetector.processImage(inputImage);
    final imageData = inputImage.inputImageData;

    if (imageData?.size != null && imageData?.imageRotation != null) {
      final imageData = inputImage.inputImageData!;
      final painter = ObjectDetectorPainter(
        objects,
        imageData.imageRotation,
        imageData.size,
      );
      _customPaint = CustomPaint(painter: painter);
    } else {
      String text = 'Objects found: ${objects.length}\n\n';
      for (final object in objects) {
        final labels = object.labels.map((e) => e.text);
        text += 'Object:  trackingId: ${object.trackingId} - $labels\n\n';
      }

      if (kDebugMode) {
        print(text);
      }

      _customPaint = null;
    }

    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}
