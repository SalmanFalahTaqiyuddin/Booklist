import 'package:data/views/main_page_view.dart';
import 'package:data/widgets/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booklist App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.quicksandTextTheme(),
        scaffoldBackgroundColor: const Color(0xff189B56),
      ),
      initialRoute: '/splash',
      routes: {
        '/book': (context) => const MainPageView(),
        '/splash': (context) => const SplashScreen(),
      },
    );
  }
}
