import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/custom_widget/custom_outline_button.dart';
import 'package:ecommerce_app/custom_widget/custom_rounded_buttom.dart';
import 'package:ecommerce_app/features/auth/cubit/register_cubit.dart';
import 'package:ecommerce_app/features/auth/ui/screens/login_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../custom_widget/custom_text_form_field.dart';

class SignUpWidgets extends StatefulWidget {
  const SignUpWidgets({super.key});

  @override
  State<SignUpWidgets> createState() => _SignUpWidgetsState();
}

class _SignUpWidgetsState extends State<SignUpWidgets> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // SignUpWidgets({super.key});
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final weight = MediaQuery.of(context).size.height;

    return LoadingOverlay(
      isLoading: _isLoading,
      child: BlocListener<RegisterCubit, CommonState>(
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
          if(state is CommonErrorState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)),);
          }
          if(state is CommonSuccessState){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("User Register Successfully")),);
            Navigator.of(context).pop();
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Create an Account',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black45,
                          fontSize: 25)),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('Please fill registration form below',
                      style: TextStyle(color: Colors.black45, fontSize: 17)),
                  const SizedBox(
                    height: 40,
                  ),
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: _nameController,
                          label: "Full Name",
                          validator: (value) {
                            if (value == null) {
                              return "Please Fill the full name";
                            } else if (value.isEmpty) {
                              return "Please fill the full name ";
                            } else {
                              return null;
                            }
                          },
                        ),
                        CustomTextFormField(
                          controller: _addressController,
                          label: "Address",
                          validator: (value) {
                            if (value == null) {
                              return "Please Fill the address";
                            } else if (value.isEmpty) {
                              return "Please Fill the address ";
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
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          label: "email@gmail.com",
                          validator: (value) {
                            if (value == null) {
                              return "Please Fill the email";
                            } else if (value.isEmpty) {
                              return "Please Fill the email ";
                            }
                            final isvalid = EmailValidator.validate(value);
                            if (isvalid) {
                              return null;
                            } else {
                              return "Enter valid email address";
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
                        CustomTextFormField(
                          controller: _confirmPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          label: "Confirm-Password",
                          validator: (value) {
                            if (value == null) {
                              return "Please Fill the confirm-password";
                            } else if (value.isEmpty) {
                              return "Please Fill the confirm-password ";
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
                    title: "SignUp",
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginScreen()));
                      if (_formkey.currentState!.validate()) {
                        context.read<RegisterCubit>().register(
                              fullName: _nameController.text,
                              address: _addressController.text,
                              phone: _phoneNumberController.text,
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
                      Text("You have already an account Please!"),
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
                    tittle: "Login",
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                    },
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
