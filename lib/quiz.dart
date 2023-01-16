import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late int sel=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Quiz",
          style: TextStyle(fontSize: 25),),
          Expanded(child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Radio(value: index, groupValue: sel, onChanged: ((int? value) {
                    setState(() {
                      sel = value!;
                    });
                  })),
                  title: Text("Choice$index"),);
            },
            itemCount: 5,
          ))
        ],
      ),
    );
  }
}

/*
body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /*ListView(
              children: [
                const Text("โจทย์",style: TextStyle(fontSize: 30),),
                ListTile(
                  leading: Radio(value: 1, groupValue: sel, onChanged: ((int? value) {
                    setState(() {
                      sel = value!;
                    });
                  })),
                  title: const Text("Choice1"),),
                ListTile(
                  leading: Radio(value: 2, groupValue: sel, onChanged: ((int? value) {
                    setState(() {
                      sel = value!;
                    });
                  })),
                  title: const Text("Choice2"),),
                ListTile(
                  leading: Radio(value: 3, groupValue: sel, onChanged: ((int? value) {
                    setState(() {
                      sel = value!;
                    });
                  })),
                  title: const Text("Choice3"),),
                ListTile(
                  leading: Radio(value: 4, groupValue: sel, onChanged: ((int? value) {
                    setState(() {
                      sel = value!;
                    });
                  })),
                  title: const Text("Choice4"),),
              ],
            ),
            */
          ],
        ),
      ),
*/