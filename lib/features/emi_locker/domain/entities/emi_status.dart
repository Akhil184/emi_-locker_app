class EmiStatus {
  final String id;
  final double amount;
  final String status;
  final int paidInstallments;
  final int totalInstallments;

  EmiStatus({
    required this.id,
    required this.amount,
    required this.status,
    required this.paidInstallments,
    required this.totalInstallments,
  });
}