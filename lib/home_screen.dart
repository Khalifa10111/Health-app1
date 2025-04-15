import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'first_aid_page.dart';
import 'nutrition_page.dart';
import 'health_quiz_page.dart';
import 'hospitals_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = false;
  bool notificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode
          ? ThemeData.dark().copyWith(
              scaffoldBackgroundColor: Colors.black,
            )
          : ThemeData.light(),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
              colorFilter: isDarkMode
                  ? ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken)
                  : null,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'دليل الصحة',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(height: 30),
                    _buildSectionButton(context, 'الإسعافات الأولية', FirstAidPage()),
                    _buildSectionButton(context, 'ما يجب عليك معرفته', NutritionPage()),
                    _buildSectionButton(context, 'اختبار المعرفة الصحية', HealthQuizPage()),
                    _buildSectionButton(context, 'أقرب المستشفيات', HospitalsPage()),
                    SizedBox(height: 20),
                    _buildEmergencyCallButton('اتصال الطوارئ 911', '911', Colors.red),
                    SizedBox(height: 10),
                    _buildEmergencyCallButton('اتصال وزارة الصحة 937', '937', Colors.green),
                    SizedBox(height: 20),
                    SwitchListTile(
                      title: Text('تفعيل الوضع الليلي', textAlign: TextAlign.right),
                      value: isDarkMode,
                      onChanged: (val) => setState(() => isDarkMode = val),
                    ),
                    SwitchListTile(
                      title: Text('تفعيل التنبيهات الصحية', textAlign: TextAlign.right),
                      value: notificationsEnabled,
                      onChanged: (val) => setState(() => notificationsEnabled = val),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionButton(BuildContext context, String title, Widget page) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.8),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.teal[800],
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildEmergencyCallButton(String title, String number, Color color) {
    return Container(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(Icons.call, color: Colors.white),
        label: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 6,
        ),
        onPressed: () async {
          final Uri url = Uri(scheme: 'tel', path: number);
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('تعذر بدء المكالمة')),
            );
          }
        },
      ),
    );
  }
}


