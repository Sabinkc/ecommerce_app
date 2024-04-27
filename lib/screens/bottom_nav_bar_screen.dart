import 'package:ecommerce_app/common/utils/snackbar_utils.dart';
import 'package:ecommerce_app/features/auth/resources/user_repository.dart';
import 'package:ecommerce_app/features/auth/ui/screens/login_screen.dart';
import 'package:ecommerce_app/features/cart/ui/screens/cart_screen.dart';
import 'package:ecommerce_app/features/homepage/ui/screens/home_page.dart';
import 'package:ecommerce_app/features/order/ui/screens/order_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
   final PageController _pageController = PageController();
   int _selectedIndex =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade500,
        title: Text("ecommerce",
        style: TextStyle(
          fontSize: 20,
          color: Colors.grey.shade800,
        ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await RepositoryProvider.of<UserRepository>(context).logout();
              if (context.mounted) {}
              SnackbarUtils.showSnackBar(context: context, message: "Logout Successfully");
              Navigator.pushAndRemoveUntil(
                context, 
                PageTransition(
                  child: const LoginScreen(), 
                  type: PageTransitionType.fade), 
                (route) => false);
            }, 
            icon: Icon(Icons.logout, size: 25, color: Colors.grey.shade800,),
            ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (currentIndex) {
          setState(() {
            _selectedIndex = currentIndex;
          });
        },
        children: const [
          HomePage(),
          CartScreen(),
          OrderScreen(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        
        onTap: (currentIndex) {
          setState(() {
            _selectedIndex = currentIndex;
          });

          _pageController.animateToPage(
            currentIndex, 
            duration: const Duration(milliseconds: 300), 
            curve: Curves.linear,
            );
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 25, color: Colors.grey.shade600,),
          label: "Home",
          
          ),

           BottomNavigationBarItem(icon: Icon(Icons.card_travel, size: 25, color: Colors.grey.shade600,),
          label: "Cart",
          ),

          BottomNavigationBarItem(icon: Icon(Icons.online_prediction_rounded, size: 25, color: Colors.grey.shade600,),
          label: "Order",
          ),
        ]
        ),

    );
  }
}