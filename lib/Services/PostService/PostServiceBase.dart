import 'package:dio/dio.dart';

abstract class PostServiceBase {



Future<Response> fetchPosts();

}