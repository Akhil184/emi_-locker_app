abstract class EmiEvent {}

class FetchEmis extends EmiEvent {

  final String userId;
  final String token;

  FetchEmis(this.userId, this.token);
}

class LockDeviceEvent extends EmiEvent {}

class UnlockDeviceEvent extends EmiEvent {}