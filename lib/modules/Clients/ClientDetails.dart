// ignore_for_file: unnecessary_import, must_be_immutable, unnecessary_null_comparison

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ktm/layout/cubit/cubit.dart';
import 'package:ktm/layout/cubit/states.dart';

import '../../models/ClientModel.dart';
import '../../shared/components/components.dart';

class ClientsDetailsScreen extends StatelessWidget {

  ClientModel? clientModel;

  ClientsDetailsScreen({
    this.clientModel
  });

  var nameController=TextEditingController();
  var PhoneController=TextEditingController();
  var LengthController=TextEditingController();
 var  WidthController=TextEditingController();
 var nickController=TextEditingController();
 var CenterController=TextEditingController();
 var BackController=TextEditingController();
  var  NumberController=TextEditingController();
   var DetailsController=TextEditingController();
var  TotalPriceController=TextEditingController();
 var   PaidPriceController=TextEditingController();
  var  RestPriceController=TextEditingController();
   var DateTimeController=TextEditingController();

   var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        TailorCubit.get(context).getDetailClient(name: '${clientModel?.name}');
        return BlocConsumer<TailorCubit, TailorStates>(
       listener: (context, state) {
        TailorCubit.get(context).detailsClients != null;
           if(state is TailorUpdateClientsSuccessStates)
                   {
                     TailorCubit.get(context).getClients();
                     showToast(text: 'تم تعديل البيانات بنجاح', state: Toaststate.SUCCESS);
                   }
                },
  builder: (context, state) {
         nameController.text='${clientModel?.name}';
         PhoneController.text='${clientModel?.phone}';
         LengthController.text='${clientModel?.length}';
         WidthController.text='${clientModel?.width}';
         nickController.text='${clientModel?.nick}';
         CenterController.text='${clientModel?.center}';
         BackController.text='${clientModel?.back}';
         NumberController.text='${clientModel?.number}';
         DetailsController.text='${clientModel?.details}';
         TotalPriceController.text='${clientModel?.totalPrice}';
         PaidPriceController.text='${clientModel?.paidPrice}';
         RestPriceController.text='${clientModel?.restPrice}';
         DateTimeController.text='${clientModel?.dateTime}';

         var model=TailorCubit.get(context).clientModel;
        return Scaffold(
          appBar: AppBar(
            title:
            Row(
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundImage: model?.ImageUrl !=null ? NetworkImage('${model?.ImageUrl}'):AssetImage('assets/images/client.jpg') as ImageProvider,
                ),
                SizedBox(width: 15.0,),
                Text('${clientModel?.name}',style: TextStyle(color: Colors.black),),
              ],
            ),
            //Text('${clientModel?.name}'),

          ),
          body: ConditionalBuilder(
            condition:true,
            builder:(context) => SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if(state is TailorUpdateClientsLoadingStates)
                      LinearProgressIndicator(
                        color: Colors.teal,
                      ),
                    if(state is TailorUpdateClientsLoadingStates)
                      SizedBox(height: 10.0,),
                    Center(child: Text('البيانات الشخصية',style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.blueAccent,fontSize: 20.0,fontWeight: FontWeight.bold),)),
                    SizedBox(height: 15.0,),
                    //name client
                    Row(
                      children: [
                        SizedBox(width: 290.0,
                        child:  defaultFormField(
                            controller: nameController,
                            validate: (value)
                            {
                              if(value!.isEmpty)
                              {
                                return "يرجي كتابة اسم العميل ";
                              }
                              if(value.length<3)
                              {
                                return "يجب ان لايقل عدد الحرف عن ثلاث حروف";
                              }
                              return null;
                            },
                            type: TextInputType.text,
                            label: 'اسم العميل'
                        ),
                        ),
                        SizedBox(width: 15.0,),
                        Text(':الاسم ',style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold,fontSize: 17.0),),
                      ],
                    ),
                    SizedBox(height: 15.0,),
                  // phone client
                    Row(
                      children: [
                        SizedBox(width: 290.0,
                          child:  defaultFormField(
                              controller: PhoneController,
                              validate: (value)
                              {
                                if(value!.isEmpty)
                                {
                                  return "يرجي كتابة رقم الهاتف ";
                                }
                                if(value.length<10)
                                {
                                  return "يجب ان لايقل رقم الهاتف عن 10 ارقام";
                                }
                                return null;
                              },
                              type: TextInputType.phone,
                              label: ' الهاتف'
                          ),
                        ),
                        SizedBox(width: 15.0,),
                        Text(':الهاتف ',style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold,fontSize: 16.0),),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      height: 4.0,
                      width: double.infinity,
                      color: Colors.grey[600],
                    ),
                    SizedBox(height: 5.0,),
                    Center(child: Text('المقاسات',style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.blueAccent,fontSize: 20.0,fontWeight: FontWeight.bold),)),
                    SizedBox(height: 15.0,),
                    //row1 len,wid
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 40,bottom: 10),
                            child: Text('الكم',style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold,fontSize: 17.0),),
                          ),
                          SizedBox( width: 169.0,
                            height: 100.0,
                            child: defaultFormField(
                              controller: WidthController,
                              validate: (value){
                                if(value!.isEmpty)
                                {
                                  return 'يجب ان يكون الحقل ممتلئ';
                                }
                                return null;
                              },
                              type: TextInputType.phone,
                              label: 'الكم',
                              suffix: Icons.numbers,
                            ),
                          ),
                        ],),
                        SizedBox(width: 15.0,),
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 40,bottom: 10),
                            child: Text('الطول',style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold,fontSize: 17.0),),
                          ),
                          SizedBox( width: 169.0,
                            height: 100.0,
                            child: defaultFormField(
                              controller: LengthController,
                              validate: (value){
                                if(value!.isEmpty)
                                {
                                  return 'يجب ان يكون الحقل ممتلئ';
                                }
                                return null;
                              },
                              type: TextInputType.phone,
                              label: 'الطول',
                              suffix: Icons.numbers,
                            ),
                          ),
                        ],),
                      ],
                    ),
                    // row2 center,nick
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 30,bottom: 10),
                            child: Text('الوسط',style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold,fontSize: 17.0),),
                          ),
                          SizedBox( width: 169.0,
                            height: 100.0,
                            child: defaultFormField(
                              controller: CenterController,
                              validate: (value){
                                if(value!.isEmpty)
                                {
                                  return 'يجب ان يكون الحقل ممتلئ';
                                }
                                return null;
                              },
                              type: TextInputType.phone,
                              label: 'الوسط',
                              suffix: Icons.numbers,
                            ),
                          ),
                        ],),
                        SizedBox(width: 15.0,),
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 40,bottom: 10),
                            child: Text('الرقبة',style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold,fontSize: 17.0),),
                          ),
                          SizedBox( width: 169.0,
                            height: 100.0,
                            child: defaultFormField(
                              controller: nickController,
                              validate: (value){
                                if(value!.isEmpty)
                                {
                                  return 'يجب ان يكون الحقل ممتلئ';
                                }
                                return null;
                              },
                              type: TextInputType.phone,
                              label: 'الرقبة',
                              suffix: Icons.numbers,
                            ),
                          ),
                        ],),
                      ],
                    ),
                    //row back
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 40,bottom: 10),
                            child: Text('الظهر',style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold,fontSize: 17.0),),
                          ),
                          SizedBox( width: 169.0,
                            height: 100.0,
                            child: defaultFormField(
                              controller: BackController,
                              validate: (value){
                                if(value!.isEmpty)
                                {
                                  return 'يجب ان يكون الحقل ممتلئ';
                                }
                                return null;
                              },
                              type: TextInputType.phone,
                              label: 'الظهر',
                              suffix: Icons.numbers,
                            ),
                          ),
                        ],),
                      ],
                    ),

                    Container(
                      height: 4.0,
                      width: double.infinity,
                      color: Colors.grey[600],
                    ),

                    Center(child: Text('مزيد التفاصيل',style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.blueAccent,fontSize: 20.0,fontWeight: FontWeight.bold),)),
                    //number request
                    Row(
                      children: [
                        SizedBox(width: 290.0,
                          child:  defaultFormField(
                              controller: NumberController,
                              validate: (value)
                              {
                                if(value!.isEmpty)
                                {
                                  return "يرجي كتابة عدد الطلب ";
                                }
                                return null;
                              },
                              type: TextInputType.phone,
                              label: 'عدد الطلبات'
                          ),
                        ),
                        SizedBox(width: 10.0,),
                        Text(':عدد الطلبات ',style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold,fontSize: 12.0),),
                      ],
                    ),
                    SizedBox(height: 15.0,),
                    // detail request client
                    Row(
                      children: [
                        SizedBox(width: 290.0,
                          child:  defaultFormField(
                              controller: DetailsController,
                              validate: (value)
                              {
                                if(value!.isEmpty)
                                {
                                  return "يرجي كتابة تفاصيل طلب العميل ";
                                }

                                return null;
                              },
                              type: TextInputType.text,
                              label: ' تفاصيل الطلب'
                          ),
                        ),
                        SizedBox(width: 15.0,),
                        Text(':تفاصيل ',style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold,fontSize: 16.0),),
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Container(
                      height: 4.0,
                      width: double.infinity,
                      color: Colors.grey[600],
                    ),
                    SizedBox(height: 5.0,),
                    Center(child: Text('حساب العميل',style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.blueAccent,fontSize: 20.0,fontWeight: FontWeight.bold),)),
                    SizedBox(height: 15.0,),
                    // total price and Paidprice
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 30,bottom: 10),
                            child: Text('تم استلام',style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold,fontSize: 17.0),),
                          ),
                          SizedBox( width: 169.0,
                            height: 100.0,
                            child: defaultFormField(
                              controller: PaidPriceController,
                              validate: (value){
                                if(value!.isEmpty)
                                {
                                  return 'يجب ان يكون الحقل ممتلئ';
                                }
                                return null;
                              },
                              type: TextInputType.phone,
                              label: '',
                              suffix: Icons.numbers,
                            ),
                          ),
                        ],),
                        SizedBox(width: 15.0,),
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 40,bottom: 10),
                            child: Text('المبلغ الكلى',style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold,fontSize: 17.0),),
                          ),
                          SizedBox( width: 169.0,
                            height: 100.0,
                            child: defaultFormField(
                              controller: TotalPriceController,
                              validate: (value){
                                if(value!.isEmpty)
                                {
                                  return 'يجب ان يكون الحقل ممتلئ';
                                }
                                return null;
                              },
                              type: TextInputType.phone,
                              label: '',
                              suffix: Icons.numbers,
                            ),
                          ),
                        ],),
                      ],
                    ),
                    //row restPrice
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 40,bottom: 10),
                            child: Text('باقي المبلغ',style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold,fontSize: 17.0),),
                          ),
                          SizedBox( width: 200.0,
                            height: 100.0,
                            child: defaultFormField(
                              controller: RestPriceController,
                              validate: (value){
                                if(value!.isEmpty)
                                {
                                  return 'يجب ان يكون الحقل ممتلئ';
                                }
                                return null;
                              },
                              type: TextInputType.phone,
                              label: '',
                              suffix: Icons.numbers,
                            ),
                          ),
                        ],),
                      ],
                    ),
                    //da

                    Center(
                      child: defaultButton(

                          width: 200.0,
                          background: Colors.teal,
                          height: 50,
                          radius: 50.0,
                          function: (){
                            String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());

                            TailorCubit.get(context).updateClient(
                                totalPrice: TotalPriceController.text,
                                paidPrice: PaidPriceController.text,
                                restPrice:RestPriceController.text,
                                name: nameController.text,
                                details: DetailsController.text,
                                phone: PhoneController.text,
                                number: NumberController.text,
                                back: BackController.text,
                                center: CenterController.text,
                                nick: nickController.text,
                                length: LengthController.text,
                                width: WidthController.text,
                                dateTime:cdate,

                            );

                          }, text: 'حفظ التعديل'

                      ),
                    ),
                    SizedBox(height: 15.0,),
                    // Center(
                    //   child: defaultButton(
                    //       width: 200.0,
                    //       background: Colors.teal,
                    //       height: 50,
                    //       radius: 50.0,
                    //       function: (){
                    //         if(state is TailorUpdateClientsSuccessStates)
                    //           TailorCubit.get(context).getClients();
                    //       },
                    //       text: 'تاكيد '
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            fallback:(context)=>Center(child: CircularProgressIndicator()),
          ),
        );
  },
);
      }
    );
  }
}
