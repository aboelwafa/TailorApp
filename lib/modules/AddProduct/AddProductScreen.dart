
// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktm/layout/cubit/cubit.dart';
import 'package:ktm/layout/cubit/states.dart';
import 'package:ktm/shared/components/components.dart';

class AddProductScreen extends StatelessWidget {

  var nameController=TextEditingController();
  var PriceController=TextEditingController();
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TailorCubit,TailorStates>(
      listener: (context, state) {
          if(state is TailorCreateProductSuccessStates)
            {
              showToast(text: 'تم نشر المنتج بنجاح', state: Toaststate.SUCCESS);
              nameController.text="";
             
              PriceController.text="";
            
            }
      },
      builder: (context, state) {
        var _image=TailorCubit.get(context).image;
        var productModel=TailorCubit.get(context).productModel;

        // nameController.text='${productModel?.name}';
        // PriceController.text='${productModel?.price}';
        // colorController.text='${productModel?.color}';
        // detailsController.text='${productModel?.details}';
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if(state is TailorCreateProductLoadingStates)
                  LinearProgressIndicator(),
                if(state is TailorCreateProductLoadingStates)
                  SizedBox(height: 10.0,),

                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Container(
                      height:250.0 ,
                      width: 250.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight:  Radius.circular(4.0),
                          ),
                          image: DecorationImage(
                             image:_image == null ? AssetImage('assets/images/logo.png') : FileImage(_image) as ImageProvider,
                      ),
                    ),
                   child:
                    IconButton(onPressed: (){
                      TailorCubit.get(context).choiceImage();
                    }, icon: CircleAvatar(
                      radius: 20.0,
                      child: Icon(Icons.add_photo_alternate_outlined,size: 19.9,),),),
                    )
                  ],
                ),
                Text('اضافة صورة',style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 30.0),),
                SizedBox(height: 20.0,),
                //nameProduct
                Center(
                  child: SizedBox(
                    width: 300.0,
                    child: defaultFormField(
                        controller: nameController,
                        validate: (value)
                        {
                          if(value!.isEmpty)
                          {
                            return'لايجب ان يكون الحقل فارغ';
                          }
                          return null;
                        },
                        type: TextInputType.text,
                        label: 'اسم المنتج',
                        suffix: Icons.drive_file_rename_outline_outlined

                    ),
                  ),
                ),
                SizedBox(height: 15.0,),
                //priceProduct
                Center(
                  child: SizedBox(
                    width: 300.0,
                    child: defaultFormField(
                        controller: PriceController,
                        validate: (value)
                        {
                          if(value!.isEmpty)
                          {
                            return'لايجب ان يكون الحقل فارغ';
                          }
                          return null;
                        },
                        type: TextInputType.phone,
                        label: 'سعر المنتج',
                        suffix: Icons.currency_pound

                    ),
                  ),
                ),
                SizedBox(height: 15.0,),
                  // details
                // Center(
                //   child: SizedBox(
                //     width: 300.0,
                //     child: defaultFormField(
                //         controller: detailsController,
                //         validate: (value)
                //         {
                //           if(value!.isEmpty)
                //           {
                //             return'لايجب ان يكون الحقل فارغ';
                //           }
                //           return null;
                //         },
                //         type: TextInputType.text,
                //         label: 'تفاصيل المنتج',
                //         suffix: Icons.pending,
                //
                //     ),
                //   ),
                // ),
                // SizedBox(height: 15.0,),
                //color
                // Center(
                //   child: SizedBox(
                //     width: 300.0,
                //     child: defaultFormField(
                //         controller: colorController,
                //         validate: (value)
                //         {
                //           if(value!.isEmpty)
                //           {
                //             return'لايجب ان يكون الحقل فارغ';
                //           }
                //           return null;
                //         },
                //         type: TextInputType.text,
                //         label: 'لون  المنتج',
                //         suffix: Icons.color_lens
                //
                //     ),
                //   ),
                // ),
                ConditionalBuilder(
                  condition: state is! TailorCreateProductLoadingStates,
                  builder: (context) => Center(
                    child: defaultButton(
                        width: 300,
                        height: 50,
                        function: (){
                              if(formKey.currentState!.validate()) {
                                TailorCubit.get(context).UploadProductImage(
                                    name: nameController.text,
                                    price: PriceController.text,
                                    );
                              }
                        }, text: 'نشر'),
                  ),
                  fallback: (context) => Center(child: CircularProgressIndicator()),

                ),
              ],
            ),
          ),
        );
      },


    );
  }
}
