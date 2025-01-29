import 'package:flutter/material.dart';
import 'package:training/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
GlobalKey <FormState> formstate= GlobalKey();
int slectedindex =0;
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: Homepage(),
    );
  }
  

  }
  
  
  


  














