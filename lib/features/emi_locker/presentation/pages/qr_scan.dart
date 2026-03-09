import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrEnrollPage extends StatelessWidget {
  const QrEnrollPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("QR Enrollment")),
      body: MobileScanner(
        onDetect: (BarcodeCapture capture) {
          final List<Barcode> barcodes = capture.barcodes;

          for (final barcode in barcodes) {
            final String? code = barcode.rawValue;

            if (code != null) {
              print("QR Code Data: $code");
            }
          }
        },
      ),
    );
  }
}