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