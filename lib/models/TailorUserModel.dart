// class TailorUserModel
// {
//  String? name;
//  String? email;
//  String? phone;
//  String? uId;
//
//  TailorUserModel(
//  {
//    required this.name,
//   required this.email,
//   required this.phone,
//  required  this.uId
//  }
//  );
//
//  TailorUserModel.fromJson(Map<dynamic,String>?json)
//  {
//   name=json?['name'];
//   email=json?['email'];
//   phone=json?['phone'];
//   uId=json?['uId'];
//
//  }
//   Map <String,dynamic> toMap(){
//     return
//     {
//       'name':name,
//         'phone':phone,
//         'email':email,
//         'uId':uId,
//     };
//   }
// }


class TailorUserModel
{
  String? name;
  String? email;
  String? phone;
  String? uId;
  TailorUserModel({
    this.name,
    this.email,
    this.phone,
    this.uId,

  });

  TailorUserModel.fromJson(Map<String,dynamic>?json)
  {
    name= json?['name'];
    email= json?['email'];
    phone= json?['phone'];
    uId= json?['uId'];


  }
  Map <String,dynamic> toMap(){
    return
      {
        'name':name,
        'email':email,
        'phone':phone,
        'uId':uId,


      };
  }
}