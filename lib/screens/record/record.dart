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
  late AllCameras allCameras = AllCameras();
  int currCameraInd = 0;

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
                actions:[
                  PopupMenuButton<int>(
                    initialValue: currCameraInd,
                    onSelected: (int ind) {
                      setState(() {
                        currCameraInd = ind;
                      });
                    },
                    itemBuilder: (context) => Iterable<int>.generate(allCameras.cameras.length).map(
                            (ind) => PopupMenuItem(
                              value: ind,
                              child: Text(allCameras.cameras[ind].toString()),
                            )
                    ).toList(),
                  ),
                ]
            ),
            body: CameraPreviewScreen(camera: allCameras.cameras[currCameraInd]),
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