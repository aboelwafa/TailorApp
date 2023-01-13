// ignore_for_file: must_be_immutable, body_might_complete_normally_nullable, import_of_legacy_library_into_null_safe, unused_import

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktm/models/TailorUserModel.dart';
import 'package:ktm/shared/network/local/cacheHelper.dart';
import 'package:lottie/lottie.dart';

import '../../layout/TailorLayoutScreen.dart';
import '../../shared/components/components.dart';
import '../Register/Tailor_Register_Screen.dart';
import 'Login_Cubit/cuibt.dart';
import 'Login_Cubit/state.dart';
class TailorLoginScreen extends StatelessWidget {
  var formkey=GlobalKey<FormState>();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return  BlocProvider(
      create: (context) => TailorLoginCubit(),
      child: BlocConsumer<TailorLoginCubit,TailorLoginStates>(
        listener: (context, state) {
          if(state is TailorLoginSucessStates)
          {
            cacheHelper.saveData(
                  key: 'uId',
                  value: state.uId
              ).then((value)
              {
                print('LoginScreen');
                print(state.uId);
                showToast(
                  text: 'تم تسجيل الدخول بنجاح',
                  state: Toaststate.SUCCESS,
                );
                navigateAndFinish(context, TailorLayout());
              });
          }
          else if(state is TailorLoginErrorStates)
          {
            showToast(
              text: state.error.toString(),
              state: Toaststate.ERROR,
            );
          }
        },
        builder: (context, state) {
      return Scaffold(
                appBar: AppBar(),
                body: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:<Widget> [
                            Center(
                              child: Text('تسجيل دخول',
                              style: Theme.of(context).textTheme.headline5!.copyWith(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600
                              ),
                              ),
                            ),

                            Center(
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    'سجل دخول الان لمشاهدة افضل المنتجات',

                                    textStyle:Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.grey,
                                    ),
                                    speed: const Duration(seconds: 1),
                                  ),
                                ],

                              ),
                            ),

                            SizedBox(height: 10.0,),
                            Lottie.network('https://assets1.lottiefiles.com/packages/lf20_KvK0ZJBQzu.json',
                              height: 300.0,
                              //fit: BoxFit.cover,
                              width: double.infinity,
                              repeat: true,
                              animate: true,
                              reverse: true,
                            ),
                            // Text('LOGIN',
                            // style: Theme.of(context).textTheme.headline4!.copyWith(
                            //   color: Colors.black,
                            //   fontWeight: FontWeight.w600
                            // ),
                            // ),
                          //  SizedBox(height: 10.0,),


                            SizedBox(height: 30.0,),
                            DefaultFormField(
                              controller: emailController,
                                type: TextInputType.emailAddress,
                                 label: 'البريد الابكتروني',
                                  prefix: Icons.email,
                                  validate:(value) {
                                    if(value!.isEmpty)
                                    {
                                      return ' برجاء ادخال بريدك الالكتروني';
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
                              suffix: TailorLoginCubit.get(context).suffix,
                              IsPassword: TailorLoginCubit.get(context).IsPassword,
                              SuffixPress: () {
                              TailorLoginCubit.get(context).ChangePassword();
                              },
                              onSubmit: (value) {
                              if(formkey.currentState!.validate())
                              {
                               TailorLoginCubit.get(context).userLogin(
                               email: emailController.text,
                               password: passwordController.text
                               );
                              }
                                  },
                                  validate:(value) {
                                    if(value!.isEmpty){
                                    return ' برجاء ادخال كلمة المرور';
                                    }
                                  },
                                  ),
                            SizedBox(height: 40.0,),
                            ConditionalBuilder(
                                    condition: state is! TailorLoginLoadingStates ,
                                    builder: (context) => defaultButton(
                                    function: (){
                                        if(formkey.currentState!.validate())
                                        {
                                        TailorLoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text
                                         );

                                        }
                                      },
                                       text: 'تسجيل دخول'),
                                       fallback: (context) => Center(child: CircularProgressIndicator()),
            
                                  ),
                            SizedBox(height: 20.0,),
                            Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [

                                      defaultTextButton(
                                      function: () {
                                       navigateTo(context, TailorRegisterScreen());
                                      },
                                      text: 'اعمل حساب محدش هيعملك',
                                      ),
                                        SizedBox(width: 20.0,),
                                        Text('ليس لديك حساب ؟',style: TextStyle(color: Colors.black,fontSize: 15.0),),

                                      ],
                                    ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            );
       },),
    );
  }
}