import 'dart:async';
import 'package:flutter/material.dart';
import '../models/medicine_model.dart';

class AlarmService {
  static Timer? _timer;
  static final Set<DateTime> _triggered = {};

  static void start(BuildContext context, List<Medicine> medicines) {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      final now = DateTime.now();

      for (final medicine in medicines) {
        final scheduled = medicine.time;

        if (_triggered.contains(scheduled)) continue;

        if (now.hour == scheduled.hour && now.minute == scheduled.minute) {
          _triggered.add(scheduled);
          _showPopup(context, medicine);
        }
      }
    });
  }

  static void _showPopup(BuildContext context, Medicine medicine) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text('⏰ Medicine Reminder'),
        content: Text(
          'Time to take:\n\n'
          '${medicine.name}\n'
          'Dose: ${medicine.dose}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  static void stop() {
    _timer?.cancel();
  }
}
