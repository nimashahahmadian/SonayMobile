import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/mainScreen/mainScreen.dart';
import 'package:http/http.dart' as http;

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController namecont = TextEditingController();
  TextEditingController passcont = TextEditingController();
  TextEditingController emailcont = TextEditingController();
  TextEditingController phonecont = TextEditingController();
  TextEditingController usernamecont = TextEditingController();
  GlobalKey<ScaffoldState> scaff = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: ListView(children: <Widget>[
          SizedBox(
            height: he * .08,
          ),
          fieldbuilder(wi, he, 'نام نام خانوادگی', namecont, 20,
              icon: Icons.person, inputtype: TextInputType.name),
          SizedBox(
            height: he * .03,
          ),
          fieldbuilder(wi, he, 'نام کاربری', usernamecont, 20,
              icon: Icons.person_outline, inputtype: TextInputType.text),
          SizedBox(
            height: he * .03,
          ),
          fieldbuilder(wi, he, 'ایمیل', emailcont, 60,
              icon: Icons.email_outlined,
              inputtype: TextInputType.emailAddress),
          SizedBox(
            height: he * .03,
          ),
          fieldbuilder(wi, he, 'شماره موبایل', phonecont, 11,
              icon: Icons.phone_android_outlined,
              inputtype: TextInputType.phone),
          SizedBox(
            height: he * .03,
          ),
          fieldbuilder(wi, he, 'رمز عبور', passcont, 50,
              icon: Icons.lock_open_outlined,
              inputtype: TextInputType.text,
              obscured: true),
          SizedBox(
            height: he * .05,
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () async {
              print('tapped');

              checker(context);
            },
            child: Container(
              constraints:
                  BoxConstraints(minHeight: he * .08, minWidth: wi * .085),
              margin: EdgeInsets.symmetric(horizontal: wi * .35),
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
                  'ثبت نام',
                  style: TextStyle(fontFamily: 'ir-sans', fontSize: wi * .05),
                ),
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

  checker(BuildContext context) async {
    emailcont.text.trim().isEmpty ||
            namecont.text.trim().isEmpty ||
            phonecont.text.trim().isEmpty ||
            usernamecont.text.trim().isEmpty ||
            passcont.text.trim().isEmpty
        ? showalertdialog(context, 'Error', 'fill in the fields')
        : SaveData();
  }

  SaveData() async {
    print('in save data');
    var url = Uri.https('google.com', '/');
    await http.post(url, headers: {
      "Access-Control-Allow-Origin": "*",
      'Accept': '*/*'
    }, body: {
      'username': usernamecont.text.trim(),
      'name': namecont.text.trim(),
      'phone': phonecont.text.trim(),
      'email': emailcont.text.trim(),
      'pass': passcont.text,
    }).then((res) async {
      var body = await jsonDecode(res.body);
      // ignore: avoid_print
      print(body);
      return body['success']
          ? showalertdialog(context, "Registered", "Regestration complete",
              tap: await Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => mainScreen()))))
          : showalertdialog(context, "User Already exist", "Try signing in");
    });
  }

  showalertdialog(BuildContext context, String Title, String message,
      {Function? tap}) {
    Widget Okbutton = Container(
      child: InkWell(
        child: Center(
          child: Text('OK'),
        ),
        onTap: () {
          if (tap == null) {
            Navigator.of(context).pop();
          } else {
            tap;
          }
          ;
        },
      ),
    );

    AlertDialog alert = AlertDialog(
      buttonPadding: EdgeInsets.all(20),
      contentPadding: EdgeInsets.all(20),
      actionsAlignment: MainAxisAlignment.center,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      actions: [Okbutton],
      title: Text(Title),
      content: Text(message),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
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
