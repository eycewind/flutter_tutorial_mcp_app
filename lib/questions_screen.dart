import 'package:flutter/material.dart';
import 'package:mcq_app/answer_button.dart';
import 'package:mcq_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentIndex = 0;

  answerQuestion() {
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledList().map((answer) {
              return AnswerButton(answerText: answer, onTap: answerQuestion);
            }),
          ],
        ),
      ),
    );
  }
}
