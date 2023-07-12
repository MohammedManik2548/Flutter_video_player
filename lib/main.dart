import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late VideoPlayerController videoPlayerController;
  late VideoPlayerController videoPlayerController2;
  late CustomVideoPlayerController customVideoPlayerController;
  late CustomVideoPlayerController customVideoPlayerController2;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse('http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'))
      ..initialize().then((value) => setState(() {}));
    videoPlayerController2 = VideoPlayerController.networkUrl(
        Uri.parse('http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'))
      ..initialize().then((value) => setState(() {}));

    customVideoPlayerController = CustomVideoPlayerController(
      context: context, videoPlayerController: videoPlayerController,
      customVideoPlayerSettings: const CustomVideoPlayerSettings(
        controlBarDecoration: BoxDecoration(
          color: Colors.red,
        ),
        customVideoPlayerProgressBarSettings: CustomVideoPlayerProgressBarSettings(
          backgroundColor: Colors.blue,
          //allowScrubbing: false,
          bufferedColor: Colors.yellowAccent,
          progressBarBorderRadius: 1,
          progressBarHeight: 1,
          reachableProgressBarPadding: EdgeInsets.all(2)
        ),

        placeholderWidget: Center(child: CircularProgressIndicator(),),
        deviceOrientationsAfterFullscreen: [
          DeviceOrientation.portraitUp,
        ],
      ),
    );

    customVideoPlayerController2 = CustomVideoPlayerController(
      context: context, videoPlayerController: videoPlayerController2,
      customVideoPlayerSettings:   const CustomVideoPlayerSettings(
        placeholderWidget: Center(child: CircularProgressIndicator(),),
        deviceOrientationsAfterFullscreen: [
          DeviceOrientation.portraitUp,
        ],
      ),
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    videoPlayerController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Video Player'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius:
                BorderRadius.circular(10),
                  child: CustomVideoPlayer(customVideoPlayerController: customVideoPlayerController),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child: CustomVideoPlayer(customVideoPlayerController: customVideoPlayerController2),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child: CustomVideoPlayer(customVideoPlayerController: customVideoPlayerController2),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child: CustomVideoPlayer(customVideoPlayerController: customVideoPlayerController2),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child: CustomVideoPlayer(customVideoPlayerController: customVideoPlayerController2),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


