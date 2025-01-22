import 'package:flutter/material.dart';

class UploadEvent extends StatefulWidget {
  const UploadEvent({super.key});

  @override
  State<UploadEvent> createState() => _UploadEventState();
}

class _UploadEventState extends State<UploadEvent> {
  //Event category list
  final List<String> eventCategory = [
    "Music",
    "Clothing",
    "Technology",
    "Healthcare",
    "Festival",
    "Science"
  ];

  String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_outlined),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 5.5,
                ),
                const Text(
                  "Upload Event",
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xff6351ec),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //Image Upload
            Center(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      size: 50,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Upload Image",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            //Event Name
            const Text("Event Name",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                )),

            const SizedBox(
              height: 10,
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xffececf8),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter Event Name",
                ),
              ),
            ),

            //Ticket Price
            const SizedBox(
              height: 30,
            ),
            const Text("Ticket Price",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                )),

            const SizedBox(
              height: 10,
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xffececf8),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter Ticket Price",
                ),
              ),
            ),

            //Event category
            const SizedBox(
              height: 30,
            ),
            const Text("Event Category",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                )),

            const SizedBox(
              height: 10,
            ),

            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xffececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: eventCategory
                        .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                            )))
                        .toList(),
                    onChanged: ((value) => setState(() {
                          this.value = value;
                        })),
                    dropdownColor: Colors.white,
                    hint: Text("Select Event Category"),
                    iconSize: 36,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    value: value,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
