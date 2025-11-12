import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Exam> exams = [
    Exam(
      subjectName: "Object oriented programming",
      dateTime: DateTime(2024, 1, 15, 9, 0),
      rooms: ["LAB138", "LAB215"],
    ),
    Exam(
      subjectName: "Algorithms and Data structures",
      dateTime: DateTime(2024, 1, 17, 14, 0),
      rooms: ["LAB 2"],
    ),
    Exam(
      subjectName: "Databases",
      dateTime: DateTime(2024, 1, 20, 10, 30),
      rooms: ["LAB 13", "LAB 12"],
    ),
    Exam(
      subjectName: "Web Programming",
      dateTime: DateTime(2024, 1, 22, 16, 0),
      rooms: ["LAB 215"],
    ),
    Exam(
      subjectName: "Operating Systems",
      dateTime: DateTime(2024, 1, 25, 9, 0),
      rooms: ["LAB 117"],
    ),
    Exam(
      subjectName: "Computer Networks",
      dateTime: DateTime(2024, 1, 28, 11, 0),
      rooms: ["LAB 3", "LAB 2"],
    ),
    Exam(
      subjectName: "Software Engineering",
      dateTime: DateTime(2026, 1, 30, 13, 30),
      rooms: ["E101"],
    ),
    Exam(
      subjectName: "Advanced programming",
      dateTime: DateTime(2025, 2, 2, 15, 0),
      rooms: ["LAB 200AB"],
    ),
    Exam(
      subjectName: "Machine Learning",
      dateTime: DateTime(2025, 3, 5, 10, 0),
      rooms: ["LAB 200V"],
    ),
    Exam(
      subjectName: "Algorithm Design",
      dateTime: DateTime(2026, 2, 8, 12, 0),
      rooms: ["LAB 200AB", "LAB 200V"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Sort exams chronologically
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    final int passedExamsCount = exams.where((exam) => exam.dateTime.isBefore(DateTime.now())).length;
    final int totalExamsCount = exams.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("EXAM SCHEDULE - 211559 - VIKTOR KRSTEVSKI"),
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) {
                return ExamCard(
                  exam: exams[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExamDetailScreen(exam: exams[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border(top: BorderSide(color: Colors.grey[300]!)),
            ),
            child: Badge(
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              child: Text(
                "TOTAL EXAMS :) : $totalExamsCount",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}