import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/signin.dart';
import 'package:flutter_application_1/modules/signup.dart';

class signupin extends StatefulWidget {
  const signupin({Key? key}) : super(key: key);

  @override
  State<signupin> createState() => _signupinState();
}

class _signupinState extends State<signupin>
    with SingleTickerProviderStateMixin<signupin> {
  late TabController cont;
  @override
  void initState() {
    cont = TabController(length: 2, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;
    var wi = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Container(
            margin:
                EdgeInsets.only(top: he * .05, left: wi * .08, right: wi * .08),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      color: Colors.grey,
                      spreadRadius: 2,
                      offset: Offset(2, 2))
                ]),
            child: TabBar(
                controller: cont,
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.grey[900],
                labelStyle: TextStyle(
                  fontFamily: 'ir-sans',
                ),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.pink[200],
                tabs: <Widget>[
                  Tab(
                    child: Text('ورود'),
                  ),
                  Tab(
                    child: Text('ثبت نام'),
                  )
                ]),
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(top: he * 0.05),
            child: TabBarView(
              controller: cont,
              children: <Widget>[signin(), signup()],
            ),
          ))
        ],
      )),
    );
  }
}
