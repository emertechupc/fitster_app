import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ArCameraView extends StatefulWidget {
  const ArCameraView({super.key});

  @override
  State<ArCameraView> createState() => _ArCameraViewState();
}

class _ArCameraViewState extends State<ArCameraView> {
  ArCoreController? arMainController;

  _onArCoreViewCreated(ArCoreController arCoreController){
    arMainController = arCoreController;
    _tryClothes(arMainController!);
  }

  Future<Uint8List> _getImageBytes(String textureRoute) async {
    final ByteData data = await rootBundle.load('assets/ar_clothes/textures/$textureRoute');
    return data.buffer.asUint8List();
  }
  
  _tryClothes(ArCoreController arCoreController) async {
    final textureByte = await _getImageBytes('polo.png');
    final materials = ArCoreMaterial(
      color: Colors.green,
      textureBytes: textureByte,
    );

    final clotheSelected = ArCoreCylinder(
      materials: [materials]
    );

    final node = ArCoreNode(
      shape: clotheSelected,
      position: vector.Vector3(0, 0, -3.5),
      /*scale: vector.Vector3(),*/
    );

    arMainController!.addArCoreNode(node);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
      )
    );
  }

}