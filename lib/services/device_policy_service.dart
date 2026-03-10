import 'package:flutter/services.dart';

class DevicePolicyService {

  static const MethodChannel _channel =
  MethodChannel("emi/device_policy");

  static Future<void> lockDevice() async {
    try {
      await _channel.invokeMethod("lockDevice");
    } catch (e) {
      print("Lock error: $e");
    }
  }

  static Future<void> blockUninstall() async {
    try {
      await _channel.invokeMethod("blockUninstall");
    } catch (e) {
      print("Uninstall block error: $e");
    }
  }

  static Future<void> startKioskMode() async {
    try {
      await _channel.invokeMethod("startKioskMode");
    } catch (e) {
      print("Kiosk mode error: $e");
    }
  }
}