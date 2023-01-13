// ignore_for_file: unnecessary_import
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktm/layout/cubit/states.dart';
import 'package:ktm/models/TailorUserModel.dart';
import 'package:ktm/modules/AddClient/AddClientScreen.dart';
import 'package:ktm/modules/AddProduct/AddProductScreen.dart';
import 'package:ktm/modules/Clients/AllClientScreen.dart';
import 'package:ktm/modules/Home/HomeScreen.dart';
import 'package:ktm/shared/components/constants.dart';
import '../../models/ClientModel.dart';
import '../../models/CommentModel.dart';
import '../../models/ProductModel.dart';
import '../../modules/InformationApp/IinformationApp.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage ;


class TailorCubit extends Cubit<TailorStates>
{
  TailorCubit():super(TailorInitialStates());

  static TailorCubit get(context)=>BlocProvider.of(context);

  TailorUserModel? userModel;
  void getUserData()
  {
    emit(TailorGetUserDataLoadingStates());
    FirebaseFirestore.instance.collection('USERS')
        .doc(uId)
        .get()
        .then((value) {
      userModel=TailorUserModel.fromJson(value.data());
      print(userModel?.name);
      print(userModel?.uId);
      print(userModel?.email);

      emit(TailorGetUserDataSuccessStates());
    })
        .catchError((error){
      print(error.toString());
      emit(TailorGetUserDataErrorStates());
    });
  }

  int currentIndex=0;

  List<Widget> screens=[
     HomeScreen(),
    InformationApp(),
    AllClientScreen(),
    AddClientScreen(),
    AddProductScreen(),

  ];
  List<String> titles=[
    'الصفحة الرئيسية',
    'حول التطبيق',
    'العملاء',
    ' اضافة عميل',
    'اضافة منتج',

  ];

  void ChangeBottom(index)
  {
    if(index==0)
      getProducts();
    if(index==2);
      getClients();
    // if(index==1&&userModel?.uId!='eurLnWNNWvTK90QXBFeH5mcR4SB2');
    //   navigateTo(context, HomeScreen());
    currentIndex=index;
    emit(TailorChangeNavBarItemStates());
  }

     ProductModel? productModel;

  void CreateProduct({
    required String name,
    // required String color,
    required String price,
    // required String details,
     String? ImageUrl,

  })
  {
    emit(TailorCreateProductLoadingStates());

    ProductModel model=ProductModel(
      name:name,
      uId: userModel?.uId,
      // color: color,
      price: price,
      // details: details,
      ImageUrl: ImageUrl??'',
    );
    FirebaseFirestore.instance
    .collection('products')
    .add(model.toMap())
    .then((value) {
      print(value.toString());
      // emit(TailorCreateProductSuccessStates());
    })
    .catchError((error){
      print(error.toString());
      emit(TailorCreateProductErrorStates());
    });
  }
  //upload Product Image
  void UploadProductImage({
    required String name,
    // required String color,
    required String price,
    // required String details,
  })
  {
    emit(TailorCreateProductLoadingStates());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('products/${Uri.file(image!.path).pathSegments}')
        .putFile(image!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
       CreateProduct(
           name: name,
           // color: color,
           price: price,
           // details: details,
            ImageUrl: value,
       );
        emit(TailorCreateProductSuccessStates());
      }).catchError((error){
        emit(TailorCreateProductErrorStates());
      });

    })
        .catchError((error){
      emit(TailorCreateProductErrorStates());
    });
  }
     File? image;
  final _picker = ImagePicker();

  Future choiceImage() async {
    var pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null)
   {
      image = File(pickedImage.path);
    emit(TailorCreateImageProductSuccessStates());
  }
    else
    {
      print('no image selected');
      emit(TailorCreateImageProductErrorStates());
    }
  }


//  get product from firebase
  List<ProductModel> products=[];
  List<String> productsId=[];
  void getProducts()
  {
    {
      emit(TailorGetProductLoadingStates());
      products=[];

             FirebaseFirestore.instance
            .collection('products')
            .get()
            .then((value) {
              value.docs.forEach((element) {
              element.reference.collection('products')
                .get()
                .then((value) {
              print(element.id);
              products.add(ProductModel.fromJson(element.data()));
              productsId.add(element.id);
              emit(TailorGetProductSuccessStates());
            })
            .catchError((error){});
          });
            print(productsId);
          emit(TailorGetProductSuccessStates());
        }).catchError((error){
          emit(TailorGetProductErrorStates());
        });
    }
  }
  // void getproduct()
  // {
  //   FirebaseFirestore.instance
  //       .collection('products')
  //       .get()
  //       .then((value) {
  //     value.docs.forEach((element) {
  //       products.add(ProductModel.fromJson(element.data()));
  //
  //     });
  //     print(products.length);
  //     print(products[0].ImageUrl);
  //     emit(TailorGetProductSuccessStates());
  //   })
  //       .catchError((error){
  //     emit(TailorGetProductErrorStates());
  //
  //   });
  // }

//ClientModel and ClientPage

//image client


  File? imageClient;
  final _pickerClient = ImagePicker();

  Future choiceImageClient() async {
    var pickedImage = await _pickerClient.pickImage(source: ImageSource.gallery);
    if (pickedImage != null)
    {
      imageClient = File(pickedImage.path);
      emit(TailorCreateImageClientSuccessStates());
    }
    else
    {
      print('no image selected');
      emit(TailorCreateImageClientErrorStates());
    }
  }

