import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/mainScreen/mainScreen.dart';

class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  @override
  Widget build(BuildContext context) {
    TextEditingController namecont = TextEditingController();
    TextEditingController passcont = TextEditingController();
    var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              height: he * .6,
              margin: EdgeInsets.only(top: he * .07),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: he * .05,
                  ),
                  fieldbuilder(
                      wi,
                      he,
                      'نام کاربری',
                      icon: Icons.person,
                      namecont,
                      25,
                      inputtype: TextInputType.text,
                      obscured: false),
                  SizedBox(
                    height: he * .03,
                  ),
                  fieldbuilder(
                      wi,
                      he,
                      'رمز عبور',
                      icon: Icons.lock,
                      passcont,
                      50,
                      inputtype: TextInputType.text,
                      obscured: true),
                  SizedBox(
                    height: he * .05,
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (c) => mainScreen()));
                    },
                    child: Container(
                      constraints: BoxConstraints(
                          minHeight: he * .08, minWidth: wi * .085),
                      margin: EdgeInsets.symmetric(horizontal: wi * .38),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10,
                                offset: Offset(5, 5))
                          ]),
                      child: Center(
                        child: Text(
                          'ورود',
                          style: TextStyle(
                              fontFamily: 'ir-sans', fontSize: wi * .05),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget fieldbuilder(
      var wi, var he, String label, TextEditingController cont, int mxlength,
      {IconData? icon, TextInputType? inputtype, bool obscured = false}) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: wi * .1),
        child: TextField(
            maxLength: mxlength,
            obscureText: obscured,
            keyboardType: inputtype,
            textInputAction: TextInputAction.none,
            controller: cont,
            cursorColor: Colors.grey,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  icon,
                  color: Colors.pink[300],
                ),
                labelStyle:
                    TextStyle(color: Colors.pink[400], fontFamily: 'ir-sans'),
                label: Text(label),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)))),
      ),
    );
  }
}
