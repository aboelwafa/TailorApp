// ignore_for_file: non_constant_identifier_names


abstract class TailorRegisterStates{}

class TailorRegisterIntialStates extends TailorRegisterStates{}

class TailorRegisterLoadingStates extends TailorRegisterStates{}

class TailorRegisterSucessStates extends TailorRegisterStates{
  //  final TailorLoginModel LoginModel;

  //  TailorRegisterSucessStates(this.LoginModel);
}

class TailorRegisterErrorStates extends TailorRegisterStates{
  final String error;

  TailorRegisterErrorStates(this.error);
}
class TailorCreateUserSucessStates extends TailorRegisterStates{
  //  final TailorLoginModel LoginModel;

  //  TailorRegisterSucessStates(this.LoginModel);
}

class TailorCreateUserErrorStates extends TailorRegisterStates{
  final String error;

  TailorCreateUserErrorStates(this.error);
}

class ChangePasswordVisibalityState extends TailorRegisterStates{}




class TailorRegisterSucessUserStates extends TailorRegisterStates{}
