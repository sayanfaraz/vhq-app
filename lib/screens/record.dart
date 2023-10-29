import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:vhq/common.dart';


class AllCameras {
  List<CameraDescription> cameras = <CameraDescription>[];
  static final AllCameras _instance = AllCameras.create();

  // Private Constructor
  AllCameras._();

  static AllCameras create() {
    var retCameras = AllCameras._();
    return retCameras;
  }

  Future<void> populate() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      var findCameras = await availableCameras();
      cameras = findCameras;
    } on CameraException catch (e) {
      logError(e.code, e.description);
    }
  }

  factory AllCameras() {
    return _instance;
  }
}

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<StatefulWidget> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  AllCameras allCameras = AllCameras();
  _RecordPageState() {
    allCameras.populate();
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: allCameras.cameras.map((e) => Text(e.toString())).toList()
        ),
      ),
    );
  }
}