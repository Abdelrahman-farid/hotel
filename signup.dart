// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:training/firstpage.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
    GlobalKey<FormState>formstate=GlobalKey();
String? gmail ;
String? password ;
String? name ;
String? phone;
String? sex ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
       centerTitle: true,
        title:const Text("creat new acount ",style: TextStyle(color: Colors.blue),),),
      body: Container( 
  padding:const EdgeInsets.all(10),
 margin: const EdgeInsets.all(10),
  child: Form( 
    key: formstate,
    
    child: Column(
    children: [ 
      TextFormField(        autovalidateMode: AutovalidateMode.always,
 
        onSaved: (val){
         name = val ;

        },
        decoration: const InputDecoration(
       labelText: "Username",
        hintText:"Ali for example",hintStyle: TextStyle(color: Colors.grey),
        icon: Icon(Icons.person)
      ),
        validator: (value) 
        { if (value!.isEmpty){
            return "username is required";
         
          }
          if (value.length<10){
            return "username must be >10";
          }
          return null;
        },
      ),
      TextFormField(        autovalidateMode: AutovalidateMode.always,
 
        onSaved: (val){
         gmail = val ;

        },
        decoration: const InputDecoration(
       labelText: "gmail",
        hintText:"*****@gmail.com",hintStyle: TextStyle(color: Colors.grey),
        icon: Icon(Icons.attach_email_outlined)
      ),
        validator: (value) 
        { if (value!.isEmpty){
            return "emial is required";
         
          }
         if (!value.endsWith("@gmail.com")) {
      return "email must end with @gmail.com";
    }
         return null;
        }
        
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
      RadioListTile(
        title:const Text("male"),
        value: "male" , groupValue: sex , onChanged: (value) {
        setState(() {
          sex =value;
        });
      },
      ),
       RadioListTile(
        title:const Text("female"),
        value: "female" , groupValue: sex , onChanged: (value) {
        setState(() {
          sex = value;
        });
      },
      ),
       TextFormField(keyboardType:TextInputType.number ,
        autovalidateMode: AutovalidateMode.always,
        onSaved: (val){
          phone=val;
        },
        decoration: const InputDecoration(
       labelText: "phone number",
        hintText:"01*******23",hintStyle:  TextStyle(color: Colors.grey),
        icon: Icon(Icons.phone)
      ),

        validator: (value) { 
          if (value!.isEmpty){
            return "phone number is required";
          }
          if (value.length!=11){
            return "username must be =11";
          }
          return null;
        },
      ),
      MaterialButton(
        color: Colors.blue,textColor: Colors.white,
        onPressed: (){

        if(formstate.currentState!.validate()){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const Firstpage()));

          formstate.currentState!.save();
         print("the acount was created");
         
        }else {
          print("the acount not created");
        }
      },
      child: const Text("creat acount"),
      )
    ]
    )
    )
      )
    );
    
  }
}