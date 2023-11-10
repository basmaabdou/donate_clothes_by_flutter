

import '../../../models/users_model.dart';

abstract class UserStates{}

class InitialLogin extends UserStates{}

class LoginLoadingState extends UserStates{}

class LoginSuccessState extends UserStates{
  final UserModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends UserStates{
  final String error;

  LoginErrorState(this.error);

}

class LoginPasswordChangeState extends UserStates{}

//register
class RegisterLoadingState extends UserStates{}

class RegisterSuccessState extends UserStates{
  final UserModel loginModel;

  RegisterSuccessState(this.loginModel);
}

class RegisterErrorState extends UserStates{
  final String error;

  RegisterErrorState(this.error);

}

class RegisterPasswordChangeState extends UserStates{}


class CreateUserSuccessState extends UserStates {}

class CreateUserErrorState extends UserStates
{
  final String error;

  CreateUserErrorState(this.error);
}
