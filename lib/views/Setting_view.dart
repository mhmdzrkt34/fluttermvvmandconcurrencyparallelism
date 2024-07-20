import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:threadspractice/modelviews/setting_model_view.dart';

class SettingView extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {

    return SettingViewState();

  }

  
}

class SettingViewState extends State<SettingView> {



  @override
  Widget build(BuildContext context) {
  return MultiProvider(providers: [
    ChangeNotifierProvider.value(value: GetIt.instance.get<SettingModelView>())
  ],
  
  child: Scaffold(


    body: SingleChildScrollView(child: Column(children: [Container(child: Text("it is setting view"),)],),),
  
  
  
  ),);

  
  }
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    if(!ModalRoute.of(context)!.isCurrent);



    
    super.didChangeDependencies();
  }

  }
  