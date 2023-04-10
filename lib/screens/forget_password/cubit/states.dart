abstract class ForgetStates {

}
class ForgetInitialStates extends ForgetStates
{

}
class ForgetSuccessStates extends ForgetStates
{

}
class ForgetErrorStates extends ForgetStates
{
  final String error;
  ForgetErrorStates(this.error);

}