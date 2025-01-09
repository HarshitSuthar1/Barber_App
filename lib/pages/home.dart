import 'package:barber_project/pages/booking.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/shared_pref.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String? name, images;

  getthedatafromsharedpref()async{
    name=await SharedpreferenceHelper().getUserName();
    images=await SharedpreferenceHelper().getUserImage();
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


  @override
  Widget build(BuildContext context) {
    const primaryBackgroundColor = Color(0xFF2b1615);
    const whiteTextColor = Colors.white;

    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      body: Container(
        margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,",
                      style: TextStyle(
                          color: Color.fromARGB(199, 255, 255, 255),
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      name!,
                      style: TextStyle(
                          color: whiteTextColor,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.network(
                    images!,
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Divider(color: Colors.white30),
            const SizedBox(height: 20.0),
            const Text(
              "Services",
              style: TextStyle(
                  color: whiteTextColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking(service: 'Classic Shaving')));
                    },
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(color: Color(0xFF311903),borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/shaving.png",
                            height: 70,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 5,),
                          Text(
                            "Classic Shaving",
                            style: TextStyle(
                                color: whiteTextColor,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.0,),
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking(service: 'Washing Hair')));
                    },
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(color: Color(0xFF311903), borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/wash.png',
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 5,),
                          Text(
                            "Washing Hair",
                            style: TextStyle(
                                color: whiteTextColor,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking(service: 'Hair Cutting')));
                    },
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(color: Color(0xFF311903),borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/Haircut.png',
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 5,),
                          Text(
                            "Hair Cutting",
                            style: TextStyle(
                                color: whiteTextColor,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.0,),
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking(service: 'Beard Trimming')));
                    },
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(color: Color(0xFF311903), borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/Trimming.png',
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 5,),
                          Text(
                            "Beard Trimming",
                            style: TextStyle(
                                color: whiteTextColor,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking(service: 'Facials')));
                    },
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(color: Color(0xFF311903),borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/Facical.png',
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 5,),
                          Text(
                            "Facials ",
                            style: TextStyle(
                                color: whiteTextColor,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.0,),
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking(service: 'Kids HairCut')));
                    },
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(color: Color(0xFF311903), borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/Kids.png',
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 5,),
                          Text(
                            "Kids HairCut",
                            style: TextStyle(
                                color: whiteTextColor,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
