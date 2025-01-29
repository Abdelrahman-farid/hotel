import 'package:flutter/material.dart';

class Done extends StatefulWidget {
  const Done({super.key});

  @override
  State<Done> createState() => _DoneState();
}

class _DoneState extends State<Done> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:             

  
       Center(child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,

        children:  [ Text(
      "                  Done",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.green),
      ),
      Icon(
        color: Colors.green,
        Icons.done_outline_rounded)
      ]
      )
      )
    );
  }
}
