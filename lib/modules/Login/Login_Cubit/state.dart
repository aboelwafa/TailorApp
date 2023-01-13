// prevent take object=> abstract
abstract class TailorLoginStates{}
// create 4 states use them in cubit file
class TailorLoginIntialStates extends TailorLoginStates{}

class TailorLoginLoadingStates extends TailorLoginStates{}

class TailorLoginSucessStates extends TailorLoginStates{
  final String uId;


  TailorLoginSucessStates(this.uId);
}

class TailorLoginErrorStates extends TailorLoginStates{
  final String error;

  TailorLoginErrorStates(this.error);
}



// state to know change visible password
class ChangePasswordState extends TailorLoginStates{}
