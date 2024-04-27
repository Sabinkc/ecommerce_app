import 'package:flutter/material.dart';
import '../widget/custom_order.dart';
class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey.shade200,
      
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 10)),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index){
                return const CustomOrder(
                 image: "lib/assets/dribble1.png",
                 money: "200000",
                 title: "Searching ", 
                 process: "Processing",
                  );
              },
              itemCount: 20,
              ),
          ),
        ],
      ),
    );
  }
}