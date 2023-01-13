
class ClientModel
{
  String? name;
  String? uId;
  String? ImageUrl;
  String? dateTime;
  dynamic phone;
  dynamic length;
  dynamic width;
  dynamic nick;
  dynamic center;
  dynamic back;
  dynamic number;
  String? details;
  dynamic totalPrice;
  dynamic paidPrice;
  dynamic restPrice;



  ClientModel({
    this.name,
    this.ImageUrl,
    this.phone,
    this.length,
    this.number,
    this.restPrice,
    this.paidPrice,
    this.totalPrice,
    this.back,
    this.center,
    this.width,
    this.uId,
    this.nick,
    this.details,
    this.dateTime

  });

  ClientModel.fromJson(Map<String,dynamic>?json)
  {
    name= json?['name'];
    ImageUrl= json?['ImageUrl'];
    width= json?['width'];
    center= json?['center'];
    back= json?['back'];
    uId= json?['uId'];
    phone= json?['phone'];
    totalPrice= json?['totalPrice'];
    paidPrice= json?['paidPrice'];
    restPrice= json?['restPrice'];
    length= json?['length'];
    nick= json?['nick'];
    number= json?['number'];
    details= json?['details'];
    dateTime= json?['dateTime'];


  }
  Map <String,dynamic> toMap(){
    return
      {
        'name':name,
        'ImageUrl':ImageUrl,
        'phone':phone,
        'length':length,
        'width':width,
        'ID':uId,
        'center':center,
        'nick':nick,
        'number':number,
        'back':back,
        'totalPrice':totalPrice,
        'paidPrice':paidPrice,
        'restPrice':restPrice,
        'details':details,
        'dateTime':dateTime,



      };
  }
}