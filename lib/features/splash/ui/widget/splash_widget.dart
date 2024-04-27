import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/auth/ui/screens/login_screen.dart';
import 'package:ecommerce_app/features/splash/cubit/start_up_cubit.dart';
import 'package:ecommerce_app/screens/bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../model/start_data.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<StartUpCubit, CommonState>(
        listener: (context, state) {
          if (state is CommonSuccessState<StartUpData>){
            if (state.data.isLoggedIn){
              Navigator.of(context).pushAndRemoveUntil(
                    PageTransition(
                      child: const BottomNavBarScreen(),
                      type: PageTransitionType.fade,
                    ),
                    (route) => false);

            }else{
            Navigator.of(context).pushAndRemoveUntil(
                    PageTransition(
                      child: const LoginScreen(),
                      type: PageTransitionType.fade,
                    ),
                    (route) => false);
            }
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset("lib/assets/ecommerce1.png"),
            ),
            Text(
              "Ecommerce",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
