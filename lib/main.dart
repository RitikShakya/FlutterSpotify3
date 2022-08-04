import 'package:flutter/material.dart';
import 'package:spotify_app/Screens/app.dart';

void main(){
  
  runApp(MaterialApp(  //  run app to run anything on the top. two types pf theme  1- materail  2- copertino for ios . provides a container , a box

    debugShowCheckedModeBanner: false,
    title: 'My Spotify CLone',
    home: MyApp()
  ));

}