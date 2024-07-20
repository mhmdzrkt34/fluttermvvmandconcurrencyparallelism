import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:threadspractice/Services/PostService/PostServiceBase.dart';

class PostApi extends PostServiceBase{



  Dio _dio=Dio();



  PostApi(){


    _dio.options.baseUrl="https://jsonplaceholder.typicode.com/";
  }
  @override
  Future<Response> fetchPosts() async{
    try{

      


      Response response=await _dio.get('posts');

      return response;


    }catch(e){

      throw e;
    }

  }


  
}