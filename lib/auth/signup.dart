import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mariana/components/custombuttonauth.dart';
import 'package:mariana/components/customlogoauth.dart';

import '../components/textformfield.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignUpState();
}

class _SignUpState extends State<Signup> {
  //final _auth = FirebaseAuth.instance;
  TextEditingController username=TextEditingController();
   TextEditingController email=TextEditingController();
   TextEditingController password=TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 50,),

              const Customlogoauth(),
              Container(height: 20,),
              const Text("SignUp",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              Container(height: 10,),
              Text("SignUp To continue Using The App",style: TextStyle(fontSize: 15,color: Colors.brown[500]),),
              Container(height: 20,),
              const Text("UserName",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              Container(height: 10,),
              CustomTextForm(hintText: "Enter Your Name", mycontroller: username),
              Container(height: 10,),
              const Text("Email",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              Container(height: 10,),
              CustomTextForm(hintText: "Enter Your Email", mycontroller: email),
              Container(height: 10,),
              const Text("Password",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              Container(height: 10,),
              CustomTextForm(hintText: "Enter Your Password", mycontroller: password,),
              Container(
                alignment: Alignment.topRight,
                margin: const EdgeInsets.only(top: 10,bottom: 20),
                child: const Text("Forgot Password?",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 15,),),
              ),

            ],),
          CustomButtonAuth(title: "SignUp",onPressed: () async {

            //try{
             // final newUser =await _auth.createUserWithEmailAndPassword(
              //    email: email.text,
              //    password: password.text);
              Navigator.of(context).pushReplacementNamed("home");
            //}
           // catch (e){
            //  print(e);

           // }


          },),
          Container(height: 20,),

          InkWell(onTap: (){
            Navigator.of(context).pushReplacementNamed("login");
          },
            child: Center(
              child: Text.rich(TextSpan(children: [
                const TextSpan(text: "Have An Account ? ",),
                TextSpan(text: "Login ",style: TextStyle(color: Colors.brown[500],
                    fontWeight: FontWeight.bold)),
              ])),
            ),
          ),

        ],),
      ),
      backgroundColor: Colors.brown[200],
    );
  }
}
