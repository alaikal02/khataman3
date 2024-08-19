import 'package:flutter/material.dart';
import 'package:khataman/features/khataman/presentation/pages/page_anggota.dart';
import 'features/khataman/presentation/pages/splash_screen.dart';

void main() {
  runApp(KhatamanApp());
}

class KhatamanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khataman Quran',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/anggota': (context) => PageAnggota(),
      },
    );
  }
}
