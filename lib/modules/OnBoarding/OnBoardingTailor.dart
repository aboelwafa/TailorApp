// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable, unnecessary_string_interpolations, unused_import

import 'package:flutter/material.dart';
import 'package:ktm/shared/network/local/cacheHelper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../layout/TailorLayoutScreen.dart';
import '../../shared/components/components.dart';
import '../Login/Tailor_Login_Screen.dart';

//1 create class to change image in screen
class BoardingModel{
  final String image;
  final String text;

  BoardingModel({required this.image,required this.text});
}

class OnBoardingTailorScreen extends StatefulWidget {
  @override
  State<OnBoardingTailorScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingTailorScreen> {
// 2-create list contain images
    List<BoardingModel>boardin=[
      // frist image
      BoardingModel(image: 'assets/images/mag.jpg',text: ''),
      BoardingModel(image: 'assets/images/mag2.jpg',text: ''),
      BoardingModel(image: 'assets/images/tarzi.jpg',text: ''),
      BoardingModel(image: 'assets/images/cut.jpg',text: ''),


      // BoardingModel(image: 'assets/images/chat2.png',text: 'Enjoy with best friend'),
    ];
    bool islast= false;
      //fun to make saveData in sharedPrefrence and navigate finish to nextPage
    void submit()
    {
      cacheHelper.saveData(
          key: 'onBoarding',
          value: true
      ).then((value)
      {
        print(value);
        if(value!)
        {
          navigateAndFinish(context, TailorLoginScreen());}}
      );
    }
    var boardController=PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            submit();
          },
              child: Text('تخطي',style: TextStyle(color: Colors.blue,fontSize: 20),)
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('مرحبا بك ',style:
              Theme.of(context).textTheme.headline3?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,

              )
              ,),
            Container(
                 height: 400.0,
                 width: double.infinity,
                 child: PageView.builder(
                   //function to check index is last ==true > islast =true else islast=false
                   //build on last= true > navigate to next page used in floating
                   onPageChanged: (int index){
                     if(index==boardin.length-1){
                       setState(() {
                         islast=true;
                         print(index);
                       });
                     }
                     else{
                       setState(() {
                         islast=false;
                         print(index);
                       });
                     }
                   },
                   controller: boardController,
                   //controller make page dynamic
                   physics: BouncingScrollPhysics(),
                   //move page
                   itemBuilder: (context, index) =>  buildBoardingItem(boardin[index]),
                   itemCount: boardin.length,
                   //length list
                   ),
               ),
            SizedBox(height: 20.0,),
            SmoothPageIndicator(
               controller: boardController,
                count: boardin.length,
                //design =>effect
                effect: ExpandingDotsEffect(
                 dotColor: Colors.grey[300] as Color,
                 offset: 20.0,
                 strokeWidth: 1.5,
                 dotWidth: 15.0,
                 radius: 20.0,
                 paintStyle: PaintingStyle.fill,
                 expansionFactor: 2,
                 dotHeight: 10.0,
                 spacing: 3,
                 activeDotColor: Colors.blue,
                ),
                ) ,
            Spacer(),

                // FloatingActionButton(
                //   backgroundColor: Colors.blue,
                //   //use condition in setstate here
                //   onPressed: (){
                //     if(islast){
                //       submit();
                //     }
                //     else{
                //       boardController.nextPage(
                //           duration:
                //           Duration(milliseconds: 750),
                //           curve:Curves.fastLinearToSlowEaseIn
                //       );
                //
                //     }
                //   },child: Icon(Icons.arrow_forward_ios),),
               if(islast)
                SizedBox(
                  width:200.0 ,
                    height: 50,
                    child: defaultButton(function: ()
                    {
                          if(islast){
                            submit();
                          }
                          else{
                            boardController.nextPage(
                                duration:
                                Duration(milliseconds: 750),
                                curve:Curves.fastLinearToSlowEaseIn
                            );
                      }

                    }, text: 'ابـــــــــــدا الان',)),



          ],
        ),
      ),

    );
  }

  // widget use in page.view(itemBuilde) call it
  Widget buildBoardingItem(BoardingModel model)=>Column(
        children: [
          Expanded(child: Image(image: AssetImage('${model.image}'))),

          Text('${model.text}')

        ],
      );
}