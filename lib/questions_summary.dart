import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    child: Text(
                      ((data["question_index"] as int) + 1).toString(),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data["question"] as String,
                          style: GoogleFonts.lato(
                              color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          data["user_answer"] as String,
                          style: GoogleFonts.lato(
                              color: Colors.redAccent, fontSize: 14),
                        ),
                        Text(
                          data["correct_answer"] as String,
                          style: GoogleFonts.lato(
                              color: Colors.greenAccent, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
