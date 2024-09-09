import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mariana/components/custombuttonauth.dart';
import 'package:mariana/components/customlogoauth.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/textformfield.dart';
import '../main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

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
              const Text("Login",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              Container(height: 10,),
              Text("Login To Continue Using The App",style: TextStyle(fontSize: 15,color: Colors.brown[500]),),
              Container(height: 20,),
              const Text("Email",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              Container(height: 10,),
              CustomTextForm(hintText: "Enter Your Email", mycontroller: email),
              Container(height: 10,),
              const Text("Password",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              Container(height: 10,),
              CustomTextForm(hintText: "Enter Your Password", mycontroller: password),
              Container(
                alignment: Alignment.topRight,
                margin: const EdgeInsets.only(top: 10,bottom: 20),
                child: const Text("Forgot Password?",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 15,),),
              ),

            ],),
          CustomButtonAuth(title: "Login",onPressed: () async {
            Navigator.pushNamed(context, 'home');

          },),
          Container(height: 20,),

          MaterialButton(
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              color: Colors.brown[400],
              textColor: Colors.white,
              onPressed: (){
                _launchGmail();

              },
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Login With Google"),
                  Image.asset("assets/google.jpg",width: 30,)
                ],)
          ),
          Container(height: 30,),

          InkWell(onTap: (){
            Navigator.pushNamed(context, 'signup');
          },
            child: Center(
              child: Text.rich(TextSpan(children: [
                const TextSpan(text: "Dont Have An Account ? ",),
                TextSpan(text: "Register ",style: TextStyle(color: Colors.brown[500],
                    fontWeight: FontWeight.bold)),
              ])),
            ),
          ),

        ],),
      ),
      backgroundColor: Colors.brown[200],
    );
  }

  _launchGmail() async {
    const url = 'https://gmail.com/';
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}