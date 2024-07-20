class PostModel{



  late int userId;



  late int id;


  late String title;


  late String body;

  PostModel({required this.userId,required this.id,required this.title,required this.body});

  static PostModel fromJson(Map<String,dynamic> jsonPost){


    return new PostModel(userId: jsonPost["userId"], id: jsonPost["id"], title: jsonPost["title"], body: jsonPost["body"]);
  }







}