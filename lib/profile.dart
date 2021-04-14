import 'package:animation2/account_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'animations/fadeAnimation.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: FadeAnimation(
              delay: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              )),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                  delay: 1,
                  child: Text(
                    "Settings",
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                  delay: 1.2,
                  child: Text(
                    "Account",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: AccountPage(),
                            type: PageTransitionType.bottomToTop));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            FadeAnimation(
                              delay: 1.3,
                              child: CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.grey.shade200,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FadeAnimation(
                                  delay: 1.4,
                                  child: Text(
                                    "Isiyemi Joseph",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                FadeAnimation(
                                  delay: 1.5,
                                  child: Text(
                                    "Personal Info",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade500,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        FadeAnimation(
                          delay: 1.6,
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade200),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black87,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                  delay: 1.3,
                  child: Text(
                    "Settings",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
                  ),
                ),
                buildTile(
                    color: Colors.orange,
                    icon: Icons.language,
                    title: "Language",
                    value: "English",
                    withAction: true),
                buildTile(
                    color: Colors.blue,
                    icon: Icons.notifications,
                    title: "Notifications",
                    value: "",
                    withAction: true),
                buildTile(
                    color: Colors.deepPurple,
                    icon: Icons.nightlight_round,
                    title: "Dark Mode",
                    value: "",
                    withAction: true),
                buildTile(
                    color: Colors.redAccent,
                    icon: Icons.support,
                    title: "Support",
                    value: "",
                    withAction: true)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTile(
      {Color color,
      IconData icon,
      String title,
      String value,
      bool withAction = false}) {
    return FadeAnimation(
      delay: 1.4,
      child: MaterialButton(
        splashColor: color.withOpacity(0.5),
        padding: EdgeInsets.zero,
        onPressed: () {},
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 8, 8, 8),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: color.withOpacity(0.3)),
                    child: Icon(
                      icon,
                      color: color,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  FadeAnimation(
                    delay: 1.3,
                    child: Text(
                      title ?? "",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
              FadeAnimation(
                delay: 1.6,
                child: Row(
                  children: [
                    Text(
                      value ?? "",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    if (withAction)
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade200),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black87,
                          size: 16,
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
