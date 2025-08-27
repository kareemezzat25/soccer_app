import 'package:flutter/material.dart';
import 'package:soccer_app/views/home_view.dart';
import 'package:video_player/video_player.dart';

class SplashView extends StatefulWidget {
  static const String routeName = "SplashView";
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset("assets/videos/logo.mp4")
      ..initialize().then((_) {
        setState(() {});
      });
    playVideo();
  }

  void playVideo() async {
    controller.play();
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushNamedAndRemoveUntil(
      context,
      HomeView.routeName,
      (routes) => false,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
