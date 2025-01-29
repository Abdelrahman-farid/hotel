
// ignore_for_file: avoid_print, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:training/firstpage.dart';
import 'package:training/signup.dart';



class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomeState();
}
GlobalKey<FormState> formstate =GlobalKey();
class _HomeState extends State<Homepage> {
  String? gmail ;
String? password ;
  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      
 body: 
 Container( 
  padding:const EdgeInsets.all(10),
 margin: const EdgeInsets.all(10),
  child: Form( 
    key: formstate,
    
    child: Column(
    children: [
    Container( margin:const EdgeInsets.only(top: 20),
      child: 
TextFormField(
  autovalidateMode: AutovalidateMode.always,
  onSaved: (val) {
    gmail = val;
  },
  decoration: const InputDecoration(
    labelText: "gmail",
    hintText: "*****@gmail.com",
    hintStyle: TextStyle(color: Colors.grey),
    icon: Icon(Icons.attach_email_outlined),
  ),
  validator: (value) {
    if (value!.isEmpty) {
      return "email is required";
    }
    
    if (!value.endsWith("@gmail.com")) {
      return "email must end with @gmail.com";
    }

    return null;
  },
),

    ),
     
      TextFormField(
        autovalidateMode: AutovalidateMode.always,
        onSaved: (val){
          password=val;
        },
        decoration: const InputDecoration(
       labelText: "password",
        hintText:"********",hintStyle:  TextStyle(color: Colors.grey),
        icon: Icon(Icons.password_sharp)
      ),

        obscureText: true,
        validator: (value) { 
          if (value!.isEmpty){
            return "password is required";
          }
          if (value.length<15){
            return "username must be >15";
          }
          return null;
        },
      ),
      MaterialButton(color: Colors.blue,textColor: Colors.white,
        onPressed: (){

         if(formstate.currentState!.validate()) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const Firstpage()));

          formstate.currentState!.save();
          print("username");
          print("password");
          // ignore: duplicate_ignore
          // ignore: avoid_print
          print("submited");

         }else {
          // ignore: avoid_print
          print("not submited"); 
         }
        

      },
      child:const Text("sign in "),
      ),
      MaterialButton(
         onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Signuppage()));
    
      },
    
      child:const 
        Row( children: [
Text("                 Dont have acount? ") ,
Text(" creat acount",style: TextStyle(color: Colors.blue),)
      ]
      )   

      ) 
      
    ],
  )
    
   
  )
  )
    )
    
    ;
    
     
     
 
          
        
          

        
      
    
      

      
     
    
    
  }
}