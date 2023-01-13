// ignore_for_file: unused_import, unnecessary_import, deprecated_member_use, must_be_immutable

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktm/layout/cubit/cubit.dart';
import 'package:ktm/layout/cubit/states.dart';
import 'package:ktm/shared/components/constants.dart';
import 'package:ktm/shared/network/bloc_observed.dart';
import 'package:ktm/shared/network/local/cacheHelper.dart';
import 'layout/TailorLayoutScreen.dart';
import 'modules/Login/Tailor_Login_Screen.dart';
import 'modules/OnBoarding/OnBoardingTailor.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await cacheHelper.init();
  Widget? widget;
   bool? onBoarding= cacheHelper.getData(key: 'onBoarding');
  uId = cacheHelper.getData(key: 'uId') ;
  print(uId);

   print(onBoarding);

   if(onBoarding!=null)
     {
       if(uId!=null)
       {
         widget=TailorLayout();
       }
       else
       {
         widget=TailorLoginScreen();
       }

     }
   else{
     widget=OnBoardingTailorScreen();
   }


  runApp( MyApp(
    StartWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  late Widget StartWidget;
   MyApp(
       {
         required this.StartWidget,
       }
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context) =>TailorCubit()..getUserData()..getProducts()),
      ],
      child: BlocConsumer<TailorCubit,TailorStates>
        (
        listener: (context, state) {

        },
        builder: (context, state) {

          return MaterialApp(
            title: 'KTM',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                backgroundColor:Colors.white,
                elevation: 0.0,
                backwardsCompatibility: false,
                // systemOverlayStyle:SystemUiOverlayStyle(
                //   statusBarColor: Colors.white,
                //   statusBarIconBrightness: Brightness.dark,
                // ),
                titleTextStyle: TextStyle(
                  color:Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'NUnit',
                ),

                iconTheme: IconThemeData(
                    color: Colors.blue,
                    size: 30.0
                ),
              ),
              // body text
              textTheme:  const TextTheme(
                  bodyText2: TextStyle(
                      color: Colors.black,
                      fontFamily: 'NUnit',
                      fontWeight: FontWeight.bold
                  ),
                  subtitle1: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.3,
                      fontFamily: 'NUnit'

                  ),
                  subtitle2: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NUnit'
                  ),
                  bodyText1: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.4,
                      fontFamily: 'NUnit'
                  ),
                  caption: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    height: 2.0,
                  )
              ),
              inputDecorationTheme: const InputDecorationTheme(
                hintStyle: TextStyle(
                  fontSize: 14.0,
                ),
                labelStyle: TextStyle(
                  fontSize: 18.0,
                ),
              ),


              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                unselectedIconTheme: IconThemeData(
                    color: Colors.grey,
                    size: 30.0
                ),
                selectedIconTheme: IconThemeData(size: 35.0,color: Colors.blue,),
                showUnselectedLabels: true,
                elevation: 20.0,

              ),

            ),

            home: StartWidget,
          );
        },
      ),
    );
  }
}

