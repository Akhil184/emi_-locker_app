abstract class EmiEvent {}

class FetchEmis extends EmiEvent {

  final String userId;
  final String token;

  FetchEmis(this.userId, this.token);
}