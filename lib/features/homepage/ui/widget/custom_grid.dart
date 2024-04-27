import 'package:flutter/material.dart';

class CustomGrid extends StatelessWidget {
final String image;
final String title;
final String money;
final String star;
 final void Function ()? onPressed;

  const CustomGrid({super.key,
  required this.image,
  required this.title, 
  required this.money, 
  required this.star, 
  this.onPressed, 
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
               child: Container(
                decoration: BoxDecoration(
                   color: Colors.grey.shade300,
                ),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10,),
               
                child: Column(
                  children: [
                     Image.network( image,            //"lib/assets/dribble1.png"
                height: 120,
                width: 120,
                fit: BoxFit.cover,
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text( title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
                ),
                Text( money,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
                ),
                      ],
                    ),
                    Text( star,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
                ),
                           
                  ],
                ),
                
                  ],
                ),
               ),
             ),
    );
  }
}