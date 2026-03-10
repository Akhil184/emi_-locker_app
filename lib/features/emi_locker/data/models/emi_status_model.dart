import '../../domain/entities/emi_status.dart';

class EmiStatusModel extends EmiStatus {
  EmiStatusModel({
    required String id,
    required double amount,
    required String status,
    required int paidInstallments,
    required int totalInstallments,
  }) : super(
    id: id,
    amount: amount,
    status: status,
    paidInstallments: paidInstallments,
    totalInstallments: totalInstallments,
  );

  factory EmiStatusModel.fromJson(Map<String, dynamic> json) {
    return EmiStatusModel(
      id: json["_id"] ?? "",
      amount: (json["totalAmount"] as num?)?.toDouble() ?? 0,
      status: json["status"] ?? "",
      paidInstallments: json["paidInstallments"] ?? 0,
      totalInstallments: json["totalInstallments"] ?? 0,
    );
  }
}