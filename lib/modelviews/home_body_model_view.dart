import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:threadspractice/Services/PostService/PostApi.dart';
import 'package:threadspractice/Services/PostService/PostServiceBase.dart';
import 'package:threadspractice/models/PostModel.dart';

class HomeBodyModelView extends ChangeNotifier {

  PostServiceBase _postService=PostApi();

  List<PostModel>? posts;

  HomeBodyModelView(){

    
    fetchPosts();
  }
  Future<void> fetchPosts() async {





  try{


    List<PostModel> postsList=[];

    Response responce=await _postService.fetchPosts();


    List jsonResponce=responce.data as List;

    for(var item in jsonResponce){



      postsList.add(PostModel.fromJson(item as Map<String,dynamic>));
      
    }

    posts=[...postsList];

    print(posts!.length);
    notifyListeners();







  }catch(e){

    if(e is DioException){

      if(e.response!.statusCode==400){


      }
    }

    



  }
}

void adPost(){


  posts!.add(new PostModel(userId: 501, id: 501, title: "new ", body: "new"));

  posts=[...posts!];

  notifyListeners();



}

}