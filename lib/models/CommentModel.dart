// ignore_for_file: unnecessary_question_mark

class CommentModel
{
  String? senderId;
  String? reciverId;
  String? dateTime;
  String? text;



  CommentModel({
    this.senderId,
    this.reciverId,
    this.dateTime,
    this.text,
  });

  CommentModel.fromJson(Map<String,dynamic>?json)
  {
    senderId= json?['senderId'];
    reciverId= json?['reciverId'];
    dateTime= json?['dateTime'];
    text= json?['text'];


  }
  Map <String,dynamic> toMap(){
    return
      {
        'senderId':senderId,
        'reciverId':reciverId,
        'dateTime':dateTime,
        'text':text,

      };
  }
}