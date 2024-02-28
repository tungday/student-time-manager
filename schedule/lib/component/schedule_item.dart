import 'package:flutter/material.dart';

class ScheduleItem extends StatelessWidget {
  final String text;
  final String subject;
  final String teacher;
  final String room;
  final int fontSize;

  const ScheduleItem({
    Key? key,
    required this.text,
    required this.subject,
    required this.teacher,
    required this.room,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withOpacity(0.6),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize:fontSize.toDouble(),
                  fontWeight: FontWeight.w700,
                  color:  Color(0xFF2C5BF2),
                ),
              ),
            ),
            const VerticalDivider(
              color: Colors.black,
              width: 1,
              thickness: 0.1,
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.only(top: 5, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subject,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text("Giảng viên: ${(teacher)}"),
                    Text("Phòng học: ${(room)}"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
