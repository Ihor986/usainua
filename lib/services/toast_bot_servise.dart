// import 'package:bot_toast/bot_toast.dart';

import 'package:bot_toast/bot_toast.dart';

class ToastBot {
  static void showText({
    required String text,
    Duration? duration,
  }) {
    BotToast.showText(
      text: text,
      duration: duration ?? const Duration(seconds: 2),
    );
  }
}
