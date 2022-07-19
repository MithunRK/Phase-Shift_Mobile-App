import 'package:flutter/material.dart';
//import 'package:carousel_slider/carousel_slider.dart';
//import 'reusable_card.dart';
//import 'constant.dart';

class CarousalSlider extends StatelessWidget {


  String imgPath;
  CarousalSlider({@required this.imgPath});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox.expand(
        child: FittedBox(
            fit: BoxFit.fill,
          child: Image.asset(imgPath,),
            ),
      ),
      );
    }
}



      /*ListView(
      children: <Widget>[
        Text(
          'Gallery',
          style: kTextStyle1,
        ),

        CarouselSlider(
          items: [
            //1st Image of Slider
            ReusableCard(imgNumber: 1),

            //2nd Image of Slider
            ReusableCard(imgNumber: 2),

            //3rd Image of Slider
            ReusableCard(imgNumber: 3),

            //4th Image of Slider
            ReusableCard(imgNumber: 4),

            //5th Image of Slider
            ReusableCard(imgNumber: 4),
          ],

          //Slider Container properties
          options: CarouselOptions(
            height: 180.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration:
            const Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        ),
      ],
    );*/


