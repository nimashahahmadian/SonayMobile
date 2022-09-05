import 'package:flutter/material.dart';

class itemdtail extends StatefulWidget {
  const itemdtail({Key? key}) : super(key: key);

  @override
  State<itemdtail> createState() => _itemdtailState();
}

class _itemdtailState extends State<itemdtail> {
  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;
    var wi = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: he,
          width: wi,
          child: Center(child: Text('detail')),
        ),
      ),
    );
  }
}
