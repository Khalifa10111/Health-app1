import 'package:flutter/material.dart';

class HealthQuizPage extends StatefulWidget {
  @override
  _HealthQuizPageState createState() => _HealthQuizPageState();
}

class _HealthQuizPageState extends State<HealthQuizPage> {
  int _score = 0;
  int _currentQuestionIndex = 0;

  List<Map<String, Object>> _questions = [
    {
      'question': 'ما هي التغذية السليمة؟',
      'answers': [
        {'text': 'تناول الوجبات السريعة بشكل منتظم', 'score': 0},
        {'text': 'تناول مجموعة متنوعة من الأطعمة الصحية', 'score': 1},
        {'text': 'تناول الحلويات بشكل مستمر', 'score': 0},
      ]
    },
    {
      'question': 'كم عدد أكواب الماء التي يجب أن يشربها الشخص يومياً؟',
      'answers': [
        {'text': 'كوب واحد فقط', 'score': 0},
        {'text': '8 أكواب على الأقل', 'score': 1},
        {'text': '10 أكواب أو أكثر', 'score': 0},
      ]
    },
    {
      'question': 'ما هي فائدة ممارسة الرياضة؟',
      'answers': [
        {'text': 'تقوية القلب وتحسين الدورة الدموية', 'score': 1},
        {'text': 'زيادة الوزن', 'score': 0},
        {'text': 'عدم تأثير على الصحة', 'score': 0},
      ]
    },
    {
      'question': 'هل يجب تجنب الوجبات السريعة؟',
      'answers': [
        {'text': 'نعم، فهي تحتوي على مواد غير صحية', 'score': 1},
        {'text': 'لا، يمكن تناولها بشكل يومي', 'score': 0},
        {'text': 'أحياناً فقط', 'score': 0},
      ]
    },
    {
      'question': 'ما هي فوائد تناول الخضروات؟',
      'answers': [
        {'text': 'تحسن من صحة البشرة', 'score': 1},
        {'text': 'تزيد الوزن بشكل كبير', 'score': 0},
        {'text': 'تضر بالصحة', 'score': 0},
      ]
    },
    {
      'question': 'ما هو الوقت المثالي لممارسة الرياضة؟',
      'answers': [
        {'text': 'قبل الإفطار مباشرة', 'score': 1},
        {'text': 'بعد العشاء مباشرة', 'score': 0},
        {'text': 'في أي وقت خلال اليوم', 'score': 0},
      ]
    },
    {
      'question': 'ما هو تأثير النوم على الصحة؟',
      'answers': [
        {'text': 'يؤثر بشكل إيجابي على التركيز والطاقة', 'score': 1},
        {'text': 'لا يؤثر بشكل كبير', 'score': 0},
        {'text': 'يؤدي إلى زيادة الوزن', 'score': 0},
      ]
    },
    {
      'question': 'هل تناول الوجبات الصغيرة أفضل من الوجبات الكبيرة؟',
      'answers': [
        {'text': 'نعم، يساعد في تحسين عملية الهضم', 'score': 1},
        {'text': 'لا، الوجبات الكبيرة أفضل', 'score': 0},
        {'text': 'ليس له تأثير', 'score': 0},
      ]
    },
    {
      'question': 'هل يجب تناول مكملات الفيتامينات؟',
      'answers': [
        {'text': 'نعم، إذا كانت هناك حاجة لذلك', 'score': 1},
        {'text': 'لا، لا يحتاج الجسم لها', 'score': 0},
        {'text': 'لا يهم', 'score': 0},
      ]
    },
    {
      'question': 'هل يعتبر شرب الماء الساخن مفيداً؟',
      'answers': [
        {'text': 'نعم، يساعد في تحسين الهضم', 'score': 1},
        {'text': 'لا، الماء البارد أفضل', 'score': 0},
        {'text': 'لا فرق بين الماء الساخن والبارد', 'score': 0},
      ]
    },
  ];

  void _answerQuestion(int score) {
    setState(() {
      _score += score;
      _currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الاختبار الصحي'),
        backgroundColor: Colors.teal,
      ),
      body: _currentQuestionIndex < _questions.length
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _questions[_currentQuestionIndex]['question'] as String,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal),
                  ),
                  SizedBox(height: 20),
                  ...( _questions[_currentQuestionIndex]['answers']
                         as List<Map<String, Object>>)
                      .map((answer) {
                    return ElevatedButton(
                      onPressed: () =>
                          _answerQuestion(answer['score'] as int),
                      child: Text(
                        answer['text'] as String,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'نتيجتك: $_score / ${_questions.length}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _score = 0;
                        _currentQuestionIndex = 0;
                      });
                    },
                    child: Text('إعادة الاختبار'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
