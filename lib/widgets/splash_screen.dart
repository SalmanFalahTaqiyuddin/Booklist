import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _playAudioAndNavigate();
  }

  Future<void> _playAudioAndNavigate() async {
    try {
      await _audioPlayer.play(AssetSource('splash.wav'));
      print('Audio: Berhasil memuat dan memutar splash.wav');
    } catch (e) {
      print('ERROR: Gagal memuat/memutar audio. Error: $e');
    }

    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
      Navigator.of(context).pushReplacementNamed('/book');
      print('Navigasi: Berhasil pindah ke rute /book');
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
