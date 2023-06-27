import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

enum CameraViewStatus {
  initializing,
  ready,
  live,
  stopped,
  failed;

  bool get isInitializing => this == CameraViewStatus.initializing;
  bool get isReady => this == CameraViewStatus.ready;
  bool get isLive => this == CameraViewStatus.live;
  bool get isStopped => this == CameraViewStatus.stopped;
  bool get isFailed => this == CameraViewStatus.failed;

  bool get isUsable => isReady || isLive;
}

class CameraView extends StatefulWidget {
  final Function(InputImage inputImage) onImage;
  final CustomPaint? customPaint;
  final CameraLensDirection initialDirection;

  const CameraView({
    super.key,
    required this.onImage,
    this.customPaint,
    this.initialDirection = CameraLensDirection.back,
  });

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  List<CameraDescription>? _cameras;
  CameraController? _controller;
  CameraViewStatus _status = CameraViewStatus.initializing;

  int _cameraIndex = -1;
  bool _changingCamera = false;

  @override
  void initState() {
    super.initState();
    _initCameras();
  }

  @override
  void dispose() {
    _stopLiveFeed();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitster'),
        actions: [
          if (_status.isLive)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: _stopLiveFeed,
                child: const Icon(Icons.stop),
              ),
            ),
          if (_status.isStopped)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: _startLiveFeed,
                child: const Icon(Icons.play_arrow),
              ),
            ),
          if (_status.isUsable && _cameras!.length > 1)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: _switchLiveCamera,
                child: const Icon(Icons.flip_camera_android_outlined),
              ),
            ),
        ],
      ),
      body: _liveFeedBody(),
    );
  }

  Widget _liveFeedBody() {
    if (_status.isFailed) {
      return const Center(child: Text('Failed to initialize camera'));
    }

    if (!_status.isUsable || _controller?.value.isInitialized == false) {
      return const Center(child: Text('Camera uninitialized'));
    }

    final size = MediaQuery.of(context).size;
    // calculate scale depending on screen and camera ratios
    // this is actually size.aspectRatio / (1 / camera.aspectRatio)
    // because camera preview size is received as landscape
    // but we're calculating for portrait orientation
    var scale = size.aspectRatio * _controller!.value.aspectRatio;

    // to prevent scaling down, invert the value
    if (scale < 1) scale = 1 / scale;

    return Container(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Transform.scale(
            scale: scale,
            child: Center(
              child: CameraPreview(_controller!),
            ),
          ),
          if (widget.customPaint != null) widget.customPaint!
        ],
      ),
    );
  }

  bool _hasInitialCamera(CameraDescription camera) {
    return camera.lensDirection == widget.initialDirection &&
        camera.sensorOrientation == 90;
  }

  Future<void> _initCameras() async {
    _cameras = await availableCameras();

    if (_cameras!.any(_hasInitialCamera)) {
      _cameraIndex = _cameras!.indexWhere(_hasInitialCamera);
    } else {
      for (var i = 0; i < _cameras!.length; ++i) {
        if (_cameras![i].lensDirection == widget.initialDirection) {
          _cameraIndex = i;
          break;
        }
      }
    }

    if (_cameraIndex != -1) {
      setState(() {
        _status = CameraViewStatus.ready;
      });
      await _startLiveFeed();
    } else {
      setState(() {
        _status = CameraViewStatus.failed;
      });
    }
  }

  Future<void> _switchLiveCamera() async {
    if (_changingCamera || _cameras == null) return;

    setState(() => _changingCamera = true);
    _cameraIndex = (_cameraIndex + 1) % _cameras!.length;

    await _stopLiveFeed();
    await _startLiveFeed();

    setState(() => _changingCamera = false);
  }

  Future<void> _startLiveFeed() async {
    if (!(_status.isReady || _status.isStopped)) return;

    final camera = _cameras![_cameraIndex];
    _controller = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.nv21,
    );
    _controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      _controller?.startImageStream(_processImageStream);
      setState(() {
        _status = CameraViewStatus.live;
      });
    });
  }

  Future<void> _stopLiveFeed() async {
    if (!_status.isLive) return;

    setState(() {
      _status = CameraViewStatus.stopped;
    });

    await _controller?.stopImageStream();
    await _controller?.dispose();
    _controller = null;
  }

  Future<void> _processImageStream(CameraImage image) async {
    final buffer = WriteBuffer();
    for (final plane in image.planes) {
      buffer.putUint8List(plane.bytes);
    }
    final bytes = buffer.done().buffer.asUint8List();

    final size = Size(image.width.toDouble(), image.height.toDouble());

    final camera = _cameras![_cameraIndex];
    final rotation =
        InputImageRotationValue.fromRawValue(camera.sensorOrientation);
    if (rotation == null) return;

    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    // We only support Android, and only NV21 is supported in Android
    if (format == null || format != InputImageFormat.nv21) return;

    if (image.planes.length != 1) return;
    final plane = image.planes.first;

    final inputImage = InputImage.fromBytes(
      bytes: bytes,
      metadata: InputImageMetadata(
        size: size,
        rotation: rotation,
        format: format,
        bytesPerRow: plane.bytesPerRow,
      ),
    );

    widget.onImage(inputImage);
  }
}
