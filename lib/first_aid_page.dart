import 'package:flutter/material.dart';

class FirstAidPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الإسعافات الأولية'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'الإسعافات الأولية هي رعاية مؤقتة تُقدم للشخص المصاب أو المريض لحين وصول المساعدة الطبية المتخصصة. إليك بعض الأساسيات: \n\n',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red),
              ),
              Text(
                '1. **الإصابات والحروق**: \n'
                '   - عند تعرض الشخص لحرق، يجب تبريد المنطقة المتأثرة بالماء البارد مباشرة (ولكن تجنب الماء المثلج). \n'
                '   - في حالة الإصابات، ينبغي وضع ضمادة نظيفة على الجرح لمنع التلوث والتوقف عن النزيف.\n\n',
                style: TextStyle(fontSize: 18,color: Colors.black),
              ),
              Text(
                '2. **الاختناق**: \n'
                '   - إذا كان الشخص يعاني من الاختناق، يجب أن نقوم بإجراء "مناورة هيمليك" التي تساعد على إخراج الشيء العالق.\n\n',
                style: TextStyle(fontSize: 18,color: Colors.black),
              ),
              Text(
                '3. **الإغماء**: \n'
                '   - عند فقدان الشخص الوعي، يجب أن يتم وضعه في وضعية الاستلقاء على ظهره مع رفع القدمين فوق مستوى القلب.\n'
                '   - تأكد من مراقبة التنفس وضربات القلب.\n\n',
                style: TextStyle(fontSize: 18,color: Colors.black),
              ),
              Text(
                '4. **التسمم**: \n'
                '   - إذا تم ابتلاع مادة سامة، يجب الاتصال بالمستشفى أو مركز السموم فورًا.\n'
                '   - لا تحاول إحداث القيء دون استشارة طبية.\n\n',
                style: TextStyle(fontSize: 18,color: Colors.black),
              ),
              Text(
                '5. **الحالات الطارئة للأطفال**: \n'
                '   - يجب أخذ الحذر عند التعامل مع الأطفال في حالات الطوارئ.\n'
                '   - التأكد من سلامة التنفس والشعور بالنبض.\n\n',
                style: TextStyle(fontSize: 18,color: Colors.black),
              ),
              Text(
                'في حال حدوث أي طارئ، يفضل دائمًا الاتصال بأرقام الطوارئ للحصول على المساعدة المتخصصة فورًا.\n\n',
                style: TextStyle(fontSize: 18,color: Colors.black, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
