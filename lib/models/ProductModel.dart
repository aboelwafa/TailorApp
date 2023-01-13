
class ProductModel
{
  String? name;
  String? ImageUrl;
  String? price;
  String? color;
  String? details;
  String? uId;
  ProductModel({
    this.name,
    this.ImageUrl,
    this.price,
    this.color,
    this.details,
    this.uId,
  });
  ProductModel.fromJson(Map<String,dynamic>?json)
  {
    name= json?['name'];
    ImageUrl= json?['ImageUrl'];
    price= json?['price'];
    color= json?['color'];
    details= json?['details'];
    uId= json?['uId'];
  }
  Map <String,dynamic> toMap(){
    return
      {
        'name':name,
        'ImageUrl':ImageUrl,
        'price':price,
        'color':color,
        'details':details,
        'uId':uId,
      };
  }
}