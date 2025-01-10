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
                      color: Colors.lightBlue),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
