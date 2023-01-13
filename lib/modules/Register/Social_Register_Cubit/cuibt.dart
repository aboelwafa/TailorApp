// ignore_for_file: avoid_print, unnecessary_string_interpolations, unnecessary_import, unused_import, duplicate_import, unused_local_variable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktm/models/TailorUserModel.dart';
import 'package:ktm/modules/Register/Social_Register_Cubit/state.dart';
class TailorRegisterCubit extends Cubit<TailorRegisterStates>
{
  TailorRegisterCubit():super(TailorRegisterIntialStates());
  

  static TailorRegisterCubit get(context)=>BlocProvider.of(context);

   void userRegister({
     String? name,
     String? password,
     String? email,
     String? phone,
  })
   { 
    emit(TailorRegisterLoadingStates());
  FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: '${email}',
     password: '${password}'
     ).then((value) {
        UserCreate(
          email: '${email}',
          name: '${name}',
          phone: '${phone}',
          uId: value.user?.uid
          );
      emit(TailorRegisterSucessUserStates());
     }).catchError((error){
        print(error.toString());
      emit(TailorRegisterErrorStates(error.toString()));
     });
  }

  void UserCreate({
     required String? name,
    required String? email,
    required String? phone,
    required String? uId,

  })
  {
    TailorUserModel model=TailorUserModel(
      name: '${name}',
      email: '${email}',
      phone: '${phone}',
      uId: '${uId}',
     
    );

    FirebaseFirestore.instance
    .collection('USERS')
    .doc(uId)
    .set(model.toMap())
    .then((value) {
      emit(TailorCreateUserSucessStates());
    }).catchError((error){
      print(error.toString());
      emit(TailorCreateUserErrorStates(error.toString()));
    });
  }
// to swap password hide password and visiable
  IconData suffix=Icons.visibility_outlined;
  bool ispassword=true;
  void changepassword(){
    
    ispassword=!ispassword;
    suffix= ispassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(ChangePasswordVisibalityState());
  }
}
// finaly go to login screen and convert it to blocprovider an consumer