import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Inisialisasi AudioPlayer
  final _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    // Memanggil fungsi asinkron segera setelah widget dibuat
    _playAudioAndNavigate();
  }

  Future<void> _playAudioAndNavigate() async {
    const Duration splashDuration = Duration(seconds: 3);

    // 1. Coba putar audio (dengan penanganan error)
    try {
      // Pastikan 'splash.wav' ada di folder 'assets/' dan di pubspec.yaml
      await _audioPlayer.play(AssetSource('splash.wav'));
    } catch (e) {
      // Jika gagal memutar audio (misalnya file tidak ditemukan),
      // error akan dicetak di konsol, tapi aplikasi tidak crash.
      print(
        '❌ ERROR MEMUTAR AUDIO: Gagal memuat/memutar splash.wav. Error: $e',
      );
    }

    // 2. Tunggu selama durasi splash screen (3 detik)
    await Future.delayed(splashDuration);

    // 3. Navigasi ke halaman utama
    // Cek 'mounted' memastikan widget masih ada sebelum navigasi
    if (mounted) {
      // Menggunakan pushReplacementNamed agar pengguna tidak bisa kembali ke splash screen
      Navigator.pushReplacementNamed(context, '/book');
    }
  }

  @override
  void dispose() {
    // Penting: Membebaskan sumber daya AudioPlayer saat widget dihapus
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff189B56),
      body: Center(
        child: Image(
          // Pastikan 'assets/logo.png' ada dan dideklarasikan
          image: AssetImage('assets/logo.png'),
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
