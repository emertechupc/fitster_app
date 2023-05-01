import 'package:flutter/material.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

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
  @override
  Widget build(BuildContext context) {
    return CameraView(title: widget.title, onImage: processImage);
  }

  Future<void> processImage(InputImage inputImage) async {}
}
