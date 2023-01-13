// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktm/layout/cubit/cubit.dart';
import 'package:ktm/layout/cubit/states.dart';
import 'package:ktm/models/ProductModel.dart';
import 'package:ktm/models/TailorUserModel.dart';
class HomeScreen extends StatelessWidget {

  TailorUserModel?userModel;

  var TextController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Builder(
      
      builder: (context) {
        //TailorCubit.get(context).getComment(reciverId: '${userModel?.uId}');
        return BlocConsumer<TailorCubit,TailorStates>(
          listener: (context, state) {

          },
          builder: (context, state) {
            return
              Column(
                children: [
                  CarouselSlider(
                      items:[
                        Image(image: AssetImage('assets/images/g1.jpg')),
                        Image(image: AssetImage('assets/images/g5.jpg')),
                        Image(image: AssetImage('assets/images/g3.jpg')),
                        Image(image: AssetImage('assets/images/g4.jpg')),
                        Image(image: AssetImage('assets/images/g12.jpg')),
                        Image(image: AssetImage('assets/images/g13.jpg')),
                      ],
                      options: CarouselOptions(
                        height: 250.0,
                        initialPage: 0,
                        //>> start first page >initial page=0
                        viewportFraction: 1.0,
                        //>> photo take full screen
                        enableInfiniteScroll: true,
                        reverse: false,
                        //Don't move image touch>reverse
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 4),
                        autoPlayAnimationDuration: Duration(seconds: 2),
                        autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                        scrollDirection: Axis.horizontal,

                      )),
                  SizedBox(height: 10.0,),
                  ConditionalBuilder(
                    condition:TailorCubit.get(context).products.length>0,
                    builder: (context) =>  SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('احدث المنتجات',style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.blue,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w900,
                            ),),
                          ),
                          Container(
                            width: double.infinity,
                            color: Colors.blueAccent[100],
                            child: GridView.count(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: 1, //هيبقي فيه اتنين ع الصفحة منتجين جمب بعض
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 10.0,
                              childAspectRatio: 1/.8,// ,wid,length

                              children: List.generate(TailorCubit.get(context).products.length,
                                    (index) => buildGridProduct(TailorCubit.get(context).products[index],context,index),
                              ),


                            ),
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                    ),
                    fallback: (context) => ConditionalBuilder(
                      condition: true,
                      builder:(context) => Center(child: Text('لا يوجد منتجات يرجي اضافة منتج واحد على الاقل',style: Theme.of(context).textTheme.bodyLarge,)),
                      fallback:(context) => Center(child: Text('اضغط ع ايقونة الصفحة الرئيسية من اسفل',style: Theme.of(context).textTheme.bodyLarge,)),
                    ),

                  )
                ],
              );

          },

        );
      }
    );
  }


  Widget buildGridProduct(ProductModel model,context,index)=>
      Container(

        color: Colors.white,
        child: SingleChildScrollView(
           physics: NeverScrollableScrollPhysics(),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              ConditionalBuilder(
                condition: model.ImageUrl !=null,
                builder:(context) =>  Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Image(
                      image: NetworkImage('${model.ImageUrl}'),
                      width: double.infinity,
                      height: 220.0,
                      fit: BoxFit.fill,
                    ),

                  ],
                ),
                fallback:(context) => Text('لا توجد صورة ',style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Colors.blue,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),) ,

              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'اسم المنتج:    ${model.name}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18.0,
                        height: 2,
                      ),
                    ),
                    Text(
                          ' سعر متر:${model.price} [جنيه] ',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            //fontWeight: FontWeight.w600,
                          ),

                        ),
                    SizedBox(height: 10.0,),
                    //create comment

                    // Container(
                    //     color: Colors.blue,
                    //     child: Center(child: TextButton(onPressed: (){
                    //       showModalBottomSheet(
                    //         context: context,
                    //         builder: (context)
                    //         {
                    //           return Container(
                    //             height: 900.0,
                    //
                    //             child: Column(
                    //               children: [
                    //
                    //                 Container(
                    //
                    //                   decoration: BoxDecoration(
                    //
                    //                     border: Border.all(
                    //                       color: Colors.black12,
                    //                     ),
                    //                     borderRadius: BorderRadius.circular(20.0),
                    //
                    //                   ),
                    //                   clipBehavior: Clip.antiAliasWithSaveLayer,
                    //                   child: Row(
                    //                     children: [
                    //
                    //                       Container(
                    //                         height: 50.0,
                    //                         color: Colors.green,
                    //                         child: MaterialButton(
                    //                           minWidth: 1.0,
                    //                           onPressed: (){
                    //                             TailorCubit.get(context).sendMessage(
                    //                                 reciverId: '${userModel?.uId}',
                    //                                 dateTime: DateTime.now().toString(),
                    //                                 text: TextController.text
                    //                             );
                    //                           },
                    //                           child: Icon(Icons.arrow_back_ios_new,color: Colors.white,),),
                    //                       ),
                    //                       Expanded(
                    //                         child: TextFormField(
                    //                           controller: TextController,
                    //                           textDirection: TextDirection.rtl,
                    //                           decoration: InputDecoration(
                    //                             border: InputBorder.none,
                    //                             hintText: '....اكتب تعليقك هنا ',
                    //
                    //
                    //                           ),
                    //
                    //                         ),
                    //                       ),
                    //
                    //
                    //                     ],
                    //                   ),
                    //                 ),
                    //                 SizedBox(height: 5.0,),
                    //                 Expanded(
                    //                   child: ListView.separated(
                    //                       itemBuilder: (context, index)
                    //                       {
                    //                         return Padding(
                    //                           padding: const EdgeInsets.all(10.0),
                    //                           child: Align(
                    //                             alignment: AlignmentDirectional.centerStart,
                    //                             child: Container(
                    //                               decoration: BoxDecoration(
                    //                                 color: Colors.grey[400],
                    //
                    //                                 borderRadius: BorderRadiusDirectional.only(
                    //                                   bottomEnd: Radius.circular(10.0),
                    //                                   topStart: Radius.circular(10.0),
                    //                                   topEnd: Radius.circular(10.0),
                    //
                    //                                 ),
                    //                               ),
                    //                               padding:EdgeInsets.symmetric(
                    //                                 vertical: 1.0,
                    //                                 horizontal: 1.0,
                    //                               ) ,
                    //                               child: Column(
                    //                                 crossAxisAlignment: CrossAxisAlignment.end,
                    //                                 children: [
                    //
                    //                                   Text('شغل اي كلام'),
                    //                                 ],
                    //                               ),
                    //                             ),
                    //                           ),
                    //                         );
                    //                         // var comments=TailorCubit.get(context).comments[index];
                    //                         //
                    //                         //
                    //                         // if(SocialCubit.get(context).userModel?.uId ==message.senderId)
                    //                         //
                    //                         //   return buildComment(message);
                    //                         //
                    //                         // return buildMessage(message);
                    //
                    //                       } ,
                    //                       separatorBuilder: (context, index) =>Container(
                    //                         width: double.infinity,
                    //                         height: 2.0,
                    //                         color: Colors.black12,
                    //                       ) ,
                    //                       itemCount:20 ),
                    //                 ),
                    //               ],
                    //             ),
                    //           );
                    //         }
                    //       );
                    //     }, child: Text('التعليقات',style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    //       color: Colors.white,
                    //     ),),)),
                    // )
             ]
              ),
              ),



            ],
          ),
        ),
      );
}
