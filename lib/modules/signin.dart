import 'package:flutter/material.dart';

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
          child: Container(
            height: he * .6,
            margin: EdgeInsets.only(top: he * .07),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                fieldbuilder(
                    wi,
                    he,
                    'UserName',
                    icon: Icons.person,
                    namecont,
                    25,
                    inputtype: TextInputType.text,
                    obscured: false),
                fieldbuilder(
                    wi,
                    he,
                    'PassWord',
                    icon: Icons.lock,
                    passcont,
                    50,
                    inputtype: TextInputType.text,
                    obscured: true),
                Container(
                  constraints:
                      BoxConstraints(minHeight: he * .09, minWidth: wi * .3),
                  margin: EdgeInsets.symmetric(horizontal: wi * .18),
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
                    child: InkWell(
                      onTap: () {},
                      child: Text('Enter'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget fieldbuilder(
      var wi, var he, String label, TextEditingController cont, int mxlength,
      {IconData? icon, TextInputType? inputtype, bool obscured = false}) {
    return Container(
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
                  TextStyle(color: Colors.pink[400], fontFamily: 'sans'),
              label: Text(label),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)))),
    );
  }
}
