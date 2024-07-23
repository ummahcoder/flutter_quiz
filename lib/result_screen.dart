import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/questions_summary.dart';
import 'package:flutter_quiz/quiz.dart';
import 'package:flutter_quiz/start_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = summaryData.where((data) {
      return data["user_answer"] == data["correct_answer"];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrectQuestion out of $numTotalQuestion questions correctly!",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(height: 30),
            Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Quiz()));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.restart_alt_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                      Text(
                        "Restart Quiz!",
                        style:
                            GoogleFonts.lato(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
