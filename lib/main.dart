import 'package:flutter/material.dart';
import 'package:khataman/features/khataman/presentation/pages/page_anggota.dart';
import 'features/khataman/presentation/pages/splash_screen.dart';
import 'features/khataman/presentation/pages/page_task.dart';
import 'features/khataman/presentation/pages/page_report.dart';

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
        '/task': (context) => PageTask(
            members:
                ModalRoute.of(context)!.settings.arguments as List<String>),
        '/report': (context) {
          final Map<String, List<bool>> tasks = ModalRoute.of(context)!
              .settings
              .arguments as Map<String, List<bool>>;
          return PageReport(tasks: tasks);
        },
      },
    );
  }
}
