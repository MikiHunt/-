// ignore_for_file: non_constant_identifier_names

import 'package:app006_2/page2.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/second':(context) => const Page2(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required String title});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int data = 0;
  void loadData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      data = prefs.getInt("data")?? 0;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu_open), 
          onPressed:(){
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: const Text("WelcomeScreen"),
          actions: [
            IconButton(onPressed: (){
              inc_data();
            }, 
            icon: const Icon(Icons.arrow_upward)),
            IconButton(onPressed: (){
              dec_data();
            }, 
            icon: const Icon(Icons.arrow_downward)),
            

          ],
      ),
      drawer: Container(
        width: 250,
        color: Colors.blue[100],
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              const Text("Main Screen",style: TextStyle(fontSize: 30)),
              const Text("Counter :",style: TextStyle(fontSize: 50)),
              Text("$data",style: const TextStyle(fontSize: 150)),
              IconButton(onPressed: (){
                inc_data();
              }, 
              icon: const Icon(Icons.arrow_upward)),
              IconButton(onPressed: (){
                dec_data();
              }, 
              icon: const Icon(Icons.arrow_downward)),
              
            ],
            
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              const Text("Main Screen",style: TextStyle(fontSize: 30)),
              const Text("Counter :",style: TextStyle(fontSize: 80)),
              Text("$data",style: const TextStyle(fontSize: 200)),
              ElevatedButton(onPressed: () {
                gotopage2(context);
              }, 
              child: Text("หน้าถัดไป",style: TextStyle(color: Colors.amber[200]),)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, '/second');
      },
      child: const Icon(Icons.navigate_next),),
    );
    
  }
  
  void inc_data() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      data = (prefs.getInt("data")?? 0)+1;
      if (data > 100) {
        data = 0;
      }
      prefs.setInt("data", data);
    }); 
  }
  
  void dec_data() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      data = (prefs.getInt("data")?? 0)-1;
      if (data < 0) {
        data = 0;
      }
      prefs.setInt("data", data);
    }); 
  }
  void gotopage2(BuildContext context){
    Navigator.push(
      context, 
      PageRouteBuilder(
        pageBuilder: ((
          context, 
          animation, 
          secondaryAnimation) {
        return const Page2();
      }),
      transitionsBuilder: (
        context, 
        animation, 
        secondaryAnimation, 
        child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: const Offset(0.0, 0.0),
        ).animate(
          CurvedAnimation(
            parent: animation, 
            curve: Curves.easeOutQuint)),
              child: child,
        );
      },
      transitionDuration: const Duration(seconds: 3),
      )
    );
  }
}