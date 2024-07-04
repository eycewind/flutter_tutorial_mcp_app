import 'package:flutter/material.dart';
import 'package:mcq_app/data/questions.dart';
import 'package:mcq_app/questions_screen.dart';
import 'package:mcq_app/result_screen.dart';
import 'package:mcq_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({
    super.key,
  });

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  List<String> selectedAnswers = [];

  @override
  void initState() {
    activeScreen = StartScreen(() {
      switchScreen('');
    });
    super.initState();
  }

  void switchScreen(answer) {
    setState(() {
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
    });
  }

  void chooseAnswer(String answer) {
    answer == '' ? selectedAnswers : selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(
          restartQuiz: restartQuiz,
          chosenAnswers: selectedAnswers,
        );
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = StartScreen(() {
        switchScreen('');
        selectedAnswers = [];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepOrange, Colors.orange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
