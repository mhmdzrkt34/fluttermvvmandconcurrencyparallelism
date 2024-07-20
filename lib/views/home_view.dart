import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:threadspractice/modelviews/home_model_view.dart';

class HomeView extends StatefulWidget{

  HomeView();



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeViewState();
  }
}



class HomeViewState extends State<HomeView> {

  HomeViewState();



  @override
  Widget build(BuildContext context) {

    GetIt.instance.get<HomeModelView>().setCurrentContext(context);

    return 
    MultiProvider(providers: [


      ChangeNotifierProvider.value(value: GetIt.instance.get<HomeModelView>())
    ],
    
    
    child:Scaffold(appBar: AppBar(


      title:Text("mobile app"),
    ),

    body: currentPageSelector(),

    bottomNavigationBar: BottomBarSelector(),
    
    
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
    super.initState();
  }


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    if(!ModalRoute.of(context)!.isCurrent){




    }
    super.didChangeDependencies();
  }


Selector<HomeModelView,int> currentPageSelector(){


  return Selector<HomeModelView,int>(selector: (context,provider)=>provider.currentindex,

  builder: (context,value,child){

    return IndexedStack(
      index: value,
      
      children: GetIt.instance.get<HomeModelView>().bottomBarViews,
    );



  },
  
  
  
  );




}

Selector<HomeModelView,int> BottomBarSelector(){


  return Selector<HomeModelView,int>(selector: (context,provider)=>provider.currentindex,

  builder: (context,value,child){

    print("builded");

    return BottomNavigationBar(
      currentIndex: value,

      onTap: (index){

        GetIt.instance.get<HomeModelView>().bottomBarchildTap(index);



      },
      items: [

      BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),

       BottomNavigationBarItem(icon: Icon(Icons.person),label: "profile"),

        BottomNavigationBarItem(icon: Icon(Icons.settings),label: "settings"),


    ]);



  },
  
  
  
  );




}


}