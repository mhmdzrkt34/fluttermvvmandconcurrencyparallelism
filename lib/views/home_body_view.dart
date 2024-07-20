import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:threadspractice/components/post_component.dart';
import 'package:threadspractice/models/PostModel.dart';
import 'package:threadspractice/modelviews/home_body_model_view.dart';
import 'package:threadspractice/modelviews/home_model_view.dart';

class HomeBodyView extends StatefulWidget{




  HomeBodyView();



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeBodyViewState();
  }
}



class HomeBodyViewState extends State<HomeBodyView> {
    ScrollController controller=ScrollController();

  HomeBodyViewState();



  @override
  Widget build(BuildContext context) {

    return 
    MultiProvider(providers: [


      ChangeNotifierProvider.value(value: GetIt.instance.get<HomeBodyModelView>())
    ],
    
    
    child:Scaffold(
    body: PostSelector(),
    
    
    ));




  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState

    controller.addListener((){

      if(controller.position.maxScrollExtent==controller.offset){

        print("end");
      }



    });
    super.initState();
  }


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    if(!ModalRoute.of(context)!.isCurrent){




    }
    super.didChangeDependencies();
  }

  Selector<HomeBodyModelView,List<PostModel>?> PostSelector(){


    return  Selector<HomeBodyModelView,List<PostModel>?>(selector: (context,provider)=>provider.posts,

    shouldRebuild: (previos,next)=>!identical(previos, next),
    
    builder: (context,value,child){


      if(value==null){

        return Center(child: CircularProgressIndicator(),);
      }

      if(value.length==0){

        return Center(child: Text("no available posts"),);

        
      }

      return ListView.builder(
        controller: this.controller,
        itemCount: value.length+1, itemBuilder: (BuildContext context,int index){

          if(index==value.length){

            return MaterialButton(onPressed: (){

              GetIt.instance.get<HomeBodyModelView>().adPost();


            },child: Text("add"),);
          }


        return 
        
        Selector<HomeBodyModelView,PostModel>(selector: (context,provider)=>provider.posts![index],
        
        shouldRebuild: (previous,next)=>!(previous.id==next.id),
        builder: (context,value,child){

          return  PostComponent(post: value);




        },
        );
       

        
      });




    },
    );
  }
}