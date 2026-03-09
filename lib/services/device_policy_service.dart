import 'package:flutter/services.dart';

class DevicePolicyService {

  static const MethodChannel _channel =
  MethodChannel("emi/device_policy");

  Future<void> lockDevice() async {
    try {
      await _channel.invokeMethod("lockDevice");
    } catch (e) {
      print("Lock error: $e");
    }
  }

  Future<void> unlockDevice() async {
    try {
      await _channel.invokeMethod("unlockDevice");
    } catch (e) {
      print("Unlock error: $e");
    }
  }
}