import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/general-ms/pomodoro/controller/pomodoro_controller.dart';

class CircularTimer extends StatelessWidget {
  final int initialDuration;
  final VoidCallback? onComplete;
  final PomodoroController controller;
  const CircularTimer(
      {super.key,
      required this.initialDuration,
      this.onComplete,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    controller.initialize(initialDuration);

    return Obx(() => SizedBox(
          width: 300,
          height: 300,
          child: Stack(
            children: [
              CustomPaint(
                size: const Size(300, 300),
                painter: TimerPainter(
                  progress:
                      1 - (controller.currentDuration.value / initialDuration),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SESSION ${controller.sessionCount}/${controller.totalSessions}',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      controller
                          .formatDuration(controller.currentDuration.value),
                      style: const TextStyle(
                          fontSize: 48, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'FINISHED AT ${controller.getFinishTime()}',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 10),
                    Text(
                      'WELL DONE!',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: IconButton(
                  onPressed: () {
                    controller.reset();
                  },
                  icon: Icon(Icons.restart_alt,
                      color: Colors.grey[400], size: 24),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings, color: Colors.grey[400], size: 24),
                ),
              ),
            ],
          ),
        ));
  }
}

class TimerPainter extends CustomPainter {
  final double progress;

  TimerPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;

    final backgroundPaint = Paint()
      ..color = Colors.grey.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    final foregroundPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    // Draw dotted background circle
    final pathBackground = Path();
    for (var i = 0; i < 360; i += 6) {
      final x1 = center.dx + radius * cos(i * pi / 180);
      final y1 = center.dy + radius * sin(i * pi / 180);
      final x2 = center.dx + (radius - 5) * cos(i * pi / 180);
      final y2 = center.dy + (radius - 5) * sin(i * pi / 180);
      pathBackground.moveTo(x1, y1);
      pathBackground.lineTo(x2, y2);
    }
    canvas.drawPath(pathBackground, backgroundPaint);

    // Draw progress arc
    final rect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(rect, -pi / 2, 2 * pi * progress, false, foregroundPaint);
  }

  @override
  bool shouldRepaint(TimerPainter oldDelegate) =>
      progress != oldDelegate.progress;
}
