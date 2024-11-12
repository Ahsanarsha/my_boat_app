import 'package:flutter/material.dart';
import 'dart:async';

import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Initialize the video player controller with the splash video file
    _controller =
        VideoPlayerController.asset("assets/videos/animated_splash_screen.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();

    // Play the video automatically and loop it if necessary
    _controller.setLooping(false);
    _controller.play();

    // Navigate to the home screen once the video ends
    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        _navigateToHome();
      }
    });
  }

  // Navigate to the next screen after splash
  void _navigateToHome() {
    Navigator.of(context)
        .pushReplacementNamed('/home'); // Replace with your home screen route
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
