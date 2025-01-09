import 'package:barber_project/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'admin_login.dart';

class AdminSignup extends StatefulWidget{
  const AdminSignup({Key?key}):super(key: key);


  @override
  State<AdminSignup> createState()=> _AdminSignupState();
}
class _AdminSignupState extends State<AdminSignup> {
  final TextEditingController _usenamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 50, left: 25),
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 2,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFB91635),
                      Color(0xff621d3c),
                      Color(0xFF311937),
                    ],
                  ),
                ),
                child: Text(
                  "Admin\nPanel",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 40,
                  left: 30,
                  right: 30,
                  bottom: 20,
                ),
                margin: EdgeInsets.only(
                  top: MediaQuery
                      .of(context)
                      .size
                      .height / 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Username",
                        style: TextStyle(
                          color: Color(0xFFB91635),
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextFormField(

                        controller: _usenamecontroller,
                        decoration: InputDecoration(
                          hintText: "Username",
                          prefixIcon: Icon(Icons.mail_outline),
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Password",
                        style: TextStyle(
                          color: Color(0xFFB91635),
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextFormField(
                        controller: _passwordcontroller,
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.key),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 60),
                      GestureDetector(
                        onTap: () {
                          signupAdmin();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFB91635),
                                Color(0xff621d3c),
                                Color(0xFF311937),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const AdminLogin()));
                      }, child: Text("Signin"))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


 Future<void> signupAdmin() async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email:_usenamecontroller.text, password:_passwordcontroller.text);

      String uid = credential.user!.uid;

      Map<String,dynamic> adminData ={
        "email":_usenamecontroller.text,
        "password":_passwordcontroller.text,
        "role":"admin",
      };

      await FirebaseFirestore.instance.collection("admins").doc(uid).set(adminData);


    }

    // on FirebaseException catch (e) {
      on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
    catch(e){
      print(e);
    }
    }
  }

