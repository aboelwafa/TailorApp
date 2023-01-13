
// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktm/layout/cubit/cubit.dart';

import '../../layout/cubit/states.dart';
import '../../shared/components/components.dart';

class AddClientScreen extends StatelessWidget {
   AddClientScreen({Key? key}) : super(key: key);

  var formKey=GlobalKey<FormState>();

   var nameController      =TextEditingController();

   var PhoneController     =TextEditingController();

   var LengthController    =TextEditingController();

   var WidthController     =TextEditingController();

   var CenterController    =TextEditingController();

   var nickController      =TextEditingController();

   var NumberController    =TextEditingController();

   var BackController      =TextEditingController();

   var DetailsController   =TextEditingController();

   var TotalPriceController=TextEditingController();

   var PaidPriceController =TextEditingController();

   var RestPriceController =TextEditingController();

   var DateTimeController  =TextEditingController();

   void clearTextName() {
     nameController.clear();
   }

   void clearTextPhone() {
     PhoneController.clear();
   }

   void clearTextLength() {
     LengthController.clear();
   }

   void clearTextWidth() {
     WidthController.clear();
   }

   void clearTextCenter() {
     nickController.clear();
   }

   void clearTextNick() {
     CenterController.clear();
   }

   void clearTextNumber() {
     NumberController.clear();
   }

   void clearTextDetails() {
     DetailsController.clear();
   }

   void clearTextTotalPrice() {
     TotalPriceController.clear();
   }

   void clearTextPaidPrice() {
     PaidPriceController.clear();
   }

   void clearTextRestPrice() {
     RestPriceController.clear();
   }

   void clearTextDateTime() {
     DateTimeController.clear();
   }

