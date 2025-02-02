import 'dart:io';

import 'package:book_event/services/database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';

class UploadEvent extends StatefulWidget {
  const UploadEvent({super.key});

  @override
  State<UploadEvent> createState() => _UploadEventState();
}

class _UploadEventState extends State<UploadEvent> {
  //TextControllers
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController detailController = TextEditingController();
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

  //imagePicker
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  //ImagePicker Function
  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);
    setState(() {});
  }

  //Date Picker
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 10, minute: 00);

  Future<void> _pickDate() async {
    final DateTime? pickDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (pickDate != null && pickDate != selectedDate) {
      setState(() {
        selectedDate = pickDate;
      });
    }
  }

  //Time Format
  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();

    final dateTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);

    return DateFormat('hh:mm: a').format(dateTime);
  }

  //TimePicker
  Future<void> _pickTime() async {
    final TimeOfDay? pickedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                child: InkWell(
                  onTap: () {
                    getImage();
                  },
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
                    child: selectedImage != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              selectedImage!,
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const Column(
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
              ),
              const SizedBox(
                height: 20,
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
                  controller: nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Event Name",
                  ),
                ),
              ),

              //Ticket Price
              const SizedBox(
                height: 20,
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
                  controller: priceController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Ticket Price",
                  ),
                ),
              ),

              //Event category
              const SizedBox(
                height: 20,
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
                  )),

              //Date and Time
              const SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  InkWell(
                    onTap: () {
                      _pickDate();
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: Colors.blue,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            DateFormat('yyyy-MM-dd').format(selectedDate),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),

                  //Pick Time
                  InkWell(
                    onTap: () {
                      _pickTime();
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.alarm,
                            color: Colors.blue,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            formatTimeOfDay(selectedTime),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              //Event Details
              const SizedBox(
                height: 20,
              ),
              const Text("Event Details",
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
                  controller: detailController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "What about the event is......",
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              //Upload button
              InkWell(
                onTap: () async {
                  // String addID = randomAlphaNumeric(10);
                  // Reference firebaseStorageRef = FirebaseStorage.instance
                  //     .ref()
                  //     .child("blogImage")
                  //     .child(addID);
                  // final UploadTask task =
                  //     firebaseStorageRef.putFile(selectedImage!);

                  // var downloadUrl = await (await task).ref.getDownloadURL();
                  String id = randomAlphaNumeric(10);
                  Map<String, dynamic> uploadevent = {
                    "Image": "", //downloadUrl
                    "Name": nameController.text,
                    "Price": priceController.text,
                    "Category": value,
                    "Detail": detailController.text,
                    "Date": DateFormat('yyyy-MM-dd').format(selectedDate),
                    "Time": formatTimeOfDay(selectedTime),
                  };

                  await DatabaseMethods()
                      .addEvent(uploadevent, id)
                      .then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        textAlign: TextAlign.center,
                        "Event Uploaded Successfully",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ));
                    setState(() {
                      nameController.clear();
                      priceController.clear();
                      detailController.clear();
                      selectedImage = null;
                    });
                  });
                },
                child: Center(
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: Color(0xff6351ec),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text("Upload",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
