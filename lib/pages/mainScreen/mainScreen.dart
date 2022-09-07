import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/itemdetail.dart';
import 'package:flutter_application_1/pages/books/books.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  GlobalKey<ScaffoldState> state = GlobalKey();
  var active;
  @override
  void initState() {
    active = 0;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return Scaffold(
      key: state,
      endDrawer: SafeArea(
        child: Container(
          width: wi * .5,
          color: Color.fromARGB(255, 20, 105, 102),
          child: Column(
            children: <Widget>[
              draweritem(label: "home", icon: Icons.home),
              draweritem(
                label: 'Scores',
              ),
              draweritem(label: "Books", icon: Icons.book)
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 10, 109, 106),
      body: SafeArea(
          child: Container(
        height: he,
        width: wi,
        child: ListView(children: <Widget>[
          Container(
            constraints: BoxConstraints(minHeight: he * .15),
            margin:
                EdgeInsets.only(top: he * .01, left: wi * .06, right: wi * .06),
            padding: EdgeInsets.all(wi * .06),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Esteglal',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontFamily: 'sans',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (!state.currentState!.isEndDrawerOpen) {
                        state.currentState!.openEndDrawer();
                      }
                      ;
                    },
                    child: Container(
                      child: Icon(
                        Icons.reorder,
                        color: Colors.white,
                      ),
                    ),
                  )
                ]),
          ),
          Container(
            margin:
                EdgeInsets.only(top: he * .01, left: wi * .06, right: wi * .06),
            height: he * .1,
            child: ListView.builder(
              itemBuilder: (c, i) {
                return InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        active = i;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(he * .01),
                      padding: EdgeInsets.all(he * .01),
                      height: he * .02,
                      width: wi * .32,
                      constraints: BoxConstraints(
                          minWidth: wi * .15, minHeight: he * .03),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: active == i
                              ? Colors.white24
                              : Colors.transparent),
                      child: Center(
                          child: Text(
                        'class$i',
                        style: TextStyle(
                            fontFamily: 'sans',
                            color: active == i
                                ? Colors.white
                                : Colors.blueGrey[900]),
                      )),
                    ));
              },
              itemCount: 10,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            height: he * .64,
            margin: EdgeInsets.only(top: he * .05),
            child: ListView.builder(
              itemBuilder: (c, i) {
                return Container(
                  margin: EdgeInsets.all(wi * .05),
                  width: wi * .1,
                  height: he * .3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: he * .02,
                          color: Colors.grey,
                          spreadRadius: 0.6)
                    ],
                    color: i.isEven
                        ? Colors.brown[200]?.withOpacity(0.5)
                        : Color.fromARGB(80, 10, 109, 106),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (c) => itemdtail()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: wi * .01),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              width: wi * .4,
                              margin: EdgeInsets.only(
                                  left: wi * .03,
                                  top: he * .02,
                                  bottom: he * .02),
                              child: Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      'title$i',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'sans',
                                          color:
                                              Color.fromARGB(80, 10, 109, 106)),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'hellow this mightt be some',
                                      style: TextStyle(
                                          color: Colors.blueGrey[800],
                                          fontFamily: 'sans '),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      'price\$',
                                      style: TextStyle(
                                          color: Colors.brown[300],
                                          fontFamily: 'sans'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: wi * .4,
                              margin: EdgeInsets.only(
                                  top: he * .02,
                                  bottom: he * .02,
                                  right: wi * .03),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        'http://sahand-esteglal.ir/media/products/bNone-First_Friends_1.jpg')),
                              ),
                            )
                          ]),
                    ),
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
        ]),
      )),
    );
  }

  Widget draweritem({required String label, IconData? icon}) {
    var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        label == 'Books'
            ? Navigator.of(context)
                .push(MaterialPageRoute(builder: (c) => books()))
            : Navigator.of(context).pop();
      },
      child: Container(
        // padding: EdgeInsets.all(wi * .03),
        padding: EdgeInsets.symmetric(horizontal: wi * .02),
        margin: EdgeInsets.only(left: wi * .08, right: wi * .08, top: he * .05),
        height: he * .08,
        width: wi * .4,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            icon != null
                ? Container(
                    child: Icon(icon),
                  )
                : Container(color: Colors.black),
            Container(
              child: Text(
                label,
                style: TextStyle(fontFamily: 'sans'),
              ),
              margin: icon == null
                  ? EdgeInsets.only(right: wi * .02)
                  : EdgeInsets.only(left: wi * .01),
            ),
          ],
        )),
      ),
    );
  }
}
