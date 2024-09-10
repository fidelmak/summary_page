import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod
import 'package:summary_page/views/splash.dart';

void main() {
  runApp(const ProviderScope(child: MyApp())); // Wrap MyApp with ProviderScope
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(//
      debugShowCheckedModeBanner: false,
      title: 'Summary Page',
      home: SplashScreen(),
    );
  }
}
