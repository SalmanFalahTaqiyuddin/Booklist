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
    const Duration splashDuration = Duration(seconds: 3);

    try {
      await _audioPlayer.play(AssetSource('splash.wav'));
    } catch (e) {
      print(
        '❌ ERROR MEMUTAR AUDIO: Gagal memuat/memutar splash.wav. Error: $e',
      );
    }

    await Future.delayed(splashDuration);
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
    return const Scaffold(
      backgroundColor: Color(0xff189B56),
      body: Center(
        child: Image(
          image: AssetImage('assets/logo.png'),
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