//  Set  details Client in firebase

  ClientModel? clientModel;

  void CreateClient({
    required String name,
     String? uID,
    required String phone,
    required String length,
    required String width,
    required String nick,
    required String center,
    required String back,
    required String number,
    required String details,
    required String totalPrice,
    required String paidPrice,
    required String restPrice,
    required String dateTime,
    String? ImageUrl,

  })
  {
    emit(TailorCreateClientLoadingStates());

    //call constractor model and send detailsModel

    ClientModel model= ClientModel(
      name: name,
      phone: phone,
      length: length ,
      width: width,
      nick: nick,
      center: center,
      back: back,
      number: number,
      details: details,
      totalPrice: totalPrice,
      paidPrice: paidPrice,
      restPrice: restPrice,
      dateTime: dateTime,
      ImageUrl: ImageUrl??'',
    );
    FirebaseFirestore.instance
        .collection('Clients')
        .doc(name)
        .set(model.toMap())
        .then((value) {
       emit(TailorCreateClientSuccessStates());
    })
        .catchError((error){
      print(error.toString());
      emit(TailorCreateClientErrorStates());
    });
  }

//  uploadClient image and all details client
//  call fun create client inside fun uploadClientImage


  void UploadClientImage({
    required String name,
    required String phone,
    required String length,
    required String width,
    required String nick,
    required String center,
    required String back,
    required String number,
    required String details,
    required String totalPrice,
    required String paidPrice,
    required String restPrice,
    required String dateTime,
  })
  {
    emit(TailorCreateClientLoadingStates());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('clients/${Uri.file(imageClient!.path).pathSegments}')
        .putFile(imageClient!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        CreateClient(
            name: name,
            phone: phone,
            length: length,
            width: width,
            nick: nick,
            center: center,
            back: back,
            number: number,
            details: details,
            totalPrice: totalPrice,
            paidPrice: paidPrice,
            restPrice: restPrice,
            dateTime: dateTime,
            ImageUrl: value,
        );
        emit(TailorCreateClientSuccessStates());
      }).catchError((error){
        emit(TailorCreateClientErrorStates());
      });

    })
        .catchError((error){
      emit(TailorCreateClientErrorStates());
    });
  }

//  getClient
  List<ClientModel> clients=[];
  List<String> clientsID=[];
  void getClients()
  {
    {
      emit(TailorGetClientsLoadingStates());
      clients=[];
      FirebaseFirestore.instance
          .collection('Clients')
          .get().
      then((value) {
        value.docs.forEach((element) {

          clientsID.add(element.id);
          //if(element.data()['uId']==clientModel?.name&&element.data()['uId']==userModel?.uId)
            clients.add(ClientModel.fromJson(element.data()));
            print(element.data()['name']);
        });
        print(clients[0].name);
        emit(TailorGetClientsSuccessStates());
      }).catchError((error){
        emit(TailorGetClientsErrorStates());
      });
    }
  }

  //get details client only
  List<ClientModel> detailsClients=[];
  void getDetailClient({required String name,})
  {
    FirebaseFirestore.instance.collection('clients')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      //detailsClients=[];
      event.docs.forEach((element) {
        detailsClients.add(ClientModel.fromJson(element.data()));
      });
      emit(TailorGetClientsSuccessStates());
    });
  }

  // update client price

  void updateClient({
    required String totalPrice,
    required String paidPrice,
    required String restPrice,
    required String name,
    required String dateTime,
    required String  details,
    required String  phone,
    required String  number,
    required String  back,
    required String  center,
    required String  nick,
    required String  length,
    required String  width,
})
  {

        emit(TailorUpdateClientsLoadingStates());
    ClientModel model=ClientModel(
      totalPrice: totalPrice,
      paidPrice: paidPrice,
      restPrice: restPrice,
      name: name,
      ImageUrl:clientModel?.ImageUrl,
      dateTime:dateTime,
      uId:uId,
      details:details,
      phone:phone,
      number:number,
      back:back,
      center:center,
      nick:nick,
      length:length,
      width:width,

    );
    FirebaseFirestore.instance
        .collection('Clients')
        .doc(name)
        .update(model.toMap())
        .then((value) {
      // getUserData();
      //getClients();
          emit(TailorUpdateClientsSuccessStates());
          })
        .catchError((error) {
      print(error.toString());
      emit(TailorUpdateClientsErrorStates());
    });

  }


//  commentMessage

  void sendMessage({
    required String reciverId,
    required String dateTime,
    required String text,
  })
  {
    CommentModel model=CommentModel(
      reciverId: reciverId,
      text: text,
      dateTime: dateTime,
      senderId: userModel?.uId,
    );
    //send chat
    FirebaseFirestore.instance.collection('USERS')
        .doc(userModel?.uId)
        .collection('comments')
        .add(model.toMap())
        .then((value) {
      emit(TailorSendMessageSuccessStates());
    })
        .catchError((error){
      emit(TailorSendMessageErrorStates());
    });
    //set rceiver chat
    FirebaseFirestore.instance.collection('USERS')
        .doc(userModel?.uId)
        .collection('comments')
        .add(model.toMap())
        .then((value) {
      emit(TailorSendMessageSuccessStates());
    })
        .catchError((error){
      emit(TailorSendMessageErrorStates());
    });
  }
}
