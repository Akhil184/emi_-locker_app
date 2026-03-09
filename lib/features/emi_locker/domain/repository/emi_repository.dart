import '../entities/emi_status.dart';

abstract class EmiRepository {

  Future<List<EmiStatus>> getEmis();
}