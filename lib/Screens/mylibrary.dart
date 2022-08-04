import 'package:flutter/material.dart';

class MyLibrary extends StatelessWidget {
  const MyLibrary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Text('MyLibrary',style: TextStyle(fontSize:40, color: Colors.yellow)));
  }
}
