import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 50.0, left: 20.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xffe3e6ff), Color(0xfff1f3ff), Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Location
          Row(
            children: [
              Icon(Icons.location_on_outlined),
              Text(
                "Bosila, Muhammadpur, Dhaka",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),

          //User Name
          Text(
            "Hello, Kamrul",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),

          //Available Events
          Text(
            "There are 20 events\narround your location",
            style: TextStyle(
                color: Color(0xff6351ec),
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),

          //Search bar
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: TextField(
              decoration:
                  InputDecoration(suffixIcon: Icon(Icons.search_outlined)),
            ),
          )
        ],
      ),
    ));
  }
}
