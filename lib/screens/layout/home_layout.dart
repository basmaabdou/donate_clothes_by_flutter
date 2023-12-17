import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'donate_page.dart';

class HomeLayout extends StatefulWidget {
   final String? userToken;

  HomeLayout({required this.userToken});
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var favColor = 0xffFE5A1D;
  dynamic width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      // appBar: AppBar(),
      // drawr: Drawer(),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          // Your Image with Text and Button
          Stack(
            children: [
              Container(
                height: 300,
                child: Image.asset(
                  "assets/images/sp01.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(left:10,bottom: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "We Help you",
                            style: TextStyle(
                              color: Color(0xff127d9a),
                              fontSize: 16,
                            ),
                          ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                         child: Align(
                             alignment: Alignment.centerLeft,
                               child: Text(
                                "SAVE THE CHILDREN",
                                    style: TextStyle(
                                     color: Colors.white,
                                     fontSize: 26,
                                     fontWeight: FontWeight.bold,
                                   ),
                                 ),
                               ),
                              ),
                        Text(
                          "Lorem ipsum dolor sit amet ,consectetur adipiscing elit, sed eiusmod tempor incididunt ut labore et dolore magna aliqua nostrud",
                          style: TextStyle(
                            color: Color.fromARGB(255, 221, 216, 216),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff127d9a))),
                          onPressed: () {
                            if (widget.userToken != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DonatePage(userToken: widget.userToken!),
                              ),
                            );
                          }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top:3,bottom: 3),
                            child: Text(
                              "Donate Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Other Sections
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ... المزيد من الأقسام
              Padding(
                padding: const EdgeInsets.only(
                    left: 50, right: 50, top: 60, bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      "assets/images/Capture7.PNG",
                      width: 120,
                      height: 350,
                      fit: BoxFit
                          .cover, // You can adjust the fit property as needed
                    ),
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                      ),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xff127d9a),
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {});
                          },
                          icon: Icon(Icons.favorite),
                          iconSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "25+ Years of Experience",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5, top: 10),
                            child: Text(
                              "Donate to the Charity",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 30, top: 30),
                child: Text(
                  "Help For the Community",
                  style: TextStyle(
                      fontFamily: 'Whisper', color: Color(0xff127d9a)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, top: 30),
                child: Text(
                  "2021 Fundraiser Campaigns For Social Justice",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                child: Text(
                  "There are many variations of passages of orem Ipsum available, "
                  "but the majority have suffered alteration in some form, by"
                  " cted ipsum dolor sit amet, consectetur adipisicing elit, "
                  "sed do usmod temponcid idunt ut labore et dolore magna aliqua. "
                  "Ut enim ad minim veniam, quis nostrud exercitation ullamco aboris nisi.",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 30),
                      width: 5,
                      height: 80,
                      color: Color(0xff127d9a),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 30),
                              child: Row(
                                children: [
                                  Text(
                                    "  Helped Fund",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    " 78,743 ",
                                    style: TextStyle(
                                        color: Color(0xff127d9a),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    "Projects",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Text(
                                    "in",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    "30,",
                                    style: TextStyle(
                                        color: Color(0xff127d9a),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    " Countries,",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    " Benefiting",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              )),
                          Container(
                              margin: EdgeInsets.only(left: 5, top: 5),
                              child: Row(
                                children: [
                                  Text(
                                    "Over",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    "7.6",
                                    style: TextStyle(
                                        color: Color(0xff127d9a),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    " Million People.",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xff127d9a),
                      ),
                    ),
                    child: Text(
                      "Donate Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
