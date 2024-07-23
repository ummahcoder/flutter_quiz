import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/questions_screen.dart';
import 'package:flutter_quiz/result_screen.dart';
import 'package:flutter_quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  void switchScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "question-screen") {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == "result-screen") {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 102, 19, 158),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
