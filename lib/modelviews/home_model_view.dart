

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:threadspractice/Services/PostService/PostApi.dart';
import 'package:threadspractice/Services/PostService/PostServiceBase.dart';
import 'package:threadspractice/models/PostModel.dart';
import 'package:threadspractice/views/Setting_view.dart';
import 'dart:isolate';

import 'package:threadspractice/views/home_body_view.dart';
import 'package:threadspractice/views/profile_view.dart';

class HomeModelView extends ChangeNotifier {







  HomeModelView(){

  }

  int currentindex=0;

  List<Widget> bottomBarViews=[HomeBodyView(),ProfileView(),SettingView()];



  late BuildContext _homeCurrentContext;



  void setCurrentContext(BuildContext context){


    _homeCurrentContext=context;
  }

  void bottomBarchildTap(int index){

    currentindex=index;

    notifyListeners();
  }





































  Future<void> startHeavyComputingClick() async{
    int messageCount=0;

    ReceivePort recievePort=ReceivePort();


    await Isolate.spawn(heavyComputing, recievePort.sendPort);

    await Isolate.spawn(heavyComputingSecond, recievePort.sendPort);



   await for(int message in recievePort){


    messageCount++;



    print("index:${messageCount } ${message }");
   }

    






   

  }



  void heavyComputing(SendPort port){


    int sum=0;

    for(int i=0;i<10000;i++){


      sum=sum+i;
    }


    port.send(sum);
  }

  void heavyComputingSecond(SendPort port){


        int sum=0;

    for(int i=0;i<20000;i++){


      sum=sum+i;
    }
    port.send(sum);
  }

  Future<void> heavyComputingConcurrency() async{



    for(int i=0;i<2000;i++){


      await Future.delayed(Duration.zero);
    }
  }




}