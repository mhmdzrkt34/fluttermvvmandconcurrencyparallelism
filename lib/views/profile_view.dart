import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:threadspractice/modelviews/profile_model_view.dart';

class ProfileView extends StatefulWidget{


  ProfileView();


  @override
  State<StatefulWidget> createState() {

    return ProfileViewState();

  }


}

class ProfileViewState extends State<ProfileView>{

  ProfileViewState();


  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers: [


      ChangeNotifierProvider.value(value: GetIt.instance.get<ProfileModelView>())
    ],
    
    child: Scaffold(
    
    body: SingleChildScrollView(child: Column(children: [Container(child: Text("it is profile page"),)],),),
    ),
    );

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies'

    if(!ModalRoute.of(context)!.isCurrent){



    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }






}