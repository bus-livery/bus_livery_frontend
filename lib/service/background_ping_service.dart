import 'dart:async';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:workmanager/workmanager.dart';
import 'package:livery/service/dio_service.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    try {
      final response = await http.get(Uri.parse(DioService.baseUrl));
      log(
        "Background Ping Result: Status ${response.statusCode}",
        name: "BackgroundPing",
      );
      return true;
    } catch (e) {
      log("Background Ping Failed: $e", name: "BackgroundPing", error: e);
      return false;
    }
  });
}

class BackgroundPingService {
  BackgroundPingService._();

  static Timer? _timer;

  static void initialize() {
    // 1. Initialize Workmanager for background/terminated execution
    Workmanager().initialize(callbackDispatcher);

    // Register a periodic task running every 15 minutes (Android's minimum limit)
    Workmanager().registerPeriodicTask(
      "render-keep-alive-task",
      "pingRenderServer",
      frequency: const Duration(minutes: 15),
      existingWorkPolicy: ExistingPeriodicWorkPolicy.keep,
    );

    // 2. Start foreground timer running every 10 minutes when app is active
    _startForegroundTimer();
  }

  static void _startForegroundTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(minutes: 10), (timer) async {
      try {
        final response = await http.get(Uri.parse(DioService.baseUrl));
        log(
          "Foreground Active Ping Result: Status ${response.statusCode}",
          name: "BackgroundPing",
        );
      } catch (e) {
        log(
          "Foreground Active Ping Failed: $e",
          name: "BackgroundPing",
          error: e,
        );
      }
    });
  }

  static void dispose() {
    _timer?.cancel();
  }
}
