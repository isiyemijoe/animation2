import 'package:animation2/animations/fadeAnimation.dart';
import 'package:animation2/animations/my_themes.dart';
import 'package:animation2/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Roboto"),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  bool _textVisible = true;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    animation =
        Tween<double>(begin: 1.0, end: 25.0).animate(animationController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Future.delayed(Duration(milliseconds: 500)).then((value) =>
                  {animationController.reset(), _textVisible = true});
            }
          });
  }

  onTap() {
    setState(() {
      _textVisible = false;
    });
    animationController.forward().then((value) => {
          Navigator.push(context,
              PageTransition(child: HomePage(), type: PageTransitionType.fade))
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage("assets/two.jpg"))),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.9),
            Colors.black.withOpacity(0.8),
            Colors.black.withOpacity(0.2),
          ],
        )),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeAnimation(
                delay: 0.5,
                child: Text(
                  "Taking order for delivery",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FadeAnimation(
                delay: 1,
                child: Text(
                  "See restaurants nearby \nby scanning",
                  style:
                      TextStyle(color: Colors.white, height: 1.4, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              FadeAnimation(
                delay: 1.2,
                child: ScaleTransition(
                  scale: animation,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [Colors.yellow, Colors.orange])),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: AnimatedOpacity(
                        opacity: _textVisible ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 50),
                        child: MaterialButton(
                          splashColor: Colors.amber,
                          height: 50,
                          minWidth: double.infinity,
                          onPressed: () => onTap(),
                          child: Text(
                            "Start",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FadeAnimation(
                delay: 1.4,
                child: AnimatedOpacity(
                  opacity: _textVisible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 50),
                  child: Align(
                    child: Text(
                      "Fast delivery within 24 hrs",
                      style: TextStyle(
                          color: Colors.white70, height: 1.4, fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }
}
