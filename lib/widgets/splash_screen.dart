import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _playAudioAndNavigate();
  }

  Future<void> _playAudioAndNavigate() async {
    await _audioPlayer.play(AssetSource('splash.wav'));

    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
      Navigator.pushReplacementNamed(context, '/book');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff189B56),
      body: Center(
        child: Image.asset('assets/logo.png', width: 200, height: 200),
      ),
    );
  }
}
