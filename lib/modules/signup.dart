import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    TextEditingController namecont = TextEditingController();
    TextEditingController passcont = TextEditingController();
    TextEditingController mailcont = TextEditingController();
    TextEditingController phonecont = TextEditingController();
    var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: ListView(children: <Widget>[
          SizedBox(
            height: he * .08,
          ),
          fieldbuilder(wi, he, 'UserName', namecont, 20,
              icon: Icons.person, inputtype: TextInputType.name),
          SizedBox(
            height: he * .05,
          ),
          fieldbuilder(wi, he, 'Email', mailcont, 60,
              icon: Icons.email_outlined,
              inputtype: TextInputType.emailAddress),
          SizedBox(
            height: he * .05,
          ),
          fieldbuilder(wi, he, 'Phone Number', phonecont, 11,
              icon: Icons.phone_android_outlined,
              inputtype: TextInputType.phone),
          SizedBox(
            height: he * .05,
          ),
          fieldbuilder(wi, he, 'Password', passcont, 50,
              icon: Icons.lock_open_outlined,
              inputtype: TextInputType.name,
              obscured: true),
          SizedBox(
            height: he * .05,
          ),
          Container(
            constraints: BoxConstraints(minHeight: he * .09, minWidth: wi * .3),
            margin: EdgeInsets.symmetric(horizontal: wi * .18),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 10, offset: Offset(5, 5))
                ]),
            child: Center(
              child: InkWell(
                onTap: () {},
                child: Text('Register'),
              ),
            ),
          ),
          SizedBox(
            height: he * .05,
          ),
        ]),
      )),
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
