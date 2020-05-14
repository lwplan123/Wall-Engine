import 'package:WallEngine/views/imageView.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:WallEngine/model/wallpapermodel.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

      Text(
        "Wall",
        style: TextStyle(color: Colors.white, fontSize: 28, letterSpacing: 3),
      ),
      SizedBox(width: 10),
      Text(
        "Engine",
        style: TextStyle(color: Colors.amber, fontSize: 13, letterSpacing: 3),
      ),
      // Text(
      //   "Powered by PEXELS",
      //   style: TextStyle(color:Colors.white, fontSize: 8, letterSpacing: 2)
      // ),
    ],
  );
}

Widget wallpapersList({List<WallpaperModel> wallpapers, context}) {
  axisCounter(){
    int x=3;
    return x;
  }
  return Container(
    
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(

      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      crossAxisCount: axisCounter(),
      childAspectRatio: 0.6,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      children: wallpapers.map((wallpaper) {
        return GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageView(
                            imgUrl: wallpaper.src.portrait,
                          )));
            },
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: wallpaper.src.portrait,
                  imageBuilder: (context, imageProvider) => Container(
                  child: Hero(                      
                    tag: wallpaper.src.portrait,
                    child: ClipRRect(
                        
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          wallpaper.src.portrait,
                          fit: BoxFit.cover,
                        )
                        ),
                  ),
                ),
                fadeInCurve: Curves.easeIn,
                fadeOutCurve: Curves.easeInOut,
                fadeInDuration: Duration(milliseconds: 2000),
                fadeOutDuration: Duration(milliseconds: 2000),
                placeholder: (context, url) => Center(child: CircularProgressIndicator()), 
                  ),
              ],
            ),
          ),
        );
      }).toList(),
    ),
  );
}



