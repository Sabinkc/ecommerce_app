import 'package:ecommerce_app/custom_widget/custom_rounded_buttom.dart';
import 'package:ecommerce_app/features/cart/ui/screens/cart_screen.dart';
import 'package:flutter/material.dart';


class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
   // final height = MediaQuery.of(context).size.height;
     final weight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade500,
        centerTitle: true,
        // leading: const BackButton(
        //   color: Color.fromARGB(255, 47, 46, 46),
        // ),

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.grey.shade800,)),
        title: Text("Product Detail",
        style: TextStyle(
          color: Colors.grey.shade800,
          fontSize: 18,
        ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: weight,
              height: 250,
             child: Image.asset("lib/assets/dribble1.png",
            height: 250.0,
            width: weight,
            fit: BoxFit.cover,
            ),
            ),
         
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15, bottom: 5),
              child: Text("Brand name",
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey.shade500,
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                    child: Text("picture name",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                  ),
                  Text("2000000",
                  style: TextStyle(
                fontSize: 13.0,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
                  ),
                ],
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text("description /n Color is a crucial feature of someone’s dress. In most cases, we describe clothes in terms of their color. The most common colors of clothes are red, black, yellow, brown, blue, green, white, grey, pink, etc.",
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey.shade500,
              ),
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomRoundedButton(
                  title: "+ Add to Cart",
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const CartScreen()));
                  },
                  ),
              ),
            ),
      
      
            //   Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: Expanded(
            //     child: Align(
            //       alignment: Alignment.bottomCenter,
            //       child: ElevatedButton(
            //         child: Text("+Add to Cart"),
            //         onPressed: (){},
            //         ),
            //     ),
            //   ),
            // ),
      
      
          ],
        ),
      ),
    );
  }
}