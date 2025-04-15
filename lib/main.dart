import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(HealthApp());
}

class HealthApp extends StatefulWidget {
  @override
  _HealthAppState createState() => _HealthAppState();
}

class _HealthAppState extends State<HealthApp> {
  bool isDarkMode = false; // الحالة لتمثيل الوضع الليلي

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تطبيق الصحة',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.teal),
          bodyLarge: TextStyle(fontSize: 18, fontFamily: 'Arial', color: Colors.black),
          bodyMedium: TextStyle(fontSize: 16, fontFamily: 'Arial', color: Colors.grey),
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.teal),
          bodyLarge: TextStyle(fontSize: 18, fontFamily: 'Arial', color: Colors.white),
          bodyMedium: TextStyle(fontSize: 16, fontFamily: 'Arial', color: Colors.grey),
        ),
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light, // استخدام الحالة لتحديد الوضع
      home: SplashScreen(), // تحديد صفحة البداية كـ SplashScreen
      debugShowCheckedModeBanner: false,
    );
  }
}
