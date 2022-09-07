import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/itemdetail.dart';
import 'package:flutter_application_1/modules/signupin.dart';
import 'package:flutter_application_1/pages/books/books.dart';
import 'package:flutter_application_1/pages/mainScreen/mainScreen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() => runApp(MainScreen());

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((c) => Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (c) => signupin())));
  }

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;
    var wi = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Align(
          alignment: Alignment.center,
          child: AnimatedTextKit(
            isRepeatingAnimation: false,
            animatedTexts: [
              TyperAnimatedText('Esteglal Ins.',
                  textStyle: TextStyle(fontSize: wi * .08, fontFamily: 'sans'))
            ],
          ),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff80ff72), Color(0xff7ee8fa)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
      ),
    );
  }
}
