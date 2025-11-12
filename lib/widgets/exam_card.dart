import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({
    Key? key,
    required this.exam,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isPast = exam.dateTime.isBefore(DateTime.now());
    final Color cardColor = isPast ? Colors.grey[300]! : Colors.white;
    final Color textColor = isPast ? Colors.grey[600]! : Colors.black;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 3.0,
      color: cardColor,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exam.subjectName,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16.0,
                    color: textColor,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    "${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}",
                    style: TextStyle(color: textColor),
                  ),
                  const SizedBox(width: 16.0),
                  Icon(
                    Icons.access_time,
                    size: 16.0,
                    color: textColor,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    "${exam.dateTime.hour.toString().padLeft(2, '0')}:${exam.dateTime.minute.toString().padLeft(2, '0')}",
                    style: TextStyle(color: textColor),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 16.0,
                    color: textColor,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    exam.rooms.join(", "),
                    style: TextStyle(color: textColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}