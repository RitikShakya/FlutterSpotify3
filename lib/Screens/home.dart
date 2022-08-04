

import 'package:flutter/material.dart';
import 'package:spotify_app/Services/music_operations.dart';

import '../Modals/Music.dart';
import '../Modals/catergory.dart';
import '../Services/category_operations.dart';

class Home extends StatelessWidget {
  //const Home({Key? key}) : super(key: key);

  Function _miniPlayer;

  Home(this._miniPlayer);

  // to provide the grid view with individual rows for categories
  Widget createCategory(Category category){
    return Container(  // to contain the row
      padding: EdgeInsets.all(5),
      color: Colors.blueGrey.shade400,
      child: Row( // have a image and a text
        children: [
          Image.network(category.imageurl),
          Text(category.name ,style: TextStyle(color: Colors.white),),

        ],

      ),
    );

  }

  // getting the categories
  List<Widget> createListOfCategory(){
    List<Category> categorylist = CategoryOperations.getCategoris(); // get category and put it in the list
    // convert the data recieved into list of widget using map function  data to widget conversion
    List<Widget> listWidget =categorylist.map((Category category) => createCategory(category)).toList();
    return listWidget;
  }
  // for the grid created under the app bar
  Widget createGrid(){
    return Container(  // put the grid to set the size of the grid
      height: 200,
      //padding: EdgeInsets.only(bottom: 10),
      margin: EdgeInsets.only(bottom: 30),
      child: GridView.count(
        childAspectRatio: 6/2, // to provide the size of the category
        crossAxisSpacing: 10,
        mainAxisSpacing: 2,// spacing between categories

        children: createListOfCategory(), // instead of array use list
        crossAxisCount: 2,  // so that it shows in 2 cells

      ),
    );
  }

  // for the staring top bar with goodmorning and the settings
  Widget createAppBar(String message){
    return AppBar(
      title: Text(message),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
       actions: [Padding(
           padding: EdgeInsets.only(right: 10),
           child: Icon(Icons.settings))],
    );
  }

  Widget createMusic(Music music){
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(

        children: [

               Container(
                 height: 150,
                 width: 200,
                 child: InkWell(
                   onTap: (){
                     _miniPlayer(music, stop: true);
                   },
                   child: Image.network(music.image,
                    fit: BoxFit.cover,
              ),
                 ),
               ),

          Text(music.name,  style: TextStyle(color: Colors.white, fontSize: 12),),
          Text(music.details,style: TextStyle(color: Colors.white, fontSize: 12),)
        ],

      ),
    );
  }




Widget createMusicList(String Label){  //Good for you create a horizontal list
    List<Music> musicList = Music_Opertaions.getMusic();
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Label,
          style: TextStyle(color: Colors.white , fontSize: 20, fontWeight: FontWeight.bold) ,

        ),


        Container(
        height: 220,


        child: ListView.builder(
          //padding: EdgeInsets.all(5),
                 scrollDirection : Axis.horizontal,
            itemBuilder: (ctx,index){

          return createMusic(musicList[index]);  // to get the music item from the
                                                 // musiclist with the specified index and will create the clumn for that muic

        },itemCount: musicList.length,
        ),
      )],
    );

}
  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: SafeArea(   // so that the content is placed properly
          child: Container(  // container is like a box which contains everything
            child: Column(
              children:[
                createAppBar('Good Morning'),
              SizedBox(
                height: 5,
              ),
                createGrid(),
                createMusicList('Music For You'),
                createMusicList('Popular Playlist')
              ],


            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(  // tp provide the color gradient on the screen
                  colors: [Colors.grey.shade500,Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1,0.3] // the ratio in which it is to be given

              )
            ),

          )),
    );
  }
}
