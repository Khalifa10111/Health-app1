import 'package:flutter/material.dart';
import 'more_nutrition_tips.dart';  // تأكد من استيراد صفحة النصائح

class NutritionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مايجب عليك معرفته'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'معلومات عامة:',
              style: TextStyle(
                color: Colors.red,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'ما هي المعلومات التي يحتاج لها الشخص في وقت الحالات الطارئة؟. ',
            style: TextStyle(
                fontSize: 21,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '. معرفة ارقام الطوارئ والقدرة على الاتصال بضغطة زر.',
              style: TextStyle(
                fontSize: 21,
                color: Colors.black,
              ),
              
            ),
            SizedBox(height: 10),
            Text(
              '. معرفة اقرب المستشفيات من خلال استخدام الموقع الحالي.',
             style: TextStyle(
                fontSize: 21,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // عند الضغط على الزر، انتقل إلى صفحة المزيد من النصائح
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MoreNutritionTips()),
                );
              },
              child: Text('المزيد من المعلومات'),
            ),
          ],
        ),
      ),
    );
  }
}
