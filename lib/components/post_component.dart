import 'package:flutter/material.dart';
import 'package:threadspractice/models/PostModel.dart';

class PostComponent extends StatefulWidget {

  late PostModel post;

  PostComponent({required this.post});



  @override
  State<StatefulWidget> createState() {

    return PostComponentState(post: this.post);

  }
}


class PostComponentState extends State<PostComponent> {

  late PostModel post;


  PostComponentState({required this.post});

  @override
  Widget build(BuildContext context) {

    print("post ${this.post.id} is rendered");

    return Container(child: Text(post.title),);
    

  }




}