   @override
  Widget build(BuildContext context) {
    return BlocConsumer<TailorCubit,TailorStates>(
      listener:(context, state) {
        if(state is TailorCreateClientSuccessStates)
        {
          showToast(
              text: 'تم حفظ بيانات العميل بنجاح',
              state: Toaststate.SUCCESS);

          nameController.text='';
          PhoneController.text='';
          LengthController.text='';
          WidthController.text='';
          CenterController.text='';
          nickController.text='';
          NumberController.text='';
          BackController.text='';
          DetailsController.text='';
          TotalPriceController.text='';
          PaidPriceController.text='';
          RestPriceController.text='';
          DateTimeController.text='';

        }
      },
      builder: (context, state) {
        // String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
        // var _image=TailorCubit.get(context).imageClient;
        return Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                if(state is TailorCreateClientLoadingStates)
                  LinearProgressIndicator(),
                // Stack(
                //   alignment: AlignmentDirectional.bottomEnd,
                //   children: [
                //     CircleAvatar(
                //       radius: 80.0,
                //       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                //       child: CircleAvatar(
                //         radius: 75.0,
                //         backgroundImage: _image == null ?
                //         AssetImage('assets/images/client.jpg')
                //             : FileImage(_image) as ImageProvider,
                //
                //       ),
                //     ),
                //     IconButton(onPressed: (){
                //       TailorCubit.get(context).choiceImageClient();
                //     },
                //       icon: CircleAvatar(
                //         radius: 20.0,
                //         child: Icon(Icons.camera_alt_outlined,size: 19.9,),),),
                //   ],
                // ),
                // SizedBox(height:15.0,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white30,
                          child: Text(' البيانات الشخصية',style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.blue,
                            fontWeight: FontWeight.w900,
                          ),),
                        ),
                        SizedBox(height: 10.0,),
                        defaultFormField(
                          controller: nameController,
                          validate: (value)
                          {
                            if(value!.isEmpty)
                            {
                              return'يجب ان يكون الحقل ممتلئ';
                            }
                            if(value.length<3)
                              {
                                return 'الاسم قصير ';
                              }
                            return null;
                          },
                          type: TextInputType.text,
                          label: 'اسم العميل',
                          suffix: Icons.person,
                        ),
                        SizedBox(height: 15.0,),
                        defaultFormField(
                          controller: PhoneController,
                          validate: (value){
                            if(value!.isEmpty)
                            {
                              return 'يجب ان يكون الحقل ممتلئ';
                            }
                            return null;
                          },
                          type: TextInputType.phone,
                          label: 'رقم الهاتف',
                          suffix: Icons.call,
                        ),
                        SizedBox(height: 10.0,),
                        Container(
                          width: double.infinity,
                          height: 4.0,
                          color: Colors.blue,
                        ),
                        SizedBox(height: 5.0,),
                        Container(
                          color: Colors.white30,
                          child: Text('المقاسات المطلوبة',style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.blue,
                            fontWeight: FontWeight.w900,
                          ),),
                        ),
                        SizedBox(height: 15.0,),
                        //row1 len,wid
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                                label: 'الكم',
                                suffix: Icons.numbers,
                              ),
                            ),
                            SizedBox(width: 15.0,),
                            SizedBox(width: 169.0,
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
                                label: 'الطول',
                                suffix: Icons.numbers,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.0,),
                        // row2 center,nick
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                            SizedBox(width: 15.0,),
                            SizedBox(width: 169.0,
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
                          ],
                        ),
                        SizedBox(height: 15.0,),
                        //row number,back
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox( width: 169.0,
                              height: 100.0,
                              child: defaultFormField(
                                controller: NumberController,
                                validate: (value){
                                  if(value!.isEmpty)
                                  {
                                    return 'يجب ان يكون الحقل ممتلئ';
                                  }
                                  return null;
                                },
                                type: TextInputType.phone,
                                label: 'العدد',
                                suffix: Icons.numbers,
                              ),
                            ),
                            SizedBox(width: 15.0,),
                            SizedBox(width: 169.0,
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
                          ],

                        ),
                        //  details
                        defaultFormField(
                          controller: DetailsController,
                          validate: (value){
                            if(value!.isEmpty)
                            {
                              return 'يجب ان يكون الحقل ممتلئ';
                            }
                            return null;
                          },
                          type: TextInputType.text,
                          label: 'وصف الطلب',
                          suffix: Icons.text_fields,
                        ),
                        SizedBox(height: 15.0,),
                        Container(
                          width: double.infinity,
                          height: 4.0,
                          color: Colors.blue,
                        ),
                        SizedBox(height: 5.0,),
                        Container(
                          color: Colors.white30,
                          child: Text('حساب العميل',style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.blue,
                            fontWeight: FontWeight.w900,
                          ),),
                        ),
                        SizedBox(height: 10.0,),
                        // TotalPrice
                        SizedBox(
                          width: 250,
                          height: 100,
                          child:  defaultFormField(
                            controller: TotalPriceController,
                            validate: (value){
                              if(value!.isEmpty)
                              {
                                return 'يجب ان يكون الحقل ممتلئ';
                              }
                              return null;
                            },
                            type: TextInputType.phone,
                            label: 'المبلغ الكلي',
                            suffix: Icons.text_fields,
                          ),
                        ),

                        // paidPrice
                        SizedBox(
                          width: 250,
                          height: 100,
                          child:  defaultFormField(
                            controller: PaidPriceController,
                            validate: (value){
                              if(value!.isEmpty)
                              {
                                return 'يجب ان يكون الحقل ممتلئ';
                              }
                              return null;
                            },
                            type: TextInputType.phone,
                            label: ' تم استلام',
                            suffix: Icons.text_fields,
                          ),
                        ),
                        // RestPrice
                        SizedBox(
                          width: 250,
                          height: 100,
                          child:  TextFormField(
                            controller: RestPriceController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: 'باقي المبلغ',
                              suffixIcon: Icon(Icons.text_fields),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 4.0,
                          color: Colors.blue,
                        ),
                        SizedBox(height: 5.0,),
                        //date
                        TextFormField(
                          controller: DateTimeController,
                          decoration: InputDecoration(
                            labelText: "تاريخ الطلب",
                            border: OutlineInputBorder(),
                            suffix: Icon(Icons.date_range),

                          ),
                          validator: ( value){
                            if(value!.isEmpty)
                            {
                              return "اكتب التاريخ من فضلك";
                            }
                            return null;
                          },

                          onTap: () async{
                            DateTime? date = DateTime(1900);
                            FocusScope.of(context).requestFocus(new FocusNode());

                            date = await showDatePicker(
                                context: context,
                                initialDate:DateTime.now(),
                                firstDate:DateTime(2022),
                                lastDate: DateTime(2030));

                            DateTimeController.text=date!.toString();
                          },),
                        SizedBox(height: 15.0,),
                        ConditionalBuilder(
                          condition: state is! TailorCreateClientLoadingStates,
                          builder:(context) => defaultButton(
                              function: (){
                                if(formKey.currentState!.validate())
                                {
                                //   if(TailorCubit.get(context).imageClient!=null)
                                //     {
                                //   TailorCubit.get(context).UploadClientImage(
                                //       name: nameController.text,
                                //       phone: PhoneController.text,
                                //       length: LengthController.text,
                                //       width: WidthController.text,
                                //       nick: nickController.text,
                                //       center: CenterController.text,
                                //       back: BackController.text,
                                //       number: NumberController.text,
                                //       details: DetailsController.text,
                                //       totalPrice: TotalPriceController.text,
                                //       paidPrice: PaidPriceController.text,
                                //       restPrice: RestPriceController.text,
                                //       dateTime: DateTimeController.text);
                                // }
                                //   else
                                //   {
                                      TailorCubit.get(context).CreateClient(
                                          name: nameController.text,
                                          phone: PhoneController.text ,                                        length: LengthController.text ,
                                          width: WidthController.text ,
                                          nick: nickController.text ,
                                          center: CenterController.text ,
                                          back: BackController.text ,
                                          number: NumberController.text ,
                                          details: DetailsController.text,
                                          totalPrice: TotalPriceController.text ,
                                          paidPrice: PaidPriceController.text ,
                                          restPrice: RestPriceController.text ,
                                          dateTime: DateTimeController.text);

                                }
                              },
                              text: 'حفظ البيانات',
                              radius: 20.0,
                              background: Colors.green,
                              width: 200.0,
                              height: 50.0
                          ) ,
                          fallback:(context) => Center(child: CircularProgressIndicator()) ,

                        ),

                        SizedBox(height: 15.0,),
                      ],

                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}
