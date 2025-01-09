import 'package:barber_project/Admin/booking_admin.dart';
import 'package:barber_project/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'admin_signup.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {

  TextEditingController usernamecontroller=new TextEditingController();
  TextEditingController userpasswordcontroller=new TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    usernamecontroller.dispose();
    userpasswordcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 50, left: 25),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
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
                  top: MediaQuery.of(context).size.height / 4,
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

                        controller: usernamecontroller,
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
                        controller: userpasswordcontroller,
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.key),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 60),
                      GestureDetector(
                        onTap: () {
                          loginAdmin();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: MediaQuery.of(context).size.width,
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
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const AdminSignup()));
                      }, child: Text("Signup"))

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
  loginAdmin(){
    FirebaseFirestore.instance.collection("admins").get().then((snapshot){
      snapshot.docs.forEach((result){
        print("password");
        print(result.data()['password']);
        if(result.data()['email']!=usernamecontroller.text.trim()){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Your id is not correct',
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }

        else if(result.data()['password']!=userpasswordcontroller.text.trim()){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Your password is not correct',
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }
        else{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingAdmin()));
        }
      });
    });
  }
}
