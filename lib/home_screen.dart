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
      appBar: AppBar(
        title: Text('Book Event'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black45,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Home'),
                Text('Home'),
                Text('Home'),
                Text('Home'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
