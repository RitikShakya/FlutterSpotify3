import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart ';
import 'package:spotify_app/Screens/mylibrary.dart';
import 'package:spotify_app/Screens/search.dart';
import '../Modals/Music.dart';



import 'home.dart';

class MyApp extends StatefulWidget {

  //AudioPlayer audioPlayer= new AudioPlayer();
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  AudioPlayer audioPlayer = new AudioPlayer();
  var Tabs =[];
  int currentTabIndex =0;
  bool isPlaying =false;

Music? music;
  Widget createMiniPlayer(Music? music,{ bool stop =false}){

    this.music = music;

    if(music==null){
      return SizedBox();

    }

    if(stop){
      isPlaying= false;
      audioPlayer.stop();

    }
    setState((){});
    var deviceSize =MediaQuery.of(context).size;
    return AnimatedContainer(duration: const Duration(milliseconds: 500)
    ,color: Colors.blueGrey,
    width: deviceSize.width,
    height: 45,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Image.network(music.image ,
        fit: BoxFit.cover,),
      Text(music.name , style: TextStyle(color: Colors.white),
      ),
      IconButton(onPressed: () async{
        isPlaying = !isPlaying;
        if(isPlaying) {
          await audioPlayer.play(UrlSource(music.audioURL));
        }else{
          await audioPlayer.pause();
        }
        setState((){});

      }, icon: isPlaying ?  Icon(Icons.pause, color: Colors.white,) : Icon(Icons.play_arrow, color: Colors.white,))
      
    ],)
      ,);
  }

  @override
  void initState() { // it runs only once stateful widget
    // TODO: implement initState
    super.initState();
    Tabs =[Home(createMiniPlayer),Search(),MyLibrary()];

  }
  @override
  Widget build(BuildContext context) {
 return  Scaffold(
   body: Tabs[currentTabIndex],
      backgroundColor: Colors.black,

      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          createMiniPlayer(music),
          BottomNavigationBar(
            backgroundColor: Colors.black12,
          currentIndex: currentTabIndex,
          onTap: (currentIndex){  // on button pressed
            print("current ta $currentIndex");
            currentTabIndex =currentIndex;
            setState((){}); // re render  start build agaiin for the button pressed
          },

            selectedLabelStyle: TextStyle(color: Colors.white), // based on the item sellected set the title colot
            selectedItemColor: Colors.white,
            items:
          [BottomNavigationBarItem(
              icon: Icon(Icons.home , color: Colors.white,), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search , color: Colors.white,),label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_books , color: Colors.white,),label: 'Library')],
        ),]
      ),
    );
  }
}
