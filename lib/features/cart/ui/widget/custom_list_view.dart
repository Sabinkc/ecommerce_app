// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:flutter/material.dart';

class CustomListView extends StatefulWidget {
  final String title;
  final String money;
  final String image;
  // void Function()? onPressed;
  // void Function()? onTap;
   const CustomListView({
    Key? key,
    required this.title,
    required this.money,
    required this.image,
    // this.onPressed,
    // this.onTap,
  }) : super(key: key);

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  int _counter = 1;

  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter(){
    setState(() {
      _counter--;
    });
  }
  @override
  Widget build(BuildContext context) {
    //int count =1;
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
              Image.asset( widget.image,            //"lib/assets/dribble1.png"
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
                      Text( widget.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,
                      ),
                      ),
                      const SizedBox(height: 5,),
                      Text(widget.money,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600,
                      ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: (){
                      if(_counter == 1){
                        return;
                      }else{
                        return _decrementCounter();
                      }
                    },
                     icon: Icon(Icons.remove, color: Colors.grey.shade700,)),
                  Text("$_counter",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                  ),
                  ),
                  IconButton(
                    onPressed: _incrementCounter,
                     icon: Icon(Icons.add, color: Colors.grey.shade700, )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
