// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, import_of_legacy_library_into_null_safe, unused_import, body_might_complete_normally_nullable, unnecessary_type_check, avoid_print, duplicate_import

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../shared/components/components.dart';
import '../Login/Tailor_Login_Screen.dart';
import 'Social_Register_Cubit/cuibt.dart';
import 'Social_Register_Cubit/state.dart';
class TailorRegisterScreen extends StatelessWidget {
  var formkey=GlobalKey<FormState>();
  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
    var phoneController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>TailorRegisterCubit() ,
      child: BlocConsumer<TailorRegisterCubit,TailorRegisterStates>(
        listener: (context, state) {
           if(state is TailorCreateUserSucessStates )
           {

             showToast(
                 text: 'تم انشاء مستخدم بنجاح',
                 state: Toaststate.SUCCESS
             );
            navigateAndFinish(context, TailorLoginScreen());
           }
           else if(state is TailorCreateUserErrorStates)
           {
             showToast(
                 text: state.error,
                 state: Toaststate.ERROR
             );
           }

         },
        builder: (context, state) {
          
          return Scaffold(
          appBar: AppBar(),
          body: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Center(
                              child: Text('انشاء حساب',
                              style: Theme.of(context).textTheme.headline4!.copyWith(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600
                              ),
                              ),
                            ),
                            SizedBox(height: 20.0,),
                            Text('هتعرف تعمل حساب ولا ',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.grey[700]
                              
                            ),
                            ),
                            SizedBox(height: 30.0,),
                             DefaultFormField(
                              controller: nameController,
                                type: TextInputType.name,
                                 label: 'اسم الباشا اي',
                                  prefix: Icons.person,
                                  validate:(value) {
                                    if(value!.isEmpty)
                                    {
                                      return 'بعد اذنك سجل اسمك ';
                                    }
                                  }, 
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                            DefaultFormField(
                              controller: emailController,
                                type: TextInputType.emailAddress,
                                 label: 'البريد الالكتروني',
                                  prefix: Icons.email,
                                  validate:(value) {
                                    if(value!.isEmpty)
                                    {
                                      return 'اكتب ايميلك ';
                                    }
                                  }, 
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                   DefaultFormField(
                              controller: passwordController,
                                type: TextInputType.visiblePassword,
                                 label: 'كلمة المرور',
                                  prefix: Icons.lock,
                                  suffix: TailorRegisterCubit.get(context).suffix,
                                  SuffixPress: () {
                                    TailorRegisterCubit.get(context).changepassword();
                                  },
                                  onSubmit: (value) {
                                     
                                  },
                                  validate:(value) {
                                    if(value!.isEmpty){
                                      return 'ادخل كلمة المرور ';
                                    }
                                  },
                                  IsPassword: TailorRegisterCubit.get(context).ispassword,
                                    
                                    
                                  ),
                                  SizedBox(height: 20,),
                                  DefaultFormField(
                              controller: phoneController,
                                type: TextInputType.phone,
                                 label: 'رقم الهاتف',
                                  prefix: Icons.phone,
                                  validate:(value) {
                                    if(value!.isEmpty)
                                    {
                                      return ' اكتب رقم الهاتف ';
                                    }
                                  }, 
                                  ),
                                  SizedBox(height: 40.0,),
                                  ConditionalBuilder(
                                     condition: state is! TailorRegisterLoadingStates ,
                                    builder: (context) =>

                                        Center(
                                          child: defaultButton(
                                      width: 250.0,
                                      height: 50.0,
                                      radius: 40.0,
                                      function: (){
                                          if(formkey.currentState!.validate())
                                          {
                                            TailorRegisterCubit.get(context).userRegister(
                                              name: nameController.text,
                                            email: emailController.text,
                                           password: passwordController.text,
                                           phone: phoneController.text,
                                           );
                                          }
                                      },
                                       text: 'تسجيل حساب'),
                                        ),
                                       fallback: (context) => Center(child: CircularProgressIndicator()),
            
                                  ),
                                  SizedBox(height: 20.0,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [

                                      TextButton(onPressed: (){
                                        navigateTo(context, TailorLoginScreen());
                                      }, child: Text('تسجيل دخول',style: TextStyle(fontSize: 18.0),)),
                                        SizedBox(width: 25.0,),
                                      Text('هل لديك حساب؟',style: Theme.of(context).textTheme.bodyText1,),
                                    ],
                                  ),
                                    
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        );
        },
        
      ),
    );
  }
}