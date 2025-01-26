import 'package:book_event/custom_widget/event_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
              Icon(
                Icons.location_on,
                color: Colors.red,
              ),
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
          SizedBox(
            height: 20.0,
          ),

          //Search bar
          Container(
            margin: EdgeInsets.only(right: 20.0),
            padding: EdgeInsets.only(left: 20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: TextField(
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search_outlined),
                  border: InputBorder.none,
                  hintText: "Search your location"),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          //Category of Events
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                EventCard(
                  img: 'images/music.png',
                  text: 'Music',
                ),
                SizedBox(
                  width: 30,
                ),
                EventCard(
                  img: 'images/cloth.png',
                  text: 'Clothing',
                ),
                SizedBox(
                  width: 30,
                ),
                EventCard(
                  img: 'images/laptop.png',
                  text: 'Technology',
                ),
                SizedBox(
                  width: 30,
                ),
                EventCard(
                  img: 'images/muscles.png',
                  text: 'Healthcare',
                ),
                SizedBox(
                  width: 30,
                ),
                EventCard(
                  img: 'images/confetti.png',
                  text: 'Festival',
                ),
                SizedBox(
                  width: 30,
                ),
                EventCard(
                  img: 'images/science.png',
                  text: 'Science',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),

          //Upcoming Event
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Upcoming Events",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff6351ec)),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.0),

          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    "images/concert.jpg",
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "JAN 01\n2025",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 5,
          ),
          //event name and pricing
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Nagar Baul Show",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text(
                  "BDT 500",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff6351ec)),
                ),
              )
            ],
          ),

          //Event Location
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.red,
              ),
              Text(
                "Mirpur, Dhaka",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
