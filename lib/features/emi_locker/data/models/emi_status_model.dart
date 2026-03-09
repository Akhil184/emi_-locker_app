import '../../domain/entities/emi_status.dart';

class EmiStatusModel extends EmiStatus {

  EmiStatusModel({
    required String id,
    required double amount,
    required String status,
  }) : super(id: id, amount: amount, status: status);

  factory EmiStatusModel.fromJson(Map<String, dynamic> json) {
    return EmiStatusModel(
      id: json["_id"],
      amount: (json["amount"] ?? 0).toDouble(),
      status: json["status"] ?? "",
    );
  }
}