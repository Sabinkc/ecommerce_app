import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/common/utils/snackbar_utils.dart';
import 'package:ecommerce_app/custom_widget/custom_icon_buttom.dart';
import 'package:ecommerce_app/custom_widget/custom_outline_button.dart';
import 'package:ecommerce_app/custom_widget/custom_rounded_buttom.dart';
import 'package:ecommerce_app/features/auth/cubit/login_cubit.dart';
import 'package:ecommerce_app/features/auth/model/user.dart';
import 'package:ecommerce_app/screens/bottom_nav_bar_screen.dart';

import 'package:ecommerce_app/features/auth/ui/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../custom_widget/custom_text_form_field.dart';

class LoginWidgets extends StatefulWidget {

  const LoginWidgets({super.key});

  @override
  State<LoginWidgets> createState() => _LoginWidgetsState();
}

class _LoginWidgetsState extends State<LoginWidgets> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController _phoneNumberController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final weight = MediaQuery.of(context).size.height;
    return LoadingOverlay(
      isLoading: _isLoading,
      child: Scaffold(
        body: BlocListener<LoginCubit, CommonState>(
          listener: (context, state) {
            if(state is CommonLoadingState){
              setState(() {
                _isLoading = true;
              });
            }else{
              setState(() {
                _isLoading = false;
              });
            }
            if(state is CommonSuccessState<User>){
              Navigator.of(context).pushAndRemoveUntil(
                PageTransition(
                  child: const BottomNavBarScreen(), 
                  type: PageTransitionType.fade), 
                (route) => false,
                );
                SnackbarUtils.showSnackBar(context: context, message: "login successfully");
            }else if(state is CommonErrorState){
              SnackbarUtils.showSnackBar(context: context, message: state.message);
            }
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
              child: Column(
                //  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Create an Account',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black45,
                          fontSize: 25)),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('Please fill Login form below',
                      style: TextStyle(color: Colors.black45, fontSize: 18)),
                  const SizedBox(
                    height: 40,
                  ),
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          label: "email@gmail.com",
                          validator: (value) {
                            if (value == null) {
                              return "Please Fill the email";
                            } else if (value.isEmpty) {
                              return "Please Fill the email ";
                            } else {
                              return null;
                            }
                          },
                        ),
                        CustomTextFormField(
                          controller: _phoneNumberController,
                          keyboardType: TextInputType.phone,
                          label: "Phone Number",
                          validator: (value) {
                            if (value == null) {
                              return "Please Fill the phone number";
                            } else if (value.isEmpty) {
                              return "Please Fill the phone number ";
                            } else {
                              return null;
                            }
                          },
                        ),
                        CustomTextFormField(
                          controller: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          label: "Password",
                          validator: (value) {
                            if (value == null) {
                              return "Please Fill the password";
                            } else if (value.isEmpty) {
                              return "Please Fill the password ";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomRoundedButton(
                    title: "Login",
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        context.read<LoginCubit>().login(
                              password: _passwordController.text,
                              email: _emailController.text,
                            );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Divider(
                        thickness: 5.0,
                        color: Colors.black,
                      ),
                      Text("Don't have an account Please!"),
                      Divider(
                        thickness: 2.0,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomOutlineButton(
                    tittle: "Sign Up",
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUpScreen()));
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIconButton(
                        onPressed: () {},
                        colors: Colors.blue,
                        icon: Icons.facebook,
                        iconSize: 25,
                      ),
                      CustomIconButton(
                        onPressed: () {},
                        colors: Colors.blueGrey,
                        icon: Icons.email,
                        iconSize: 25,
                      ),
                      CustomIconButton(
                        onPressed: () {},
                        colors: Colors.blueGrey,
                        icon: Icons.ios_share,
                        iconSize: 25,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
