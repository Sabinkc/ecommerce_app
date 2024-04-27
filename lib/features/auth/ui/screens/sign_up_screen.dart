import 'package:ecommerce_app/features/auth/cubit/register_cubit.dart';
import 'package:ecommerce_app/features/auth/resources/user_repository.dart';
import 'package:ecommerce_app/features/auth/ui/widget/signup_widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
        userRepository: RepositoryProvider.of<UserRepository>(context),
      ),
      child: const SignUpWidgets(),
    );
  }
}
