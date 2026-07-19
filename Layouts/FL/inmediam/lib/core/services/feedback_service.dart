import 'package:flutter/material.dart';

enum FeedbackType { success, error, info }

class FeedbackService {
  static final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static void showMessage(
    String message, {
    FeedbackType type = FeedbackType.info,
  }) {
    final messenger = messengerKey.currentState;

    if (messenger == null) return;

    messenger.clearSnackBars();

    Color backgroundColor;
    IconData icon;

    switch (type) {
      case FeedbackType.success:
        backgroundColor = Colors.green.shade700;
        icon = Icons.check_circle_outline;
        break;
      case FeedbackType.error:
        backgroundColor = Colors.red.shade700;
        icon = Icons.error_outline;
        break;
      case FeedbackType.info:
        backgroundColor = const Color(0xFFF15A24);
        icon = Icons.info_outline;
        break;
    }

    messenger.showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
