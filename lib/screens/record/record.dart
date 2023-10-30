import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:vhq/common.dart';

import 'camera_preview.dart';

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
    return FutureBuilder(
      future: allCameras.populate(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                title: const Text("Record"),
                actions:[PopupMenuButton(itemBuilder: (context) =>
                    allCameras.cameras.map((e) =>
                        PopupMenuItem(child: Text(e.toString()))).toList())]
            ),
            // TODO: Change 0 to the camera selected from AppBar
            // TODO: Turn this into a FutureBuilder
            body: CameraPreviewScreen(camera: allCameras.cameras[0]),
          );
        } else {
          // Otherwise, display a loading indicator.
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class AllCameras {
  List<CameraDescription> cameras = <CameraDescription>[];
  static final AllCameras _instance = AllCameras._create();

  // Private Constructor
  AllCameras._();

  static AllCameras _create() {
    var retCameras = AllCameras._();
    return retCameras;
  }

  Future<void> populate() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      cameras = await availableCameras();
    } on CameraException catch (e) {
      logError(e.code, e.description);
    }
  }

  factory AllCameras() {
    return _instance;
  }
}