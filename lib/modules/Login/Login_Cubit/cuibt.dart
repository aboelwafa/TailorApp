// ignore_for_file: avoid_print, unnecessary_string_interpolations, unnecessary_import, duplicate_import, unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktm/modules/Login/Login_Cubit/state.dart';
import 'package:ktm/shared/network/local/cacheHelper.dart';


class TailorLoginCubit extends Cubit<TailorLoginStates>
{
  TailorLoginCubit():super(TailorLoginIntialStates());
  

  static TailorLoginCubit get(context)=>BlocProvider.of(context);
    //make obj

 
    // هنا اخد اوبجكت من 
    // TailorLoginModel
      // اوبجكت فاضي وهملاه تحت
  void userLogin({
    required String email,
    required String password,
  })
   {
    emit(TailorLoginLoadingStates());

    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
       password: password
       ).then((value) {
          cacheHelper.saveData(
              key: 'uId',
              value: value.user?.uid
          );
          print(value.user?.uid);
          print('user uid');
        emit(TailorLoginSucessStates(value.user!.uid));
      }).catchError((error){
        print(error.toString());
        emit(TailorLoginErrorStates(error.toString()));
              });

   }


// to swap password hide password and visible
  IconData suffix=Icons.visibility_off_outlined;
  bool IsPassword=true;
  void ChangePassword(){
    
    IsPassword=!IsPassword;
     suffix= IsPassword ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordState());
  }
}
// finally go to login screen and convert it to bloc-provider an consumer