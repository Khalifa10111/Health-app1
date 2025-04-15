import 'package:flutter/material.dart';

class MoreNutritionTips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('المزيد من النصائح'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'معلومات عامة:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'ماهي الفئة المستهدفة لهذا البرنامج؟',
              style: TextStyle(
                fontSize: 25,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'الفئة المستهدفة هم الاشخاص في المجتمع (المواطنين / المقيمين) الذين يمكن ان يواجهوا حالات طارئة في اي وقت,مثل حالات الاغماء , الحوادث, الجروح والاختناقات.',
              style: TextStyle(fontSize: 21,
                color: Colors.black,
                ),
            ),
            SizedBox(height: 10),
            Text(
              'بعضهم قد يكون لديه مشاكل في التنفس, مثل كبار السن او المرضى الذين لديهم امراض مزمنة, لأنهم أكثر الناس الذين قد يحتاجون طوارئ حالية.',
             style: TextStyle(fontSize: 21,
                color: Colors.black,
                ),
            ),
            SizedBox(height: 10),
            Text(
              'ما هي أهم المشاكل التي يواجهها الناس في وقت الطوارئ؟',
              style: TextStyle(fontSize: 25,
                color: Colors.red,
                ),
            ),
            SizedBox(height: 10),
            Text(
              'التأخير في التواصل مع الإسعاف.',
             style: TextStyle(fontSize: 21,
                color: Colors.black,
                ),
            ),
            SizedBox(height: 10),
            Text(
              'عدم معرفة أقرب مستشفى أو مركز صحي',
              style: TextStyle(fontSize: 21,
                color: Colors.black,
                ),
            ),
            SizedBox(height: 10),
            Text(
              'الخوف أو الذعر, وهذا الشيء يجعل الناس يضيعون الوقت',
              style: TextStyle(fontSize: 21,
                color: Colors.black,
                ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);  // العودة إلى الصفحة السابقة
              },
              child: Text('عودة'),
            ),
          ],
        ),
      ),
    );
  }
}
