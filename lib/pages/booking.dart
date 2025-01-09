import 'dart:math';

import 'package:barber_project/services/database.dart';
import 'package:flutter/material.dart';

import '../services/shared_pref.dart';

class Booking extends StatefulWidget {
  final String service; // Declare as final for immutability
  const Booking({required this.service, super.key}); // Use const and key

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {

  String? name, images, email;

  getthedatafromsharedpref()async{
    name=await SharedpreferenceHelper().getUserName();
    images=await SharedpreferenceHelper().getUserImage();
    email=await SharedpreferenceHelper().getUserEmail();
    setState((){

    });
  }

  getontheload()async{
    await getthedatafromsharedpref();
    setState((){

    });
  }

  void initState(){
    getontheload();
    super.initState();
  }


  DateTime _selectedDate=DateTime.now();

  Future<void>_selectDate(BuildContext context)async{
    final DateTime? picked=await showDatePicker(context: context,initialDate: _selectedDate, firstDate: DateTime(2024), lastDate: DateTime(2026));
    if(picked!= null && picked !=_selectedDate){
      setState(() {
        _selectedDate=picked;
      });
    }
  }

  TimeOfDay _selectedTime=TimeOfDay.now();

  Future<void>_selectTime(BuildContext context)async{
    final TimeOfDay? picked=await showTimePicker(context: context, initialTime: _selectedTime,);
    if(picked!=null && picked!=_selectedTime){
      setState(() {
        _selectedTime=picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF27121A),
      body: Container(
        margin: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context); // Navigate back to the previous screen
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 45.0),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            const Text(
              "Let's the\njourney begin",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20.0), // Add spacing before the image
            Container(
              width: MediaQuery.of(context).size.width, // Full width of the screen
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "images/discount.jpeg",
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10.0), // Add spacing between the image and text
                  Text(
                    widget.service, // Use the service passed to the widget
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(color: Color(0xFFb4817e), borderRadius: BorderRadius.circular(20)),
                    width: MediaQuery.of(context).size.width,
                    child: Column(children: [
                      Text("Set a Date", style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w600),),
                      SizedBox(height: 0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap:(){
                              _selectDate(context);
                            },
                              child: Icon(Icons.calendar_month, color: Colors.white,size: 28,)),
                          SizedBox(width: 10,),
                          Text("${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}", style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.w600),),
                        ],
                      )
                    ],),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(color: Color(0xFFb4817e), borderRadius: BorderRadius.circular(20)),
                    width: MediaQuery.of(context).size.width,
                    child: Column(children: [
                      Text("Set a Time", style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w600),),
                      SizedBox(height: 0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap:(){
                                _selectTime(context);
                              },
                              child: Icon(Icons.alarm, color: Colors.white,size: 28,)),
                          SizedBox(width: 10,),
                          Text(_selectedTime.format(context), style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.w600),),
                        ],
                      )
                    ],),
                  )
                ],
              ),
            ),
            SizedBox(height: 25,),
            GestureDetector(
              onTap: ()async{
                Map<String, dynamic> userBookingmap={
                  "Service":widget.service,
                  "Date":"${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}".toString(),
                  "Time": _selectedTime.format(context).toString(),
                "Username":name,
                  "Image":images,
                  "Email":email,
                };
                await DatabaseMethods().addUserBooking(userBookingmap).then((value){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Service has been booked Successfully', style: TextStyle(fontSize: 18)),
                    ),
                  );
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                decoration: BoxDecoration(
                  color: Color(0xffcb7b3f),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: const Text(
                    "Book Now",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
