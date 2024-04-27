import 'package:ecommerce_app/features/cart/ui/widget/custom_list_view.dart';
import 'package:ecommerce_app/custom_widget/custom_rounded_buttom.dart';
import 'package:ecommerce_app/features/checkout/ui/screens/checkout_form.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
   // final height = MediaQuery.of(context).size.height;
     final weight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
           // color: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Text("List Count : 10",
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.grey.shade600,
            ),
            )),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const CustomListView(
                  image: "lib/assets/dribble1.png",
                   money: "200000",
                    title: "Searching of the ecommerce gdg hhgdf jhgf gdhfg"); 
              },
              itemCount: 10,
               ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Card(
             // shadowColor: Colors.black,
               color: Colors.grey.shade300,
              child: SizedBox(
                width: weight,
               height: 100,
               
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 20, right: 15.0,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey.shade600,

                    ),
                    ),
                    

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("2000",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey.shade500,

                    ),),
                        CustomRoundedButton(
                          title: "Check Out",
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CheckoutForm()));
                          },
                          ),
                      ],
                    ),
                  ],
                ),
              ),
             )
            ),
          )
        ],
      ),
    );
  }
}