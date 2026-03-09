import '../../domain/entities/emi_status.dart';

abstract class EmiState {}

class EmiInitial extends EmiState {}

class EmiLoading extends EmiState {}

class EmiLoaded extends EmiState {
  final List<EmiStatus> emis;

  EmiLoaded(this.emis);
}

class EmiLocked extends EmiState {}   // ✅ ADD THIS

class EmiError extends EmiState {
  final String message;

  EmiError(this.message);
}