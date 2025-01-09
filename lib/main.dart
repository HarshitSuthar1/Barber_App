import 'package:barber_project/Admin/admin_login.dart';
import 'package:barber_project/Admin/booking_admin.dart';
import 'package:barber_project/pages/booking.dart';
import 'package:barber_project/pages/forgot_password.dart';
import 'package:barber_project/pages/home.dart';
import 'package:barber_project/pages/login.dart';
import 'package:barber_project/pages/onboarding.dart';
import 'package:barber_project/pages/signup.dart';
import 'package:barber_project/services/shared_pref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeFirebase();
  runApp(const MyApp());
}

Future<void> _initializeFirebase() async {
  try {
    await Firebase.initializeApp();
  } catch (e) {
    // Handle the error, e.g., log it or display an alert
    print('Firebase initialization error: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,  // Add this line to set white background
      ),
      home: Home(),
    );
  }
}
