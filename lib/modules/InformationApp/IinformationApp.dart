// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:ktm/shared/components/components.dart';

import 'GalleryScreen.dart';
class InformationApp extends StatelessWidget {
  const InformationApp({Key? key}) : super(key: key);


  callNumber() async {
    const number = '+201113809096';
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
  callToNumber() async {
    const number = '+201142670620';
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Center(
                child: CircleAvatar(
                  radius: 64,
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundImage: AssetImage('assets/images/logaApp1.jpg'),
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(child: Text(' Abo Elwafa',style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 25.0,
                color: Color.fromARGB(255, 62, 43, 235),

              ),)),
              SizedBox(height: 25.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('  مؤمن حمادة && خالد ابوالوفا:',style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 20,fontWeight: FontWeight.w700),),
                  SizedBox(width: 5.0,),
                  Text('الاسم',style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 20,color: Colors.blue),),

                ],
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('ترزي رجالى_ ، تصليح وتفصيل ملابس:',style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 20,fontWeight: FontWeight.w700),),
                  SizedBox(width: 5.0,),
                  Text('المهنة',style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 20,color: Colors.blue),),

                ],
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('اسيوط_منفلوط_نزةقرار_ش:النادي:',style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 20,fontWeight: FontWeight.w700),),
                  SizedBox(width: 5.0,),
                  Text('العنوان',style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 20,color: Colors.blue),),

                ],
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.arrow_downward_rounded,size: 20,),
                  SizedBox(width: 15.0,),
                  Text('للطلب والاستفسار يرجي التواصل ع الارقام التالية',style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 18,color: Colors.blue),),

                ],
              ),
              SizedBox(height: 20.0,),
              Row(
                children: [
                  IconButton(onPressed:  callNumber , icon: Icon(Icons.call,color: Colors.grey,size: 35,)),
                  InkWell(
                    child: Text('+201113809096',style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),),
                    onTap: callNumber,
                  )
                ],
              ),
              SizedBox(height: 10.0,),
              Row(
                children: [
                  Container(
                      color: Colors.white,
                      child: IconButton(onPressed:  callNumber , icon: Icon(Icons.call,color: Colors.grey,size: 35,))),
                  InkWell(
                    child: Text('+201142670620',style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),),
                    onTap: callToNumber,
                  )
                ],
              ),
              SizedBox(height: 25.0,),
              Text('معرض الصور',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w800),),
              Container(
                  height: 100.0,
                  width: 100.0,

                  color: Colors.redAccent,
                  child: IconButton(onPressed: (){
                    navigateTo(context, GalleryScreen());
                  }, icon: Icon(Icons.photo_outlined,color: Colors.white,size: 80.0,))),
            ],
          ),
        ),
      ),
    );
  }
}

