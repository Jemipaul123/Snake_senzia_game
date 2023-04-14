import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.android,
                size:100,),
              SizedBox(height: 25),
              Text('Hello again!',
      style: TextStyle(fontWeight: FontWeight.bold,
        fontSize: 36,)
    ),
    SizedBox(height: 10),
    Text('Welcome back, you\'ve been missed',
    style: TextStyle(
    fontSize: 20,)
    ),
    SizedBox(height: 50),

    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
      decoration: BoxDecoration(
      color: Colors.grey.shade200,
        border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
      ),
        child: Padding(
          padding: const EdgeInsets.only(left:20.0),
          child: TextField(
          decoration: InputDecoration(
          border: InputBorder.none,
            hintText: 'Email',


          ),
          ),
        ),
      ),
    ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',


                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height:10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                padding:EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Text('Sign in',
                    style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    ))),
              ),
            ),
              SizedBox(height: 25),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member? ',
                  style: TextStyle(

                    fontWeight: FontWeight.bold,
                    ),),
                    Text('Register Now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),

            ]

          ),
        ),
      )

    );
  }
}
