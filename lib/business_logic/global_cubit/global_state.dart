part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class ChangeLoginPassObscureGlobalState extends GlobalState {}

class ChangeSignUpPassObscureGlobalState extends GlobalState {}

class ChangeSignUpConfirmObscureGlobalState extends GlobalState {}

class ChangeIsArabicGlobalState extends GlobalState {}

class UserLoadingLoginGlobalState extends GlobalState {}

class UserLoginSuccessGlobalState extends GlobalState {
  final AccountModel accountModel;

  UserLoginSuccessGlobalState( this.accountModel);
}

class UserLoginErrorGlobalState extends GlobalState {
  final error;

  UserLoginErrorGlobalState(this.error);
}

class GlobalUserLogOut extends GlobalState {}

class UserLoadingSignUpGlobalState extends GlobalState {}

class UserSignUpSuccessGlobalState extends GlobalState {
  final UserModel userModel;

  UserSignUpSuccessGlobalState(this.userModel);
}
class UserSignUpErrorGlobalState extends GlobalState {
  final error;

  UserSignUpErrorGlobalState(this.error);
}

