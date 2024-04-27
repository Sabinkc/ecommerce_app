import 'package:ecommerce_app/features/auth/resources/user_repository.dart';
import 'package:ecommerce_app/features/homepage/resources/product_repository.dart';

import 'package:ecommerce_app/features/splash/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
        RepositoryProvider(
          create: (context) => ProductRepository(
            userRepository: RepositoryProvider.of<UserRepository>(context),
          ),
        ),

        
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
            // BottomNavBarScreen(),
            //LoginScreen(),
            const SplashScreen(),
        // OrderScreen(),
        //SignUpScreen(),
        //HomePage(),
        //CartScreen(),
        // DetailScreen(),
        //PersistentBottomBar(),
      ),
    );
  }
}
