abstract class RegisterStates {

}
class RegisterInitialStates extends RegisterStates
{

}

class RegisterLoadingStates extends RegisterStates
{

}
class RegisterSuccessStates extends RegisterStates
{

}
class RegisterErrorStates extends RegisterStates
{
  final String error;
  RegisterErrorStates(this.error);

}
class CreateUserSuccessStates extends RegisterStates
{

}
class CreateUserErrorStates extends RegisterStates
{
  final String error;
  CreateUserErrorStates(this.error);

}
class RegisterChangePasswordVisibilityStates extends RegisterStates
{

}
