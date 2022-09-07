import 'package:flutter/material.dart';

class books extends StatefulWidget {
  const books({Key? key}) : super(key: key);

  @override
  State<books> createState() => _booksState();
}

class _booksState extends State<books> {
  late PageController cont;
  var current = 0;
  @override
  void initState() {
    // TODO: implement initState
    cont = PageController(viewportFraction: 0.8);
    cont.addListener(() {
      int next = cont.page!.round();
      if (current != next) {
        setState(() {
          current = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(current);
    var he = MediaQuery.of(context).size.height;
    var wi = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: he,
          width: wi,
          child: Stack(children: <Widget>[
            Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(top: he * .3),
                  height: he * .4,
                  width: wi,
                  child: PageView.builder(
                      controller: cont,
                      itemCount: 10,
                      itemBuilder: (c, i) {
                        bool active = i == current;
                        return buildpage(active, i, he, wi);
                      }),
                ))
          ]),
        ),
      ),
    );
  }

  buildpage(bool active, int i, var he, var wi) {
    var top = active ? he * .02 : he * .1;
    Color shadowcolor = active
        ? Color(0xff7c9998).withOpacity(.5)
        : Colors.black.withOpacity(0.7);
    double blur = active ? 20 : 5;

    double offset = active ? 10 : 4;
    return AnimatedContainer(
      duration: Duration(microseconds: 500),
      curve: Curves.easeIn,
      margin: EdgeInsets.only(
          top: top, right: wi * .04, left: wi * .04, bottom: he * .01),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: shadowcolor,
                blurRadius: blur,
                offset: Offset(offset, offset))
          ]),
    );
  }
}
