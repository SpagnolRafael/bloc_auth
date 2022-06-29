abstract class LoginEvent {}

class OnLoginEvent extends LoginEvent {
  final user;
  final password;

  OnLoginEvent({required this.user, required this.password});
}
