import 'package:stack_trace/stack_trace.dart';
import 'dart:developer';

class Logger {
  static void printOut(String msg) async {
    if (msg.isNotEmpty) {
      try {
        final now = DateTime.now();
        String time = '${now.hour}:${now.minute}:${now.second}';
        String? screen = Trace.current().frames[2].member?.split(".")[0];
        String? widget = Trace.current().frames[2].member?.split(".")[1];
        String prefix = '[$time - $screen - $widget]';
        log('$prefix::: $msg');
      } catch (error) {
        log(msg);
      }
    }
  }
}

// enum Type {
//   DEBUG,
//   INFO,
//   WARNING,
//   ERROR,
// }
