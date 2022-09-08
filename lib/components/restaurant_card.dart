import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task/constants.dart';
import 'package:task/helpers/size_config.dart';

class RestaurantCard extends StatelessWidget {
  final String name;
   final String image;
  const RestaurantCard({Key key, this.name, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),

      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
      child: Column(
        children: [
         Stack(
           children: [
             ClipRRect(
                 borderRadius: BorderRadius.all(Radius.circular(10)),
                 child: CachedNetworkImage(imageUrl: image,height: 200,width: double.infinity,fit: BoxFit.cover,)),
             Positioned(
                 bottom: 0,
                 left: 140,
                 child: Align(
                   alignment: Alignment.topCenter,
                   child: Card(
                     color: Colors.white.withOpacity(.6),
                       child: Text(name,style: TextStyle(color: containerColor),)),
                 ))
           ],
         ),

        ],
      ),
      ),
    );
  }
}
