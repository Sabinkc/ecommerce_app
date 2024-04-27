import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlidable extends StatelessWidget {
  const CustomCarouselSlidable({super.key});

  @override
  Widget build(BuildContext context) {
     CarouselController carouselController = CarouselController();
    // final weight = MediaQuery.of(context).size.height;
    return CarouselSlider(
      carouselController: carouselController,
      
  options: CarouselOptions(
    height: 150.0,
 // aspectRatio: 16/9,
      viewportFraction: 1.0,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
     autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
     autoPlayAnimationDuration: const Duration(milliseconds: 800),
     autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      enlargeFactor: 0.5,
     // onPageChanged: callbackFunction,
      scrollDirection: Axis.horizontal,
  ),
  items: [
    Image.asset( "lib/assets/ecommerce1.png",  
    height: 120,
    width: 120,  
              fit: BoxFit.cover,
              ),
     Image.asset( "lib/assets/ecommerce1.png",    
              fit: BoxFit.cover,
              ),
    1,2,3,4,5].map((i) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          //margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text('text $i', style: const TextStyle(fontSize: 16.0),)
        );
      },
    );
  }).toList(),
);
}
}