import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:threadspractice/modelviews/home_body_model_view.dart';
import 'package:threadspractice/modelviews/home_model_view.dart';
import 'package:threadspractice/modelviews/profile_model_view.dart';
import 'package:threadspractice/modelviews/setting_model_view.dart';
import 'package:threadspractice/views/home_view.dart';

Future<void> main() async{


  WidgetsFlutterBinding.ensureInitialized();



  GetIt.instance.registerSingleton<HomeModelView>(HomeModelView());

  GetIt.instance.registerSingleton<SettingModelView>(SettingModelView());


  GetIt.instance.registerSingleton<HomeBodyModelView>(HomeBodyModelView());



  GetIt.instance.registerSingleton<ProfileModelView>(ProfileModelView());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: "threadspractice",


      initialRoute: "home",
      
      
      routes:{

        "home":(context)=>HomeView()
      } ,
    );
}

}

