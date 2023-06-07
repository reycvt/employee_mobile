import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent {}

class AppCheck extends AuthEvent {}

class GetDataWithToken extends AuthEvent {
  final String token;
  GetDataWithToken(this.token);
  @override
  List<Object> get props => [token];
}

class LoggedOut extends AuthEvent {}

class LoginProccess extends AuthEvent {
  final String email;
  final String password;
  LoginProccess({required this.email, required this.password});
  @override
  List<Object> get props => [email, password];
}
