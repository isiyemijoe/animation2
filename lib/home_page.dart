import 'package:animation2/animations/fadeAnimation.dart';
import 'package:animation2/profile.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int currentIndex = 0;
  List<String> pages = [
    "assets/one.jpg",
    "assets/two.jpg",
    "assets/three.jpg",
    "assets/four.jpg",
    "assets/five.jpg",
    "assets/six.jpg",
    "assets/seven.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: IconButton(
                icon: Icon(
                  Icons.person_rounded,
                  color: Colors.grey.shade800,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: Profile(),
                          type: PageTransitionType.topToBottom));
                }),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeAnimation(
                      delay: 1,
                      child: Text(
                        "Food Delivery",
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        FadeAnimation(
                            delay: 1,
                            child:
                                makeCategory(isActive: true, title: "Pizza")),
                        FadeAnimation(
                            delay: 1.3,
                            child:
                                makeCategory(isActive: false, title: "Burger")),
                        FadeAnimation(
                            delay: 1.4,
                            child: makeCategory(
                                isActive: false, title: "Desserts")),
                        FadeAnimation(
                            delay: 1.5,
                            child: makeCategory(
                                isActive: false, title: "Fish Roll")),
                        FadeAnimation(
                            delay: 1.6,
                            child:
                                makeCategory(isActive: false, title: "Salads"))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            FadeAnimation(
                delay: 1,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Free Delivery",
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            FadeAnimation(
              delay: 1.3,
              child: IntrinsicHeight(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.0),
                    child: CarouselSlider(
                      items: pages
                          .map(
                            (e) => Builder(
                              builder: (BuildContext context) {
                                return makeItem(image: e);
                              },
                            ),
                          )
                          .toList(),
                      options: CarouselOptions(
                        aspectRatio: 1 / 1.4,
                        viewportFraction: 0.79,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        // autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        onPageChanged: onPageChanged,

                        scrollDirection: Axis.horizontal,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onPageChanged(index, carouselPageChangedReason) {
    currentIndex = index;
    setState(() {});
    print(carouselPageChangedReason);
  }

  makeCategory({bool isActive, String title}) {
    return AspectRatio(
      aspectRatio: isActive ? 3 : 2.5 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isActive ? Colors.yellow.shade700 : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: isActive ? Colors.white : Colors.grey,
                fontSize: 18,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w100),
          ),
        ),
      ),
    );
  }

  makeItem({String image}) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(right: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(begin: Alignment.bottomCenter, stops: [
                .2,
                .9
              ], colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.3)
              ])),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "\$ 15.00",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Vegetarian Pizza",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
