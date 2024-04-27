
// // import 'package:ecommerce_app/screens/cart_screen.dart';
// // import 'package:ecommerce_app/screens/home_page.dart';
// // import 'package:flutter/material.dart';
// // import 'package:google_nav_bar/google_nav_bar.dart';

// // class Example extends StatefulWidget {
// //   @override
// //   _ExampleState createState() => _ExampleState();
// // }

// // class _ExampleState extends State<Example> {
// //   int _selectedIndex = 0;
// //   static const TextStyle optionStyle =
// //       TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
// //   static const List<Widget> _widgetOptions = <Widget>[
    
// //     HomePage(),
// //     CartScreen(),
    
    
// //     // Text(
// //     //   'Home',
// //     //   style: optionStyle,
// //     // ),
// //     // Text(
// //     //   'Likes',
// //     //   style: optionStyle,
// //     // ),
// //     // Text(
// //     //   'Search',
// //     //   style: optionStyle,
// //     // ),
// //     // Text(
// //     //   'Profile',
// //     //   style: optionStyle,
// //     // ),
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       // appBar: AppBar(
// //       //   elevation: 20,
// //       //   title: const Text('GoogleNavBar'),
// //       // ),
// //       body: Center(
// //         child: _widgetOptions.elementAt(_selectedIndex),
// //       ),
// //       bottomNavigationBar: Container(
// //         decoration: BoxDecoration(
// //           color: Colors.white,
// //           boxShadow: [
// //             BoxShadow(
// //               blurRadius: 20,
// //               color: Colors.black.withOpacity(.1),
// //             )
// //           ],
// //         ),
// //         child: Padding(
// //           padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
// //           child: GNav(
// //             rippleColor: Colors.grey[300]!,
// //             hoverColor: Colors.grey[100]!,
// //             gap: 8,
// //             activeColor: Colors.black,
// //             iconSize: 24,
// //             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
// //             duration: Duration(milliseconds: 400),
// //             tabBackgroundColor: Colors.grey[100]!,
// //             color: Colors.black,
// //             tabs: [
// //               GButton(
// //                 icon: Icons.home,
// //                 text: 'Home',
// //               ),
// //               GButton(
// //                 icon: Icons.card_travel,
// //                 text: 'Likes',
// //               ),
              
// //             ],
// //             selectedIndex: _selectedIndex,
// //             onTabChange: (index) {
// //               setState(() {
// //                 _selectedIndex = index;
// //               });
// //             },
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }





































// import 'package:ecommerce_app/screens/cart_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

// import 'home_page.dart';

// class MainPage extends StatefulWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   Color mainColor = const Color(0xFF2631C1);
//   final PersistentTabController _controller =
//       PersistentTabController(initialIndex: 0);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // 
//       body: PersistentTabView(
//         context,
//         controller: _controller,
//         screens:  [
//           HomePage(),
//           CartScreen(),
         
//         ],
//         items: _navBarsItems(),
//          backgroundColor: Colors.grey.shade500,
//        // navBarStyle: NavBarStyle.style1,
//         decoration: NavBarDecoration(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         navBarStyle: NavBarStyle.style1,
        
//       ),
//     );
//   }

//   List<PersistentBottomNavBarItem> _navBarsItems() {
//     return [
//       PersistentBottomNavBarItem(
//         icon: const Icon(CupertinoIcons.home),
//         title: ("Home"),
//         textStyle: TextStyle(fontSize: 18, color: Colors.grey.shade600),
//          activeColorPrimary: Colors.black54,
//          inactiveColorPrimary: Colors.grey.shade600,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(CupertinoIcons.search),
//         title: ("card"),
//         textStyle: TextStyle(fontSize: 18, color: Colors.grey.shade600),
//          activeColorPrimary: Colors.black54,
//          inactiveColorPrimary: Colors.grey.shade600,
//       ),
      
//     ];
//   }
// }


























// // import 'package:ecommerce_app/screens/cart_screen.dart';
// // import 'package:ecommerce_app/screens/home_page.dart';
// // import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
// // import 'package:flutter/material.dart';

// // class PersistentBottomBar extends StatelessWidget {
// //    PersistentBottomBar({super.key});

// //    final controller = PersistentTabController(initialIndex: 0);

// //   List<Widget> _buildScreen() {
// //     return [
// //       const HomePage(),
// //       const CartScreen(),
      
// //     ];
// //   }

// //    List<PersistentBottomNavBarItem> _navBarItem() {
// //     return [
// //       PersistentBottomNavBarItem(
// //         icon: Icon(Icons.home,),
// //         title: "Home",
// //         textStyle: TextStyle(fontSize: 18),
// //         //inactiveIcon: Icon(Icons.home, color: Colors.grey.shade600,)
// //          activeColorPrimary: Colors.black54,
// //          inactiveColorPrimary: Colors.grey.shade600,
// //         ),
// //          PersistentBottomNavBarItem(
// //         icon: Icon(Icons.card_travel),
// //         title: "Cart",
//         // textStyle: TextStyle(fontSize: 18, color: Colors.grey.shade600),
//         //  activeColorPrimary: Colors.black54,
//         //  inactiveColorPrimary: Colors.grey.shade600,
// //         ),
// //     ];
// //    }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: PersistentTabView(
// //         context,
// //         screens: _buildScreen(),
// //         items: _navBarItem(),
// //         controller: controller,
// //         backgroundColor: Colors.grey.shade500,
// //         navBarStyle: NavBarStyle.style1,
// //         decoration: NavBarDecoration(
// //           borderRadius: BorderRadius.circular(10),
// //         ),
// //       ),
// //     );
// //   }
// // }