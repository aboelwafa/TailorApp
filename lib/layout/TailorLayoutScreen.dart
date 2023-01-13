import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktm/layout/cubit/cubit.dart';
import 'package:ktm/layout/cubit/states.dart';

class TailorLayout extends StatelessWidget {
  const TailorLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TailorCubit,TailorStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit=TailorCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Center(child: Text(cubit.titles[cubit.currentIndex])),

          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0.0,
            type: BottomNavigationBarType.fixed,
            onTap: (index){
              cubit.ChangeBottom(index);
            },
            currentIndex: cubit.currentIndex,
            items:  [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home,),
                  label: 'الصفحة الرئيسية'

              ),

              BottomNavigationBarItem(
                  icon: Icon(Icons.info_outline,),
                  label: 'معلومات'

              ),

              if(TailorCubit.get(context).userModel?.uId=='tAf0rU5vVrRClvcDTp5pvOJCB6T2')

                BottomNavigationBarItem(
                  icon: Icon(Icons.group,),
                  label: 'العملاء'

              ),
              if(TailorCubit.get(context).userModel?.uId=='tAf0rU5vVrRClvcDTp5pvOJCB6T2')

                BottomNavigationBarItem(
                  icon: Icon(Icons.person_add_alt,),
                  label: 'اضافة عميل'

              ),
             if(TailorCubit.get(context).userModel?.uId=='tAf0rU5vVrRClvcDTp5pvOJCB6T2')
                BottomNavigationBarItem(
                  icon: Icon(Icons.group,),
                  label: 'اضافة منتج'

              ),


            ],
          ),
        );
      },
    );
  }
}
