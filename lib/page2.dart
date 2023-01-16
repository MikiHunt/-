// ignore_for_file: implementation_imports, unnecessary_import

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const Text("Page2",style: 
            TextStyle(fontSize: 30),),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, 
            child: Text("กลับสู่เมนูหลัก",style: TextStyle(color: Colors.amber[200]),)),
          ],
        ),
      ),
    );
  }
}