// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:flutter/material.dart';

class CustomOrder extends StatelessWidget {
  final String title;
  final String money;
  final String image;
  final String process;
  // void Function()? onPressed;
  // void Function()? onTap;
   const CustomOrder({
    Key? key,
    required this.title,
    required this.money,
    required this.image, 
    required this.process,
    // this.onPressed,
    // this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        color: const Color(0xFFDFDFDF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10,),
          child: Row(
            children: [
              Image.asset( image,            //"lib/assets/dribble1.png"
              height: 60,
              width: 60,
              fit: BoxFit.cover,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,
                      ),
                      ),
                      const SizedBox(height: 5,),
                      Text(money,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600,
                      ),
                      ),
                      const SizedBox(height: 5,),
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                           color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        child: Text(process,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600,
                      ),
                      ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
