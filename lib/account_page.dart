import 'package:animation2/animations/fadeAnimation.dart';
import 'package:flutter/material.dart';

import 'animations/TransitionBottomTop.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int genderIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: BottomTopAnimation(
                          delay: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.close,
                              color: Colors.black,
                              size: 26,
                            ),
                          )),
                    ),
                    BottomTopAnimation(
                      delay: 1,
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 10,
                                  color: Colors.grey.withOpacity(0.2))
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.lightBlue),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: BottomTopAnimation(
                  delay: 1.1,
                  child: Text(
                    "Account",
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BottomTopAnimation(
                      delay: 1.2,
                      child: Text(
                        "Photo",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          BottomTopAnimation(
                            delay: 1.3,
                            child: CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.grey.shade100,
                                child: Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.grey.shade400,
                                )),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          BottomTopAnimation(
                            delay: 1.3,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Upload Image",
                                style: TextStyle(
                                    color: Colors.lightBlue, fontSize: 18),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BottomTopAnimation(
                      delay: 1.4,
                      child: Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          BottomTopAnimation(
                            delay: 1.5,
                            child: Text(
                              "Joseph Isiyemi",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.70),
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          BottomTopAnimation(
                            delay: 1.5,
                            child: Divider(
                              indent: 70,
                              endIndent: 70,
                              color: Colors.grey.shade400,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BottomTopAnimation(
                      delay: 1.6,
                      child: Text(
                        "Gender",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BottomTopAnimation(
                          delay: 1.6,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                genderIndex = 0;
                              });
                            },
                            child: AnimatedContainer(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: genderIndex == 0
                                      ? Colors.purpleAccent
                                      : Colors.grey.shade200),
                              duration: Duration(milliseconds: 350),
                              child: Icon(Icons.accessibility_new,
                                  color: genderIndex == 0
                                      ? Colors.white
                                      : Colors.grey.shade500),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        BottomTopAnimation(
                          delay: 1.6,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                genderIndex = 1;
                              });
                            },
                            child: AnimatedContainer(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: genderIndex == 1
                                      ? Colors.purpleAccent
                                      : Colors.grey.shade200),
                              duration: Duration(milliseconds: 350),
                              child: Icon(
                                Icons.accessible_outlined,
                                color: genderIndex == 1
                                    ? Colors.white
                                    : Colors.grey.shade500,
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BottomTopAnimation(
                      delay: 1.7,
                      child: Text(
                        "Age",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          BottomTopAnimation(
                            delay: 1.7,
                            child: Text(
                              "28",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.70),
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          BottomTopAnimation(
                            delay: 1.8,
                            child: Divider(
                              indent: 70,
                              endIndent: 70,
                              color: Colors.grey.shade400,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BottomTopAnimation(
                      delay: 1.8,
                      child: Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          BottomTopAnimation(
                            delay: 2.1,
                            child: Text(
                              "Josephisiyemi1@gmail.com",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.70),
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          BottomTopAnimation(
                            delay: 2.1,
                            child: Divider(
                              indent: 28,
                              endIndent: 28,
                              color: Colors.grey.shade400,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
